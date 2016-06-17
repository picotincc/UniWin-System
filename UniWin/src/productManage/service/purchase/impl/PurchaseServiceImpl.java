package productManage.service.purchase.impl;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.tyc.PurchaseDao;
import productManage.dao.wcy.QcDAO;
import productManage.model.User;
import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.model.lhj.Bom;
import productManage.model.lhj.Material;
import productManage.model.lhj.Supply;
import productManage.model.lhj.Vendor;
import productManage.model.szl.Supplement;
import productManage.model.tms.Design;
import productManage.model.tyc.Purchase;
import productManage.model.wcy.Qc;
import productManage.model.wjx.Store;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.Orders;
import productManage.model.yrd.Customer;
import productManage.model.zky.Production;
import productManage.model.zky.Tailor;
import productManage.service.PageService;
import productManage.service.purchase.PurchaseService;
import productManage.vo.PageBean;
import productManage.vo.production.OrderDetailVO;
import productManage.vo.production.ProductionConstants;
import productManage.vo.purchase.bomVO;
import productManage.vo.purchase.purchaseConstants;
import productManage.vo.purchase.purchaseVO;
import productManage.vo.purchase.vendorVO;
import productManage.vo.qc.QCVO;
import productManage.vo.supplement.SupplementConstants;

/**  
* 类说明   
*  
* @author tyc  
* @date 2016年3月8日 新建 
*/
@Service
public class PurchaseServiceImpl implements PurchaseService {
	@Autowired
	private PurchaseDao purchaseDao;
	@Autowired
	PageService pageService;
	public PurchaseDao getPurchaseDao() {
		return purchaseDao;
	}

	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}

	@Override
	public PageBean allShellPurchase(int rowsPerPage, int page) {
		String hql = "from Purchase as p where p.purchaseType = 'shell'";
    	PageBean pagebean = pageService.queryForPage(hql, rowsPerPage, page);
    	List<Purchase> purchases =pagebean.getList();
    	
    	List<purchaseVO> purchaseVOs = new ArrayList<purchaseVO>();
    	for(int i=0;i<purchases.size();i++){
    		purchaseVO purchase  = new purchaseVO();
    		
    		purchase = this.purchaseDetail(purchases.get(i).getPurchaseID(),"面料");
    		purchaseVOs.add(purchase);
    	}
    	
    	pagebean.setList(purchaseVOs);
        return pagebean;
	}
	
	@Override
	public PageBean allAccessoryPurchase(int rowsPerPage, int page) {
		String hql = "from Purchase as p where p.purchaseType = 'accessory'";
    	PageBean pagebean = pageService.queryForPage(hql, rowsPerPage, page);
    	List<Purchase> purchases =pagebean.getList();
    	
    	List<purchaseVO> purchaseVOs = new ArrayList<purchaseVO>();
    	for(int i=0;i<purchases.size();i++){
    		purchaseVO purchase  = new purchaseVO();
    		
    		purchase = this.purchaseDetail(purchases.get(i).getPurchaseID(),"辅料");
    		purchaseVOs.add(purchase);
    	}
    	
    	pagebean.setList(purchaseVOs);
    	//pagebean.setAllList(qcVOs);
        return pagebean;
	}

	@Override
	public List<Purchase> selectPurchase(Date Eta, Date scheduledPurchaseDate, int vendorId, String purchaseState,
			int styleId, int oldOrNew) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updatePurchaseState(int purchaseID, String state) {
		// TODO Auto-generated method stub

	}

	@Override
	public Purchase usingMaterialAudit(int purchaseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Purchase stockAudit(int purchaseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public purchaseVO purchaseDetail(int purchaseID,String type) {
			// TODO Auto-generated method stub
			String empty = "暂无";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Purchase purchase = purchaseDao.purchaseDetail(purchaseID);
			int totalNum = 0;
			Production production = null;
			Orders order = null;
			Design design = null;
			Customer customer = null;
			User maker = null;
			bomVO bom1 = null;
			String designNewOld = empty;
			String orderPriority = empty;
			String vendors = empty;
			String orderCode=empty;
			List<OrderDetailVO> orderDetails = new ArrayList<OrderDetailVO>();
			List<bomVO> materials = new ArrayList<bomVO>();
			
			if(purchase!=null){
				production = purchase.getProduction();
				if(production.getOrders()!= null){
					Iterator<Orders> orderItr = production.getOrders().iterator();
					while(orderItr.hasNext()){
						Orders temp = orderItr.next();
						order = temp;
					}
				}
				if(order!=null){
					orderPriority = order.getOrderPriority();
					design = order.getDesign();
					customer = order.getCustomer();
					orderCode = order.getOrderCode();
					if (order.getOrderDesignIsNew() > 0) {
						designNewOld = ProductionConstants.DESIGN_NEW_OLD[0];
					} else {
						designNewOld = ProductionConstants.DESIGN_NEW_OLD[1];
					}
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
						totalNum += temp.getTotalNum();
						//System.out.println(temp.getOrderColor());
					}
					
					Iterator<Bom> materialItr = order.getDesign().getBoms().iterator();
					while(materialItr.hasNext()){
						Bom bom = materialItr.next();
						Iterator<Store> storeItr = bom.getMaterial().getStores().iterator();
						float remainVol = 0,frozenVol = 0;
						while(storeItr.hasNext()){
							Store storeTemp = storeItr.next();
							remainVol += storeTemp.getRemainVol();
							frozenVol += storeTemp.getFrozenVol();
						}
						Iterator<Supply> supplys = bom.getMaterial().getSupplys().iterator();
						String vendor = empty;
						int vendorId = 0;
						while(supplys.hasNext()){
							Vendor vendor1 = supplys.next().getVendor();
							vendor=vendor1.getVendorName()+":"+vendor1.getVendorPhoneNum();
							vendorId=vendor1.getVendorId();
						}
						if(bom.getMaterial().getMaterialType().equals(type)){
							
							materials.add(new bomVO(bom.getMaterial().getMaterialCode(), bom.getMaterial().getMaterialName(), 
									bom.getMaterial().getMaterialType(), bom.getMaterial().getColorCode(),
									bom.getMaterial().getColorDescription(), bom.getMaterial().getMaterialIngredient(), 
									bom.getMaterial().getUnitPrice(), bom.getMaterial().getUnit(), bom.getMaterial().getWidth(),
									bom.getMaterial().getOutputVol(), bom.getVolPerDesign(), bom.getMaterialPosition(), remainVol, 
									frozenVol,(float)(Math.round(totalNum*bom.getVolPerDesign()*100))/100,vendor,vendorId,
									(float)(Math.round(totalNum*bom.getVolPerDesign()*100))/100-remainVol+frozenVol,remainVol-frozenVol));
							bom1 = new bomVO(bom.getMaterial().getMaterialCode(), bom.getMaterial().getMaterialName(), 
									bom.getMaterial().getMaterialType(), bom.getMaterial().getColorCode(),
									bom.getMaterial().getColorDescription(), bom.getMaterial().getMaterialIngredient(), 
									bom.getMaterial().getUnitPrice(), bom.getMaterial().getUnit(), bom.getMaterial().getWidth(),
									bom.getMaterial().getOutputVol(), bom.getVolPerDesign(), bom.getMaterialPosition(), remainVol, 
									frozenVol,(float)(Math.round(totalNum*bom.getVolPerDesign()*100))/100,vendor,vendorId,
									(float)(Math.round(totalNum*bom.getVolPerDesign()*100))/100-remainVol+frozenVol,remainVol-frozenVol);
						}
						
					}
				}
				
				
				maker = purchase.getUser();
				
				Iterator<Vendor> vendorItr = purchase.getVendors().iterator();
				while(vendorItr.hasNext()){
					Vendor vendor = vendorItr.next();
					if(vendors.equals("暂无")){
						vendors = (vendor.getVendorName()+": "+vendor.getVendorPhoneNum());
					}
					else{
						vendors += (","+vendor.getVendorName()+": "+vendor.getVendorPhoneNum());
					}
					
					
				}
			}
			
			purchaseVO purchaseVo = new purchaseVO(designNewOld, purchase == null ? "暂无" : purchase.getPurchaseCode(), 
					design == null ? "暂无" : design.getDesignCode(),customer == null ? "暂无" : customer.getCustomerBrandName(), 
					purchase == null ? "暂无" : sdf.format(purchase.getPurDocumentedDate()),design == null ? "暂无" : design.getDesignName(), 
					vendors,maker == null ? "暂无" : maker.getUserName(), purchase == null ? "暂无" : purchase.getPurchaseComment(), 
					design == null ? "暂无" :design.getDesignPicURL(), materials, orderDetails,
					purchase == null ? "暂无" : sdf.format(purchase.getScheduledPurchaseDate()),purchase == null ? "暂无" : purchase.getPurchaseState(),orderPriority,
					purchase == null ? -1 : purchase.getPurchaseID(),bom1,orderCode,purchase.getETA() == null ? "暂无" : sdf.format(purchase.getETA()),purchase.getFaxTime() == null ? "暂无" : sdf.format(purchase.getFaxTime()),purchase.getFinanceCheckTime() == null ? "暂无" : sdf.format(purchase.getFinanceCheckTime()));
			return purchaseVo;
		//}
	}
	
	public Purchase getPurchaseByCode(String purchaseCode){
		return purchaseDao.getPurchaseByPurchaseCode(purchaseCode);
	}
	
	@Override
	public Purchase changeState(String selectedCode, String selectedState,int type) {
		int purchaseID = Integer.parseInt(selectedCode);
		Purchase purchase = purchaseDao.purchaseDetail(purchaseID);
		if(selectedState.equals("待审核")){
			purchase.setPurchaseState("待库存审核");
			purchase.setMaterialExamineTime(new Timestamp(System.currentTimeMillis()));
		}
		else if(selectedState.equals("待库存审核")){
			purchase.setPurchaseState("待电话订购");
			purchase.setWarehouseExamineTime(new Timestamp(System.currentTimeMillis()));
		}
		else if(selectedState.equals("待电话订购")){
			if(type==1)
				purchase.setPurchaseState("待传码单");
			else
				purchase.setPurchaseState("待财务对账");
			purchase.setPhoneOrderTime(new Timestamp(System.currentTimeMillis()));
		}
		else if(selectedState.equals("待传码单")){
			purchase.setPurchaseState("待财务对账");
			purchase.setFaxTime(new Timestamp(System.currentTimeMillis()));
		}
		else if(selectedState.equals("待财务对账")){
			purchase.setPurchaseState("待核对面料");
			purchase.setFinanceCheckTime(new Timestamp(System.currentTimeMillis()));
		}
		else if(selectedState.equals("待核对面料")){
			purchase.setPurchaseState("采购完成（订购）");
			purchase.setMaterialCheckTime(new Timestamp(System.currentTimeMillis()));
		}
		else
			return null;
		System.out.println(purchase.getPurchaseID());
	
		purchaseDao.update(purchase);
		return purchase;
	
	}
	
	@Override
	public boolean cancelPurchase(String code) {
		int purchaseID = Integer.parseInt(code);
		Purchase purchase = purchaseDao.purchaseDetail(purchaseID);
		purchase.setPurchaseState("已作废");
		purchaseDao.update(purchase);
		return true;
	}

	@Override
	public PageBean queryPurchase(int pageSize, int page, Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql = "select p from Purchase p,Orders o,Production q,Bom b,Supply s  where p.purchaseID > 0 and p.production.productionID=q.productionID and o.production.productionID=q.productionID and b.design.designID=o.design.designID and b.material.materialCode=s.material.materialCode ";
		String designCode = (String) params.get(purchaseConstants.SEARCH_PURCHASE_PARAMS[0]);
		String vendor = (String) params.get(purchaseConstants.SEARCH_PURCHASE_PARAMS[1]);
		String purchaseState = (String) params.get(purchaseConstants.SEARCH_PURCHASE_PARAMS[2]);
		String oldOrNew = (String) params.get(purchaseConstants.SEARCH_PURCHASE_PARAMS[3]);
		String scheduledPurchaseDate = (String) params.get(purchaseConstants.SEARCH_PURCHASE_PARAMS[4]);
		String eta = (String) params.get(purchaseConstants.SEARCH_PURCHASE_PARAMS[5]);
	
		if( null != designCode && !"".equals(designCode)){
			/*hql = hql+"and p.production in (select producion from Production as production "
					+ "where production.orders in (select orders from Orders as orders "
					+ "where orders.design in(select design from Design as design " + "where design.designCode like '%" + designCode + "%' )))";	*/	
			hql = hql+" and o.design.designCode like '%" + designCode + "%'";
			
		}
		if(null != oldOrNew && !"".equals(oldOrNew)){
			if(oldOrNew.equals("新款")){
				/*hql = hql+"and p.production in (select producion from Production as production "
						+ "where production.orders in (select orders from Orders as orders "
						+ "where orders.orderDesignIsNew > 0))";*/
				hql = hql+"and o.orderDesignIsNew > 0";
			}
			else if(oldOrNew.equals("老款")){
				/*hql = hql+"and p.production in (select producion from Production as production "
						+ "where production.orders in (select orders from Orders as orders "
						+ "where orders.orderDesignIsNew = 0))";*/
				hql=hql+"and o.orderDesignIsNew = 0";
			}
		}
		
		if(null != scheduledPurchaseDate && !"".equals(scheduledPurchaseDate)){
			hql = hql + "and p.ScheduledPurchaseDate like '%" + scheduledPurchaseDate + "%' ";
			
		}
		if( null != eta && !"".equals(eta)){
			hql = hql + "and p.ETA like '%" + eta + "%' ";
		}
		if( null != purchaseState && !"".equals(purchaseState) ){
			hql = hql + "and p.purchaseState like '%" + purchaseState + "%' ";
		}
		if(null != vendor && !"".equals(vendor)){
			System.out.println("vendor"+  vendor);
			/*hql = hql + "and p.vendors in (select vendor from Vendor as v "
					+ "where v.vendorName like '%" + vendor + "%') ";*/
			hql = hql+"and s.vendor.vendorName like '%" + vendor + "%'";
		}
		System.out.println(hql);
		PageBean result = pageService.queryForPage(hql, pageSize, page);
		List<Purchase> purchases= (List<Purchase>)result.getList();
		
		List<purchaseVO> purchaseVOs = new ArrayList<purchaseVO>();
		for(int i=0;i<purchases.size();i++){
			purchaseVO purchaseVO  = new purchaseVO();
    		purchaseVO = this.purchaseDetail(purchases.get(i).getPurchaseID(),"辅料");
    		purchaseVOs.add(purchaseVO);
		}
		result.setList(purchaseVOs);
		
		return result;
	}

}
