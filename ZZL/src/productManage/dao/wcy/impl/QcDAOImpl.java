package productManage.dao.wcy.impl;

import java.sql.Timestamp;
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
import productManage.dao.wcy.QcDAO;
import productManage.model.tms.Design;
import productManage.model.wcy.Qc;
import productManage.model.wy.Role;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.Orders;
import productManage.model.yrd.Customer;
import productManage.model.User;
import productManage.model.zky.Production;
import productManage.vo.production.OrderDetailVO;
import productManage.vo.qc.QCVO;

import java.util.List;
@Repository
public class QcDAOImpl implements QcDAO{

	@Autowired
	private BaseDao baseDao;
	@Autowired
	private OrdersDAO ordersDAO  ;
	
	
	@Override
	public void add(Qc qc) {
		// TODO Auto-generated method stub
	//	baseDao.save(qc);
		try {
			Session session = baseDao.getSession();
			session.save(qc);
			session.flush();
			session.clear();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw(e);//��һ�����Լ�����ȥ��,Ϊ����AdminDaoImpl�ķ���֪���������ʱ�����쳣
		}
	}

	

	@Override
	public Design getDesignPic(String designCode) {
		// TODO Auto-generated method stub
		Session session = baseDao.getNewSession();	
		String hql = "from Design as d where d.designCode='"+designCode+"'";
		Query query = session.createQuery(hql);
		List<Design> list = query.list();
		if (null != list && list.size() > 0) {
			return (Design)list.get(0);
			}
		else
			return null;
	
	}

	

	@Override
	public Customer getCustomerName(int customerID) {
		// TODO Auto-generated method stub
		Session session = baseDao.getNewSession();	
		String hql = "from Customer as c where c.customerID='"+customerID+"'";
		Query query = session.createQuery(hql);
		List<Customer> list = query.list();
		if (null != list && list.size() > 0) {
			return (Customer)list.get(0);
			}
		else
			return null;
	}

	@Override
	public  List<Qc> getAll() {
		// TODO Auto-generated method stub
		/*Session session = baseDao.getNewSession();	
		String hql = "from Qc ";
		Query query = session.createQuery(hql);
		List<Qc> list = query.list();
		return list;*/
		return  (List<Qc>) baseDao.getAllList(Qc.class);
	}

	

	@Override
	public  List<Qc> get(String designCode, String qCDesignateTime,
			String userName, String qCState) {
		// TODO Auto-generated method stub
		
		Session session = baseDao.getNewSession();	
		String hql = "from Qc as c where c.QCDesignateTime='"+qCDesignateTime+"'"
				+ "and c.QCState='"+qCState+"'";
		Query query = session.createQuery(hql);
		List<Qc> list = query.list();
		List<Qc> list1 = new ArrayList<Qc>();
		List<Qc> list2 = new ArrayList<Qc>();
		if (null != list && list.size() > 0) {
			for(int i=0;i<list.size();i++){
				int productionID = list.get(i).getProduction().getProductionID();
				 
				Orders orders = ordersDAO.getOrderByProductionID(productionID);
				if(orders.getDesign().getDesignCode().equals(designCode))
					list1.add(list.get(i));
			}
			if (null != list1 && list1.size() > 0) {
				for(int i=0;i<list1.size();i++){
					String userName1 = list1.get(i).getUser().getUserName();
					if(userName1.equals(userName))
						list2.add(list1.get(i));
				}
			return list2;	
			}
			else{
				return null;
			}
			
			}
		else
			return null;
	}

	@Override
	public  List<User> getAllUsers() {
		// TODO Auto-generated method stub
		Session session = baseDao.getNewSession();	
		String hql = "from UserDetail as c where c.userDepartmentId='1'";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		return list;
		
	}

	@Override
	public  List<User> getUserByName(String username) {
		// TODO Auto-generated method stub
		Session session = baseDao.getNewSession();	
		String hql = "from UserDetail as c where c.userName='"+username+"'";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		return list;
	}



	


	@Override
	public QCVO getQCVOByQc(Qc qc) {
		int productionID = qc.getProduction().getProductionID();
		String hql="select o from Orders as o where o.production.productionID="+productionID;
		List<Orders> list = baseDao.getSession().createQuery(hql).list();
		if(null != list && list.size() > 0){
		QCVO qcvo = new QCVO();
		qcvo.setQc(qc);
		qcvo.setOrders(list.get(0));
		qcvo.setDesign(list.get(0).getDesign() );
		qcvo.setProduction(qc.getProduction());
		qcvo.setUser(qc.getUser());
		
		qcvo.setCustomerName(list.get(0).getCustomer().getCustomerBrandName());
		
		
		//判断质检环节productionProgress
		//String[] qcStep = qc.getQCStages()
		
		
		
		Orders order = null;
		if (qc.getProduction().getOrders().iterator().hasNext()) {
			order = qc.getProduction().getOrders().iterator().next();
		}
		Iterator<OrderDetail> detailItr = order.getOrderDetails().iterator();
		List<OrderDetailVO> orderDetails = new ArrayList<OrderDetailVO>();
		while (detailItr.hasNext()) {
			OrderDetail temp = detailItr.next();
			/*orderDetails.add(new OrderDetailVO(temp.getOrderColor(), temp.getOrderXS(), temp.getOrderS(),
					temp.getOrderM(), temp.getOrderL(), temp.getOrderXL(), temp.getOrderXXL(),
					temp.getTotalNum(),));*/
			OrderDetailVO temp_order= new OrderDetailVO();
			temp_order.setColor(temp.getOrderColor());
			temp_order.setXS(temp.getOrderXS()); 
			 temp_order.setS(temp.getOrderS());
			 temp_order.setM(temp.getOrderM());
			temp_order.setL(temp.getOrderL());
			temp_order.setXL(temp.getOrderXL());
			temp_order.setXXL(temp.getOrderXXL());
			temp_order.setTotal(temp.getTotalNum());
			orderDetails.add(temp_order);
		}
		qcvo.setOrderDetails(orderDetails);
		return qcvo;
		}
		else {
		    QCVO qcvo = new QCVO();
			qcvo.setQc(qc);
			qcvo.setProduction(qc.getProduction());
			qcvo.setUser(qc.getUser());
			qcvo.setOrderDetails(null);
			return qcvo;
		}
	}



	@Override
	public String update(Qc qc) {
		
		//baseDao.save(savedqc);
		try {
			Session session = baseDao.getSession();
			session.update(qc);
			session.flush();
			/*session.clear();*/
		} catch (Exception e) {
			e.printStackTrace();
			throw(e);
		}
	
		return "success";
	}



	@Override
	public Qc getQcById(int qcID) {
		Qc qc = (Qc) baseDao.load(Qc.class,qcID);
		
		
		return qc;
		
	}
	public Qc getQcByCode(String qcCode){
		  String hql="select q from Qc as q where q.QCCode= '"+qcCode+"'";
		  return (Qc) baseDao.getSession().createQuery(hql).list().get(0);
	}


	@Override
	public void setCharge(int userId, int qcID) {
		// TODO Auto-generated method stub
		Qc qc = getQcById(qcID);
       String hql="select u from User as u where u.userId="+userId;
		
		List<User> list = baseDao.getSession().createQuery(hql).list();
		if(null != list && list.size() > 0){
		   User user = list.get(0);
			qc.setUser(user);
			update(qc);
		}
		
	}



	@Override
	public QCVO getQCVOByOrder(int orderID) {
		// TODO Auto-generated method stub
        String hql="select o from Orders as o where o.orderID="+orderID;
		List<Orders> list = baseDao.getSession().createQuery(hql).list();
		if(null != list && list.size() > 0){
			QCVO qcvo = new QCVO();
			
			qcvo.setOrders(list.get(0));
			qcvo.setDesign(list.get(0).getDesign() );
			qcvo.setProduction(list.get(0).getProduction());
			Orders order = list.get(0);
			
			Iterator<OrderDetail> detailItr = order.getOrderDetails().iterator();
			List<OrderDetailVO> orderDetails = new ArrayList<OrderDetailVO>();
			while (detailItr.hasNext()) {
				OrderDetail temp = detailItr.next();
				/*orderDetails.add(new OrderDetailVO(temp.getOrderColor(), temp.getOrderXS(), temp.getOrderS(),
				temp.getOrderM(), temp.getOrderL(), temp.getOrderXL(), temp.getOrderXXL(),
				temp.getTotalNum(),));*/
		 OrderDetailVO temp_order= new OrderDetailVO();
		temp_order.setColor(temp.getOrderColor());
		temp_order.setXS(temp.getOrderXS()); 
		 temp_order.setS(temp.getOrderS());
		 temp_order.setM(temp.getOrderM());
		temp_order.setL(temp.getOrderL());
		temp_order.setXL(temp.getOrderXL());
		temp_order.setXXL(temp.getOrderXXL());
		temp_order.setTotal(temp.getTotalNum());
		orderDetails.add(temp_order);
			}
			
			qcvo.setOrderDetails(orderDetails);
			qcvo.setCustomerName(order.getCustomer().getCustomerBrandName());
			return qcvo;
		}
		else
			return null;
	}



	@Override
	public User getUserByAccount(String account) {
		
	       String hql="select u from User as u where u.userAccount= '"+ account+"'";
			
			List<User> list = baseDao.getSession().createQuery(hql).list();
			
			return list.get(0);
		
	}
    
	public void delete(String QCCode){
		Qc qc = getQcByCode(QCCode);		
		if(qc.getProduction()!=null){
		Production production = qc.getProduction();
		Set<Qc> qcs =production.getQcs();
		qcs.remove(qc);
		production.setQcs(qcs);
		}
		if(qc.getUser()!=null){
		User user = qc.getUser();
		Set<Qc> qcset =user.getQcs();
		qcset.remove(qc);
		user.setQcs(qcset);
		}
		//baseDao.delete(qc);
		Session session = baseDao.getSession();
		String hql="delete Qc as q where q.QCID="+qc.getQCID();
		Query query=session.createQuery(hql);
		query.executeUpdate();
		session.beginTransaction().commit();
		System.out.println("deleteaaa");
	}


 


	

}
