package productManage.service.designOrder.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.BaseDao;
import productManage.dao.wcy.OrderDetailDAO;
import productManage.dao.wcy.OrdersDAO;
import productManage.dao.zky.ProductionDao;
import productManage.model.User;
import productManage.model.cs.OutSourceDetail;
import productManage.model.lhj.Bom;
import productManage.model.lhj.Material;
import productManage.model.lhj.Supply;
import productManage.model.lhj.Vendor;
import productManage.model.tms.Design;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.OrderMaterialDetail;
import productManage.model.yk.Orders;
import productManage.model.yrd.Customer;
import productManage.model.zky.Production;
import productManage.service.designOrder.DesignOrderService;
import productManage.service.production.ProductionService;
import productManage.service.qc.QcService;
import productManage.service.tailor.TailorService;
import productManage.vo.production.ProductionConstants;

@Service
public class DesignOrderServiceImpl implements DesignOrderService {
	
	@Autowired
	private OrdersDAO ordersDao;
	@Autowired
	private BaseDao baseDao;
	@Autowired
	private ProductionDao productionDao;
	@Autowired
	private TailorService tailorService;
	@Autowired
	private QcService qcService;
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	public ProductionService getProductionService() {
		return productionService;
	}

	public void setProductionService(ProductionService productionService) {
		this.productionService = productionService;
	}

	public OrderDetailDAO getOrderDetailDao() {
		return orderDetailDao;
	}

	public void setOrderDetailDao(OrderDetailDAO orderDetailDao) {
		this.orderDetailDao = orderDetailDao;
	}

	@Autowired
	private ProductionService productionService;
	@Autowired
	private OrderDetailDAO orderDetailDao;

	public OrdersDAO getOrdersDao() {
		return ordersDao;
	}

	public void setOrdersDao(OrdersDAO ordersDao) {
		this.ordersDao = ordersDao;
	}
	
	public Design getDesignByID(int designID){
		return ordersDao.getDesignByID(designID);
	}

	@Override
	public Customer getCustomer(String customerBrandName) {
		// TODO Auto-generated method stub
		
		return ordersDao.getCustomer(customerBrandName);
	}

	@Override
	public Vendor getVendor(String vendorName) {
		// TODO Auto-generated method stub
		return ordersDao.getVendor(vendorName);
	}

	@Override
	public void save(Orders orders,User user) {
		//ordersDao.save(orders);
		/**
		 * 根据订单生成对应生产单
		 * by zky
		 */
		List<String> orderlist=new ArrayList<String>();
		orderlist.add(orders.getOrderCode());
		String productionCode=productionService.addProduction(orderlist,user);
		//之前没自信看无法在orders里添加production外键，改动
		
		Production production1=productionDao.getProductionByCode(productionCode);
		orders.setProduction(production1);
		
		ordersDao.save(orders);
		/**
		 * 根据生产单生成采购单
		 */
		qcService.addPurchase(production1,user);
		
		
	}
	public void save1(Orders orders){
		ordersDao.save(orders);
	}
	
	public void update(Orders orders){
		ordersDao.update(orders);
	}

	@Override
	public void addOrderDetail(Orders orders, List<OrderDetail> details_add) {
		// TODO Auto-generated method stub
		for (int i = 0; i < details_add.size(); i++) {
			OrderDetail od = details_add.get(i);
			od.setOrder(orders);
			orderDetailDao.add(od);
		}
		/**
		 * 根据生产单生成裁剪单
		 */
		tailorService.initializeTailors(orders.getProduction().getProductionCode());
	}
	
	public void addOrderMaterialdetail(Orders orders,List<OrderMaterialDetail> materialdetails_add){
		for (int i = 0; i < materialdetails_add.size(); i++) {
			OrderMaterialDetail od = materialdetails_add.get(i);
			
			
			
				od.setOrder(orders);
				orderDetailDao.addOrderMaterialdetail(od);
			
		
			
		}
	}

	@Override
	public OrderMaterialDetail getOD(OrderMaterialDetail orderMaterialDetail,
			String materialName, String materialType, String colorCode,
			String vendorName) {
		Material material = orderDetailDao.getMaterial(materialName,colorCode,materialType);
		Vendor vendor = ordersDao.getVendor(vendorName);
		Supply supply = orderDetailDao.getSupply(material.getMaterialCode(),vendor.getVendorId());
		if(null == supply){
			Supply supply1 = new Supply();
			supply1.setMaterial(material);
			supply1.setVendor(vendor);
			orderDetailDao.addSupply(supply1);
			orderMaterialDetail.setSupply(supply1);
			
		}
		else{
			orderMaterialDetail.setSupply(supply);
		}
		return orderMaterialDetail;
	}

	@Override
	public List<Supply> getSupplyList(Design design) {
		// TODO Auto-generated method stub
		List<Material> mlist = new ArrayList<Material>();
		Iterator<Bom> detailItr = design.getBoms().iterator();
		while (detailItr.hasNext()) {
			Bom temp = detailItr.next();
			mlist.add(temp.getMaterial());
		}
		List<Supply> slist = new ArrayList<Supply>();
		for(int m=0;m<mlist.size();m++){
		   String hql="select s from Supply as s where s.material.materialCode= '"+ mlist.get(m).getMaterialCode()+"'";
		   List<Supply> list = baseDao.getSession().createQuery(hql).list();
		   if(null != list && list.size() > 0){
			   for(int i=0;i<list.size();i++){
				   slist.add(list.get(i));
			   }
		   }
		   else{
			   return list;
		   }
		}
		return slist;
		
	}
	
}
