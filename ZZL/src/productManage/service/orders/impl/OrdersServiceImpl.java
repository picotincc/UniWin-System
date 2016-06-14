package productManage.service.orders.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.wcy.OrdersDAO;
import productManage.dao.wy.UserDao;
import productManage.model.User;
import productManage.model.yk.Orders;
import productManage.service.PageService;
import productManage.service.ProgressService;
import productManage.service.orders.OrdersService;
import productManage.vo.PageBean;
import productManage.vo.orders.OrdersConstants;
@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired
	private OrdersDAO ordersDao;
	@Autowired
	private PageService pageService;
	@Autowired
	private ProgressService progressService;
	@Autowired
	private UserDao userDao;
	
	public  OrdersDAO getOrdersDAO() {
		return ordersDao;
	}

	public void setOrdersDAO(OrdersDAO ordersDao) {
		this.ordersDao = ordersDao;
	}
	
	@Override
	public void save(Orders orders) {
		// TODO Auto-generated method stub
		ordersDao.save(orders);
	}

	@Override
	public void update(Orders orders) {
		// TODO Auto-generated method stub
		ordersDao.update(orders);
	}

	@Override
	public List<Orders> getAll() {
		// TODO Auto-generated method stub
		return ordersDao.getAll();
	}

	@Override
	public Orders getOrderByID(int orderID) {
		// TODO Auto-generated method stub
		return ordersDao.getOrderByID(orderID);
	}

	@Override
	public List<Orders> getOrderList(int designID) {
		// TODO Auto-generated method stub
		return ordersDao.getOrderList(designID);
	}

	@Override
	public Orders getOrderByProductionID(int productionID) {
		// TODO Auto-generated method stub
		return ordersDao.getOrderByProductionID(productionID);
	}

	@Override
	public Orders getOrderByInquiryID(int inquiryID) {
		// TODO Auto-generated method stub
		return ordersDao.getOrderByInquiryID(inquiryID);
	}

	@Override
	public Orders getOrderByCode(String orderCode) {
		return ordersDao.getOrderByCode(orderCode);
	}

	@Override
	public PageBean getAllOrdersByPage(int pageSize,int page) {
		// TODO Auto-generated method stub
		String hql = "from Orders";
		return pageService.queryForPage(hql, pageSize, page);
	}

	@Override
	public PageBean searchOrdersByPage(int pageSize, int page,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql = "select orders from Orders as orders";
		String orderCode = (String) params.get(OrdersConstants.SEARCH_ORDERS_PARAMS[0]);
		String customerName = (String) params.get(OrdersConstants.SEARCH_ORDERS_PARAMS[1]);
		String inquiryProgress = (String) params.get(OrdersConstants.SEARCH_ORDERS_PARAMS[2]);
		String sampleOrderProgress = (String) params.get(OrdersConstants.SEARCH_ORDERS_PARAMS[3]);
		String productionProgress = (String) params.get(OrdersConstants.SEARCH_ORDERS_PARAMS[4]);
		String chargeName = (String) params.get(OrdersConstants.SEARCH_ORDERS_PARAMS[5]);
		//按照相应条件组装hql
		if (!orderCode.isEmpty()||!customerName.isEmpty()||!inquiryProgress.isEmpty()||!sampleOrderProgress.isEmpty()
				||!productionProgress.isEmpty()||!chargeName.isEmpty()) {
			hql += " where";
		}
		if (!orderCode.isEmpty()) {
			hql += " orders.orderCode='"+orderCode+"'";
		}
		if (!orderCode.isEmpty()&(!customerName.isEmpty()||!inquiryProgress.isEmpty()||!sampleOrderProgress.isEmpty()
				||!productionProgress.isEmpty()||!chargeName.isEmpty())) {
			hql += " and";
			//System.out.println("1");
		}
		if (!customerName.isEmpty()) {
			hql += " orders.customer.customerContactName like '"+customerName+"%'";
		}
		if (!customerName.isEmpty()&(!inquiryProgress.isEmpty()||!sampleOrderProgress.isEmpty()
				||!productionProgress.isEmpty()||!chargeName.isEmpty())) {
			hql += " and";
			//System.out.println("2");
		}
		if (!inquiryProgress.isEmpty()) {
			hql += progressService.inquiryProgressHql("orders.inquiry",inquiryProgress);
		}
		if (!inquiryProgress.isEmpty()&(!sampleOrderProgress.isEmpty()
				||!productionProgress.isEmpty()||!chargeName.isEmpty())) {
			hql += " and";
			//System.out.println("3");
		}
		if (!sampleOrderProgress.isEmpty()) {
			hql += progressService.sampleOrderProgressHql("orders.sampleOrders.sampleProcedure",sampleOrderProgress);
		}
		if (!sampleOrderProgress.isEmpty()&(!productionProgress.isEmpty()||!chargeName.isEmpty())) {
			hql += " and";
			//System.out.println("4");
		}
		if (!productionProgress.isEmpty()) {
			hql += " orders.production.productionProgress='"+productionProgress+"'";
		}
		if (!productionProgress.isEmpty()&!chargeName.isEmpty()) {
			hql += " and";
			//System.out.println("5");
		}
		if (!chargeName.isEmpty()) {
			hql += " orders.charge.userName='"+chargeName+"'";
		}
		//System.out.println(hql);
		return pageService.queryForPage(hql, pageSize, page);
	}

	@Override
	public void updateCharge(String orderCode,int chargeId) {
		// TODO Auto-generated method stub
		Orders order = ordersDao.getOrderByCode(orderCode);
		User charge = userDao.findByID(chargeId);
		order.setCharge(charge);
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		order.setOrderDesignatedTime(time);
		ordersDao.update(order);
	}

}
