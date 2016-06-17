package productManage.service.production.impl;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.BaseDao;
import productManage.dao.zky.ProductionDao;
import productManage.model.User;
import productManage.model.cs.OutSource;
import productManage.model.lhj.Material;
import productManage.model.lhj.Supply;
import productManage.model.lhj.Vendor;
import productManage.model.tms.Design;
import productManage.model.tms.Technique;
import productManage.model.tyc.Purchase;
import productManage.model.tz.TechniquePhase;
import productManage.model.wcy.Qc;
import productManage.model.wy.AbnormalParameter;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.OrderMaterialDetail;
import productManage.model.yk.Orders;
import productManage.model.yk.SampleOrders;
import productManage.model.yrd.Customer;
import productManage.model.zky.Production;
import productManage.model.zky.Tailor;
import productManage.service.orders.OrdersService;
import productManage.service.PageService;
import productManage.service.production.ProductionService;
import productManage.service.qc.QcService;
import productManage.service.tailor.TailorService;
import productManage.vo.PageBean;
import productManage.vo.orders.OrdersConstants;
import productManage.vo.production.AbnormalParameterVO;
import productManage.vo.production.OrderDetailVO;
import productManage.vo.production.OrderMaterialDetailVO;
import productManage.vo.production.PrintProductionVO;
import productManage.vo.production.ProductionConstants;
import productManage.vo.production.ProductionOListVO;
import productManage.vo.production.ProductionVO;
import productManage.vo.production.TailorVO;

@Service
public class ProductionServiceImpl implements ProductionService {
	@Autowired
	OrdersService orderService;
	@Autowired
	ProductionDao productionDao;
	@Autowired
	PageService pageService;
	@Autowired
	TailorService tailorService;
	@Autowired
	BaseDao baseDao;
	@Autowired
	QcService qcService;

	@Override
	public String addProduction(List<String> orders, User user) {
		try {
			Production production = new Production();
			production.setProductionProgress(ProductionConstants.PRODUCTION_PROGRESS[0]);
			production.setProductionState(ProductionConstants.PRODUCTION_STATE[0]);
			production.setProductionCode(ProductionConstants.getProductionCode());
			productionDao.save(production);

			/**
			 * 根据生产单生成采购单
			 */
			// qcService.addPurchase(production,user);
			return production.getProductionCode();
		} catch (Exception e) {
			e.printStackTrace();
			return "FAIL";
		}
	}

	@Override
	public PageBean queryProductions(int pageSize, int page, Map<String, Object> params) {
		String hql = "select distinct production,outsource from Production as production inner join production.purchase as purchase inner join production.orders as orders inner join orders.customer as customer inner join orders.design as design left outer join production.outsources as outsource";
		Boolean needWhere = true;
		Boolean needAnd = false;
		for (int i = 0; i < ProductionConstants.SEARCH_PRODUCTION_PARAMS.length; i++) {
			String param = (String) params.get(ProductionConstants.SEARCH_PRODUCTION_PARAMS[i]);
			if (param != null && param.length() > 0) {
				if (needWhere) {
					hql += " where ";
					needWhere = false;
				}
				if (needAnd) {
					hql += " and ";
				} else {
					needAnd = true;
				}
				if (ProductionConstants.SEARCH_PRODUCTION_PARAMS[i].equals("DesignNewOrOld")) {
					int designIsNew = 0;
					if (param.equals(ProductionConstants.DESIGN_NEW_OLD[0])) {
						hql += ProductionConstants.SEARCH_PRODUCTION_PARAM_NAMES[i] + " > " + designIsNew;
					} else {
						hql += ProductionConstants.SEARCH_PRODUCTION_PARAM_NAMES[i] + " <= " + designIsNew;
					}
				} else if (ProductionConstants.SEARCH_PRODUCTION_PARAMS[i].equals("ProductionState")
						&& !param.equals(ProductionConstants.PRODUCTION_STATE[0])) {
					hql += ProductionConstants.SEARCH_PRODUCTION_PARAM_NAMES[i] + " not like '%"
							+ ProductionConstants.PRODUCTION_STATE[0] + "%'";
				} else {
					hql += ProductionConstants.SEARCH_PRODUCTION_PARAM_NAMES[i] + " like '%" + param + "%'";
				}
			}
		}
		PageBean pageBean = pageService.queryForPage(hql, pageSize, page);
		List<Object[]> objects = pageBean.getList();
		List<ProductionOListVO> productionVOs = new ArrayList<ProductionOListVO>();

		Iterator<Object[]> itr = objects.iterator();
		String empty = "暂无";
		while (itr.hasNext()) {
			Object[] tempObject = itr.next();
			Production production = (Production) tempObject[0];
			OutSource outsource = (OutSource) tempObject[1];
			Orders order = null;
			if (production.getOrders().iterator().hasNext()) {
				order = production.getOrders().iterator().next();
			}

			Purchase purchase = null;
			Purchase accessoryPur = null;
			Iterator<Purchase> purchaseItr = production.getPurchase().iterator();
			while (purchaseItr.hasNext()) {
				Purchase temp = purchaseItr.next();
				if (temp.getPurchaseType().equals(ProductionConstants.PURCHASE_TYPE[0])) {// 找到面料采购单
					purchase = temp;
				} else if (temp.getPurchaseType().equals(ProductionConstants.PURCHASE_TYPE[1])) {
					accessoryPur = temp;
				}
			}
			Boolean materialExamined = false;
			Boolean warehouseExamined = false;
			Boolean phoneOrdered = false;
			Boolean faxed = false;
			Boolean financeChecked = false;
			Boolean materialChecked = false;
			Boolean materialInWarehouse = false;
			if (purchase != null) {
				materialExamined = purchase.getMaterialExamineTime() != null;
				warehouseExamined = purchase.getWarehouseExamineTime() != null;
				phoneOrdered = purchase.getPhoneOrderTime() != null;
				faxed = purchase.getFaxTime() != null;
				financeChecked = purchase.getFinanceCheckTime() != null;
				materialChecked = purchase.getMaterialCheckTime() != null;
				materialInWarehouse = purchase.getPurchaseState().equals("采购完成（自由）");
			}

			String accessoryState = ProductionConstants.ACCESSORY_STATE[0];
			if (accessoryPur != null) {
				for (int i = 0; i < ProductionConstants.ACCESSORY_STATE.length; i++) {
					if (accessoryPur.getPurchaseState().equals(ProductionConstants.ACCESSORY_STATE[i])) {
						accessoryState = ProductionConstants.ACCESSORY_STATE[i];
						break;
					}
				}
			}

			Design design = null;
			Customer customer = null;
			String designNewOld = empty;
			if (order != null) {
				design = order.getDesign();
				customer = order.getCustomer();
				if (order.getOrderDesignIsNew() > 0) {
					designNewOld = ProductionConstants.DESIGN_NEW_OLD[0];
				} else {
					designNewOld = ProductionConstants.DESIGN_NEW_OLD[1];
				}
			}

			ProductionOListVO vo = new ProductionOListVO(design == null ? "" : design.getDesignPicURL(),
					production.getProductionCode(), designNewOld, order == null ? empty : order.getOrderPriority(),
					order == null ? empty : order.getOrderProcessType(),
					design == null ? empty : design.getDesignCode(), design == null ? empty : design.getDesignName(),
					customer == null ? empty : customer.getCustomerBrandName(), production.getProductionProgress(),
					accessoryState,
					production.getProductionState().equals(ProductionConstants.PRODUCTION_STATE[0])
							? ProductionConstants.PRODUCTION_STATE[0] : ProductionConstants.PRODUCTION_STATE[1],
					production.getProductionID(), outsource == null ? empty : outsource.getOutsourceCode(),
					materialExamined, warehouseExamined, phoneOrdered, faxed, financeChecked, materialChecked,
					materialInWarehouse, outsource == null ? -1 : outsource.getOutsourceID());
			productionVOs.add(vo);
		}
		pageBean.setList(productionVOs);
		return pageBean;
	}

	@Override
	public ProductionVO queryProduction(String productionCode) {
		String empty = "暂无";
		Production production = null;
		production = productionDao.getProductionByCode(productionCode);
		if (production == null) {
			return null;
		} else {
			Orders order = null;
			if (production.getOrders().iterator().hasNext()) {
				order = production.getOrders().iterator().next();
			}

			Design design = null;
			Customer customer = null;
			String designNewOld = empty;
			User maker = null;
			List<OrderDetailVO> orderDetails = new ArrayList<OrderDetailVO>();
			if (order != null) {
				design = order.getDesign();
				customer = order.getCustomer();
				if (order.getOrderDesignIsNew() > 0) {
					designNewOld = ProductionConstants.DESIGN_NEW_OLD[0];
				} else {
					designNewOld = ProductionConstants.DESIGN_NEW_OLD[1];
				}
				maker = order.getOrderMaker();
				Iterator<OrderDetail> detailItr = order.getOrderDetails().iterator();
				while (detailItr.hasNext()) {
					OrderDetail temp = detailItr.next();
					Tailor tailor = temp.getTailor();
					orderDetails.add(new OrderDetailVO(temp.getOrderColor(), temp.getOrderXS(), temp.getOrderS(),
							temp.getOrderM(), temp.getOrderL(), temp.getOrderXL(), temp.getOrderXXL(),
							temp.getTotalNum(), tailor == null ? 0 : tailor.getActualTailorXS(),
							tailor == null ? 0 : tailor.getActualTailorS(),
							tailor == null ? 0 : tailor.getActualTailorM(),
							tailor == null ? 0 : tailor.getActualTailorL(),
							tailor == null ? 0 : tailor.getActualTailorXL(),
							tailor == null ? 0 : tailor.getActualTailorXXL(),
							tailor == null ? 0 : tailor.getTailorActualVol()));
				}
			}

			String comment = "";
			String sewnin = design == null ? "" : design.getDesignsewninCode();
			String mainlabel = design == null ? "" : design.getDesignMainLabelCode();
			String hangtag = design == null ? "" : design.getDesignHangTagCode();
			comment += "水洗标编号:" + sewnin + ";主标编号:" + mainlabel + ";吊牌编号:" + hangtag + ";";
			comment += order == null ? "" : order.getOrderComment();

			ProductionVO productionVO = new ProductionVO(production.getProductionCode(), designNewOld,
					order == null ? empty : order.getOrderPriority(), order == null ? empty : order.getOrderSource(),
					maker == null ? empty : maker.getUserName(), design == null ? empty : design.getDesignCode(),
					order == null ? empty : order.getOrderDate().substring(0, 10),
					order == null ? empty : order.getOrderContractNum(),
					order == null ? empty : order.getOrderProcessType(),
					customer == null ? empty : customer.getCustomerBrandName(),
					customer == null ? empty : customer.getCustomerContactName(),
					customer == null ? empty : customer.getCustomerPhone() + "  " + customer.getCustomerEMail(),
					design == null ? empty : design.getDesignName(), order == null ? empty : order.getOrderType(),
					orderDetails, order == null ? empty : order.getOrderSpecialTech(),
					order == null ? empty : order.getOrderSampleYardage(),
					order == null ? empty : order.getOrderShellIngredient(), comment,
					design == null ? empty : design.getDesignPicURL());

			return productionVO;
		}
	}

	@Override
	public String modifyProduction(ProductionVO vo) {
		Production production = null;
		production = productionDao.getProductionByCode(vo.getProductionCode());
		if (production == null) {
			return "FAIL:no such production";
		}

		Orders order = null;
		if (production.getOrders().iterator().hasNext()) {
			order = production.getOrders().iterator().next();
		}

		Design design = null;
		if (order != null) {
			for (String temp : ProductionConstants.PRODUCTION_PRIORITY) {
				if (temp.equals(vo.getProductionPriority())) {
					order.setOrderPriority(temp);
					break;
				}
			}

			for (String temp : OrdersConstants.ORDER_SOURCES) {
				if (temp.equals(vo.getOrderSource())) {
					order.setOrderSource(temp);
					break;
				}
			}

			if (vo.getOrderContractNum() != null) {
				order.setOrderContractNum(vo.getOrderContractNum());
			}

			for (String temp : ProductionConstants.PROCESS_TYPES) {
				if (temp.equals(vo.getProcessType())) {
					order.setOrderProcessType(temp);
					break;
				}
			}

			for (String temp : OrdersConstants.ORDER_TYPES) {
				if (temp.equals(vo.getOrderType())) {
					order.setOrderSource(temp);
					break;
				}
			}

			design = order.getDesign();
			if (design != null) {
				String comment = vo.getComment();
				if (comment != null) {
					String[] comments = comment.split("水洗标编号:|;主标编号:|;吊牌编号:|;");
					design.setDesignsewninCode(comments[1]);
					design.setDesignMainLabelCode(comments[2]);
					design.setDesignHangTagCode(comments[3]);
					order.setOrderComment(comments[4]);
				}

				if (vo.getPicUrl() != null) {
					design.setDesignPicURL(vo.getPicUrl());
				}
			}

			if (ProductionConstants.DESIGN_NEW_OLD[0].equals(vo.getDesignNewOld())) {
				order.setOrderDesignIsNew(1);
			} else if (ProductionConstants.DESIGN_NEW_OLD.equals(vo.getDesignNewOld())) {
				order.setOrderDesignIsNew(0);
			}

			if (vo.getOrderDetails() != null) {
				if (order.getOrderDetails() != null) {
					Set<OrderDetail> detailsToDel = order.getOrderDetails();
					order.setOrderDetails(null);
					Iterator<OrderDetail> detailItr = detailsToDel.iterator();
					while (detailItr.hasNext()) {
						baseDao.delete(detailItr.next());
					}

					Set<OrderDetail> detailsToAdd = new HashSet<OrderDetail>();
					Iterator<OrderDetailVO> newDetailItr = vo.getOrderDetails().iterator();
					while (newDetailItr.hasNext()) {
						OrderDetailVO detailvo = newDetailItr.next();
						OrderDetail tempDetail = new OrderDetail(0, order, detailvo.getColor(), detailvo.getXS(),
								detailvo.getS(), detailvo.getM(), detailvo.getL(), detailvo.getXL(), detailvo.getXXL(),
								detailvo.getTotal());
						detailsToAdd.add(tempDetail);
					}
					if (detailsToAdd.size() < 1) {
						detailsToAdd = null;
					}
					order.setOrderDetails(detailsToAdd);
				}
			}

			if (vo.getSpecialTechnique() != null) {
				order.setOrderSpecialTech(vo.getSpecialTechnique());
			}

			if (vo.getSampleYardage() != null) {
				order.setOrderSampleYardage(vo.getSampleYardage());
			}

			if (vo.getShellIngredient() != null) {
				order.setOrderShellIngredient(vo.getShellIngredient());
			}

		}
		if (production != null) {
			baseDao.update(production);
		}
		if (order != null) {
			baseDao.update(order);
		}
		if (design != null) {
			baseDao.update(design);
		}

		return "SUCCESS";
	}

	@Override
	public List<AbnormalParameterVO> queryAbnormalOrders() {

		List purchases = baseDao.getAllList(Purchase.class);
		List<Purchase> shellPurchases = new ArrayList<Purchase>();

		// 找到面料采购单
		for (Object p : purchases) {
			if (((Purchase) p).getPurchaseType().equals(ProductionConstants.PURCHASE_TYPE[0])) {
				shellPurchases.add((Purchase) p);
			}
		}
		ArrayList<AbnormalParameterVO> results = new ArrayList<AbnormalParameterVO>();
		for (String abState : ProductionConstants.ABNORMAL_STATES) {
			AbnormalParameterVO temp = new AbnormalParameterVO();
			temp.setParamName(abState);
			results.add(temp);
		}
		List abParams = baseDao.getAllList(AbnormalParameter.class);
		for (AbnormalParameterVO vo : results) { // 根据数据库中各异常参数标准时间建立results表
			for (Object abParam : abParams) {
				if (vo.getParamName().equals(((AbnormalParameter) abParam).getAbParaName())) {
					vo.setStandardTime(((AbnormalParameter) abParam).getAbParaValue());
					break;
				}
			}
		}

		for (AbnormalParameterVO abvo : results) {// 根据不同的阶段，为每个异常参数项计算总单数；注意其中的case需与productionconstants中对应
			int count = 0;
			switch (abvo.getParamName()) {
			case "计划采购——电话订购":
				count = 0;
				for (Purchase p : shellPurchases) {
					if (p.getPurchaseState().equals("待电话订购") && (new Date().getTime()
							- p.getScheduledPurchaseDate().getTime() >= abvo.getStandardTime() * 3600000)) {
						count++;
					}
				}
				abvo.setVolume(count);
				break;
			case "电话订购——传码单":
				count = 0;
				for (Purchase p : shellPurchases) {
					if (p.getPurchaseState().equals("待传码单") && (new Date().getTime()
							- p.getPhoneOrderTime().getTime() >= abvo.getStandardTime() * 3600000)) {
						count++;
					}
				}
				abvo.setVolume(count);
				break;
			case "传码单——财务付款":
				count = 0;
				for (Purchase p : shellPurchases) {
					if (p.getPurchaseState().equals("待财务对账")
							&& (new Date().getTime() - p.getFaxTime().getTime() >= abvo.getStandardTime() * 3600000)) {
						count++;
					}
				}
				abvo.setVolume(count);
				break;
			case "财务付款——核对面料":
				count = 0;
				for (Purchase p : shellPurchases) {
					if (p.getPurchaseState().equals("待核对面料") && (new Date().getTime()
							- p.getFinanceCheckTime().getTime() >= abvo.getStandardTime() * 3600000)) {
						count++;
					}
				}
				abvo.setVolume(count);
				break;
			case "面料齐备——裁剪/工艺":
				count = 0;
				for (Purchase p : shellPurchases) {
					if (p.getPurchaseState().equals("面料齐备") && (new Date().getTime()
							- p.getMaterialCheckTime().getTime() >= abvo.getStandardTime() * 3600000)) {

						Production production = p.getProduction();
						if (production != null && production.getProductionProgress().equals("采购中")) {
							count++;
						}
					}
				}
				abvo.setVolume(count);
				break;
			case "裁剪/工艺——外发":
				count = 0;
				List productions = baseDao.getAllList(Production.class);
				for (Object p : productions) {
					if (((Production) p).getProductionProgress().equals("裁剪/工艺阶段") && (new Date().getTime()
							- ((Production) p).getpProcessTime().getTime() >= abvo.getStandardTime() * 3600000)) {
						count++;
					}
				}
				abvo.setVolume(count);
				break;
			default:
				break;
			}
		}

		return results;
	}

	@Override
	public PrintProductionVO printProduction(String productionCode) {

		Production production = null;
		production = productionDao.getProductionByCode(productionCode);
		if (production == null) {
			return null;
		} else {
			ProductionVO productionVO = this.queryProduction(productionCode);
			List<TailorVO> tailorVOs = new ArrayList<TailorVO>();
			List<OrderDetailVO> details = productionVO.getOrderDetails();
			Orders order = null;
			if (production.getOrders().iterator().hasNext()) {
				order = production.getOrders().iterator().next();
			}
			List<OrderMaterialDetailVO> materialDetailVOs = new ArrayList<OrderMaterialDetailVO>();
			Set<OrderMaterialDetail> materialDetails = new HashSet<OrderMaterialDetail>();

			Design design = null;
			String bOMRegistered = "未录入BOM";

			String otherComment = "";
			String techniqueComment = "";
			if (order != null) {
				materialDetails = order.getOrderMaterialDetails();
				design = order.getDesign();

				SampleOrders sample = order.getSampleOrders();
				if (sample != null) {
					otherComment += sample.getSampleOrderShellFabReq() + ";" + sample.getSampleOrderAccReq() + ";";
					techniqueComment = sample.getSampleOrderTechReq();
				}
				otherComment += order.getDistributeMethod();
			}
			if (design != null) {
				bOMRegistered = "BOM录入确认";
			}
			Iterator<OrderMaterialDetail> itr = materialDetails.iterator();

			while (itr.hasNext()) {
				OrderMaterialDetail detail = itr.next();
				Supply supply = detail.getSupply();
				Material material = null;
				Vendor vendor = null;
				if (supply != null) {
					material = supply.getMaterial();
					vendor = supply.getVendor();
				}
				materialDetailVOs.add(new OrderMaterialDetailVO(detail, material, vendor));
			}

			PrintProductionVO printVO = new PrintProductionVO(productionVO, materialDetailVOs, otherComment,
					techniqueComment, bOMRegistered);
			return printVO;
		}
	}

	@Override
	public void tryStartProcess(Production production, Timestamp time) {
		if (time != null && production != null) {
			if (production.getpProcessTime() == null) {
				production.setpProcessTime(time);
				production.setProductionProgress(ProductionConstants.PRODUCTION_PROGRESS[1]);
				baseDao.update(production);
			}
		}
	}

	@Override
	public void tryStartOutsource(Production production, Timestamp time) {
		if (time != null && production != null) {
			if (production.getpOutsourceTime() == null) {
				production.setpOutsourceTime(time);
				production.setProductionProgress(ProductionConstants.PRODUCTION_PROGRESS[2]);
				baseDao.update(production);
			}
		}
	}

	@Override
	public void tryPartReceive(Production production, Timestamp time) {
		if (time != null && production != null) {
			if (production.getpPartReceiveTime() == null) {
				production.setpPartReceiveTime(time);
				production.setProductionProgress(ProductionConstants.PRODUCTION_PROGRESS[3]);
				baseDao.update(production);
			}
		}
	}

	@Override
	public void tryReceiveAll(Production production, Timestamp time) {
		if (time != null && production != null) {
			if (production.getpReceiveTime() == null) {
				Boolean allReceived = true;
				Set<OutSource> outsources = production.getOutsources();
				if (outsources != null) {
					Iterator<OutSource> itr = outsources.iterator();
					while (itr.hasNext()) {
						OutSource os = itr.next();
						if (!os.getOutsourceState().equals("已完结")) {
							allReceived = false;
							break;
						}
					}
				}
				if (allReceived) {
					production.setpReceiveTime(time);
					production.setProductionProgress(ProductionConstants.PRODUCTION_PROGRESS[4]);
					baseDao.update(production);
				}
			}
		}
	}

	@Override
	public void tryQC(Production production, Timestamp time) {
		if (time != null && production != null) {
			if (production.getpQCTime() == null) {
				production.setpQCTime(time);
				production.setProductionProgress(ProductionConstants.PRODUCTION_PROGRESS[5]);
				baseDao.update(production);
			}
		}
	}

	@Override
	public void tryFinishQC(Production production, Timestamp time) {
		if (time != null && production != null) {
			if (production.getpFinishQCTime() == null) {
				Boolean allChecked = true;
				Set<Qc> qcs = production.getQcs();
				if (qcs != null) {
					Iterator<Qc> itr = qcs.iterator();
					while (itr.hasNext()) {
						Qc qc = itr.next();
						if (!qc.getQCState().equals("已完结")) {
							allChecked = false;
							break;
						}
					}
				}
				if (allChecked) {
					production.setpFinishQCTime(time);
					production.setProductionProgress(ProductionConstants.PRODUCTION_PROGRESS[6]);
					baseDao.update(production);
				}
			}
		}
	}

}
