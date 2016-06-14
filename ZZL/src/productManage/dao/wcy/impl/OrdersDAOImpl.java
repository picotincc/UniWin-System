package productManage.dao.wcy.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.wcy.OrdersDAO;
import productManage.dao.zky.ProductionDao;
import productManage.model.User;
import productManage.model.lhj.Vendor;
import productManage.model.tms.Design;
import productManage.model.yk.OrderMaterialDetail;
import productManage.model.yk.Orders;
import productManage.model.yrd.Customer;
import productManage.model.zky.Production;
import productManage.service.production.ProductionService;
import productManage.vo.production.ProductionConstants;
@Repository
public class OrdersDAOImpl implements OrdersDAO{
	
	@Autowired
	private BaseDao baseDao;
	@Autowired
	private ProductionDao productionDao;
	
	
	@Override
	public void save(Orders orders) {
		// TODO Auto-generated method stub
		baseDao.save(orders);
		
		
	}
	
	@Override
	public void update(Orders orders) {
		// TODO Auto-generated method stub
		baseDao.update(orders);
	}
	 
	public List<Orders> getOrderList(int designID) {
		// TODO Auto-generated method stub
		Session session = baseDao.getNewSession();	
		String hql = "select o from Orders as o where o.designID='"+designID+"'";
		Query query = session.createQuery(hql);
		List<Orders> list = query.list();
		return list;	
	}
	
	 
	public Orders getOrderByProductionID(int productionID) {
		// TODO Auto-generated method stub
		Session session = baseDao.getNewSession();	
		String hql = "from Orders as o where o.productionID='"+productionID+"'";
		Query query = session.createQuery(hql);
		List<Orders> list = query.list();
		if (null != list && list.size() > 0) {
			return (Orders)list.get(0);
			}
		else
			return null;
	}

	@Override
	public List<Orders> getAll() {
		// TODO Auto-generated method stub
		Session session = baseDao.getNewSession();	
		String hql = "from Orders";
		Query query = session.createQuery(hql);
		List<Orders> list = query.list();
		return list;
	}

	@Override
	public Orders getOrderByID(int orderID) {
		// TODO Auto-generated method stub
		return (Orders) baseDao.load(Orders.class, orderID);
	}
	
	@Override
	public Orders getOrderByCode(String orderCode) {
		// TODO Auto-generated method stub
		String hql = "select o from Orders as o where o.orderCode='"+orderCode+"'";
		List<Orders> list = baseDao.getSession().createQuery(hql).list();
		return list.get(0);
	}
	
	@Override
	public Orders getOrderByInquiryID(int inquiryID) {
		// TODO Auto-generated method stub
		Session session = baseDao.getNewSession();	
		String hql = "from Orders as o where o.inquiryID="+inquiryID;
		Query query = session.createQuery(hql);
		List<Orders> list = query.list();
		if (null != list && list.size() > 0) {
			return (Orders)list.get(0);
		}
		else
			return null;
	}

	@Override
	public Design getDesignByID(int designID) {
		// TODO Auto-generated method stub
	/*
        String hql="select d from Design as d where d.designID="+designID;
		List<Design> list = baseDao.getSession().createQuery(hql).list();
		
		if (null != list && list.size() > 0) {
			return list.get(0);
		}
		else
			return null;*/
		Design design = (Design) baseDao.load(Design.class,designID);
		
		return design;
	}

	@Override
	public Customer getCustomer(String customerBrandName) {
		String hql="select c from Customer as c where c.customerBrandName= '"+customerBrandName+"'";
		List<Customer> list = baseDao.getSession().createQuery(hql).list();
		
		if (null != list && list.size() > 0) {
			return list.get(0);
		}
		else
			return null;
		
	}

	@Override
	public Vendor getVendor(String vendorName) {
		// TODO Auto-generated method stub
	
		String hql="select v from Vendor as v where v.vendorName= '"+vendorName+"'";
		
		List<Vendor> list = baseDao.getSession().createQuery(hql).list();
		
		if (null != list && list.size() > 0) {
			return list.get(0);
		}
		else
			return null;
		
	}

}
