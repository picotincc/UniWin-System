package productManage.service.tailor.impl;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import freemarker.template.SimpleDate;
import productManage.dao.BaseDao;
import productManage.dao.zky.ProductionDao;
import productManage.model.tms.Design;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.Orders;
import productManage.model.yrd.Customer;
import productManage.model.zky.Production;
import productManage.model.zky.Tailor;
import productManage.service.PageService;
import productManage.service.production.ProductionService;
import productManage.service.tailor.TailorService;
import productManage.vo.PageBean;
import productManage.vo.production.ProductionConstants;
import productManage.vo.production.TailorVO;
import productManage.vo.tailor.TailorConstants;
import productManage.vo.tailor.TailorDetailVO;

@Service
public class TailorServiceImpl implements TailorService {
	@Autowired
	private PageService pageservice;
	@Autowired
	private ProductionService productionService;
	@Autowired
	private BaseDao baseDao;
	@Autowired
	private ProductionDao productionDao;

	@Override
	public PageBean queryTailorsCondition(int pageSize, int page, Map<String, Object> params) {
		String hql = "select distinct tailor from Tailor as tailor inner join tailor.production as production inner join production.orders as order";
		Boolean needWhere = true;
		Boolean needAnd = false;
		for (int i = 0; i < TailorConstants.SEARCH_TAILOR_PARAMS.length; i++) {
			String param = (String) params.get(TailorConstants.SEARCH_TAILOR_PARAMS[i]);
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
				hql += TailorConstants.SEARCH_TAILOR_PARAM_NAMES[i] + " like '%" + param + "%'";
			}
		}
		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		List<Tailor> tailors = pageBean.getList();
		List<TailorVO> tailorVOs = new ArrayList<TailorVO>();

		String empty = "暂无";
		Iterator<Tailor> itr = tailors.iterator();
		while (itr.hasNext()) {
			Tailor tailor = itr.next();
			Orders order = null;
			Production production = tailor.getProduction();
			if (production.getOrders().iterator().hasNext()) {
				order = production.getOrders().iterator().next();// 不适用于多个订单生成一个生产单的情况
			}
			Design design = null;
			Customer customer = null;
			if (order != null) {
				design = order.getDesign();
				customer = order.getCustomer();
			}
			OrderDetail orderDetail = tailor.getOrderDetail();
			TailorVO vo = new TailorVO(tailor.getTailorID(),design == null ? "" : design.getDesignPicURL(), production.getProductionCode(),
					production.getProductionID(), orderDetail == null ? empty : orderDetail.getOrderColor(),
					design == null ? empty : design.getDesignCode(), design == null ? empty : design.getDesignName(),
					customer == null ? empty : customer.getCustomerBrandName(),
					orderDetail == null ? 0 : orderDetail.getTotalNum(), tailor.getTailorActualVol(),
					production.getProductionProgress());
			tailorVOs.add(vo);
		}

		pageBean.setList(tailorVOs);
		return pageBean;
	}

	@Override
	public TailorDetailVO queryTailor(int tailorID) {
		Tailor tailor = (Tailor) baseDao.load(Tailor.class, tailorID);
		if (tailor == null) {
			return null;
		}
		String startTime = tailor.getTailorStartingTime() == null ? ""
				: tailor.getTailorStartingTime().toString().substring(0, 10);
		String finishTime = tailor.getTailorEndTime() == null ? ""
				: tailor.getTailorEndTime().toString().substring(0, 10);
		TailorDetailVO tailordetail = new TailorDetailVO(tailor.getTailorID(), startTime, finishTime,
				tailor.getActualTailorXS(), tailor.getActualTailorS(), tailor.getActualTailorM(),
				tailor.getActualTailorL(), tailor.getActualTailorXL(), tailor.getActualTailorXXL());

		return tailordetail;
	}

	@Override
	public TailorDetailVO modifyTailor(TailorDetailVO tailorDetail) {
		Tailor tailor = (Tailor) baseDao.load(Tailor.class, tailorDetail.getTailorID());
		if (tailor == null) {
			return null;
		}
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		Timestamp start = null;
		if (tailorDetail.getStartTime() != null) {
			try {
				start = new Timestamp(fmt.parse(tailorDetail.getStartTime()).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (start != null) {
			tailor.setTailorStartingTime(start);
			/**
			 * 若对应生产单未开始裁剪/工艺，则转化其状态并记录此阶段开始时间
			 */
			productionService.tryStartProcess(tailor.getProduction(), start);
		}

		Timestamp finish = null;
		if (tailorDetail.getFinishTime() != null) {
			try {
				finish = new Timestamp(fmt.parse(tailorDetail.getFinishTime()).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (finish != null) {
			tailor.setTailorEndTime(finish);
		}
		tailor.setActualTailorXS(tailorDetail.getActualXS());
		tailor.setActualTailorS(tailorDetail.getActualS());
		tailor.setActualTailorM(tailorDetail.getActualM());
		tailor.setActualTailorXL(tailorDetail.getActualXL());
		tailor.setActualTailorXXL(tailorDetail.getActualXXL());
		baseDao.update(tailor);
		return this.queryTailor(tailor.getTailorID());
	}

	@Override
	public void initializeTailors(String productionCode) {
		Production production=productionDao.getProductionByCode(productionCode);
		if(production==null){
			return;
		}
		Set<Orders> orders = production.getOrders();
		if (orders == null){
			return;
		}
		Iterator<Orders> orderItr=orders.iterator();
		while(orderItr.hasNext()){
			Orders order=orderItr.next();
			Set<OrderDetail> orderDetails=order.getOrderDetails();
			if(orderDetails==null){
				continue;
			}else{
				Iterator<OrderDetail> orderDetailItr=orderDetails.iterator();
				while(orderDetailItr.hasNext()){
					OrderDetail orderDetail=orderDetailItr.next();
					Tailor tailor=new Tailor();
					
					tailor.setProduction(production);
					Set<Tailor> tailors=production.getTailors();
					if(tailors==null){
						tailors=new HashSet<Tailor>();
					}
					tailors.add(tailor);
					production.setTailors(tailors);
					
					tailor.setOrderDetail(orderDetail);
					orderDetail.setTailor(tailor);
					
					baseDao.save(tailor);
				}
			}
		}
	}

}
