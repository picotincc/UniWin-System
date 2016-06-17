package productManage.dao.yrd.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.yrd.CustomerDao;
import productManage.model.tms.Design;
import productManage.model.wcy.Qc;
import productManage.model.yrd.Customer;
import productManage.model.yrd.PhaseCondition;

/**
 * @author yrd
 * @date 创建时间2016-02-27
 */

@Repository
public class CustomerDaoImpl implements CustomerDao{
	
	@Autowired
	private BaseDao basedao;
	
	@Override
	public List<Customer> findCustomerInfo(String customerContactName,String customerBrandName,String customerType){
		Session session = basedao.getNewSession();	
		String hql = "from productManage.Model.Customer as c where c.customerContactName='"+customerContactName+"'"
				+ "and c.customerBrandName='"+customerBrandName+"'"+"and c.customerType='"+customerType+"'";
		Query query = session.createQuery(hql);
		List<Customer> list = query.list();
		return list;		
	}
	
	@Override
	public void examineCustomer(Customer customer){
		basedao.update(customer);
	}
	
	@Override
	public void deleteCustomer(Customer customer){
		basedao.delete(customer);
	}
	
	@Override
	public List<Customer> getAll(){
		return basedao.getAllList(Customer.class);
	}
	
	@Override
	public Customer getByContactName(String customerContactName){
		String hql = "from Customer c  where c.customerContactName='"+customerContactName+"'";
		Session session = basedao.getSession();
		List<Customer> results = session.createQuery(hql).list();
		return results.size()>=1?results.get(0):null;
	}
	
	@Override
	public Customer getByBrandName(String customerBrandName){
		String hql = "from Customer c  where c.customerBrandName='"+customerBrandName+"'";
		Session session = basedao.getSession();
		return (Customer) session.createQuery(hql).list().get(0);
	}
	
	@Override
	public List<Customer> getByType(String customerType){
		String hql = "from Customer c  where c.customerType='"+customerType+"'";
		Session session = basedao.getSession();
		return  session.createQuery(hql).list();
	}
	
	@Override
	public Customer getByCustomerID(int customerID){
		String hql = "from Customer c  where c.customerID='"+customerID+"'";
		Session session = basedao.getSession();
		return  (Customer) session.createQuery(hql).list().get(0);
	}
	
	@Override
	public void update(Customer customer){
		basedao.update(customer);
	}

	@Override
	public Customer getByID(String customerID) {
		// TODO Auto-generated method stub
		String hql = "from Customer c  where c.customerType='"+customerID+"'";
		Session session = basedao.getSession();
		return  (Customer) session.createQuery(hql).list().get(0);
	}

}
