package productManage.service.customer.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.net.httpserver.Authenticator.Success;

import productManage.dao.wcy.OrdersDAO;
import productManage.dao.yrd.CustomerDao;
import productManage.model.yrd.Customer;
import productManage.service.PageService;
import productManage.service.customer.CustomerService;
import productManage.vo.PageBean;
import productManage.vo.customer.CustomerConstants;


/**
 * @author yrd
 * @date 创建时间2016-03-03
 */

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao customerDao;
	@Autowired
	private PageService pageService;
	
	
	public  CustomerDao getCustomerDao() {
		return customerDao;
	}
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	
	@Override
	public List<Customer> findCustomerInfo(String customerContactName,String customerBrandName,String customerType){
		List<Customer> customer = new ArrayList<Customer>();
		customerDao.findCustomerInfo(customerContactName, customerBrandName, customerType);		
		return customer;
	}
	
	@Override
	public void examineCustomer(String customerID,String customerState){
		int ID = Integer.parseInt(customerID);
		Customer customer = customerDao.getByCustomerID(ID);
		if(customer != null){
			customer.setCustomerState(customerState);
			customerDao.update(customer);
		}
		
	}
	
	@Override
	public void deleteCustomer(String customerID){
		int id = Integer.parseInt(customerID);
		Customer customer = customerDao.getByCustomerID(id);
		if(customer != null){
			customer.setCustomerState("已删除");
			customerDao.update(customer);
		}
	}
	
	@Override
	public List<Customer> getAll(){
		return customerDao.getAll();
	}
	
	@Override
	public Customer getByContactName(String customerContactName){		
		return customerDao.getByContactName(customerContactName);
	}
	
	@Override
	public Customer getByBrandName(String customerBrandName){		
		return customerDao.getByBrandName(customerBrandName);
	}
	
	@Override
	public List<Customer> getByType(String customerType){		
		return customerDao.getByType(customerType);
	}
	
	@Override
	public PageBean getCustomersByPage(int pageSize,int page){
		String hql="from Customer";
		return pageService.queryForPage(hql, pageSize, page);
	}
	
	@Override
	public PageBean searchCustomersByPage(int pageSize,int page,Map<String, Object> params){
		String hql="select c from Customer c";
		String customerContactName = (String)params.get(CustomerConstants.SEARCH_CUSTOMER_PARAMS[0]);
		String customerBrandName = (String)params.get(CustomerConstants.SEARCH_CUSTOMER_PARAMS[1]);
		String customerType = (String)params.get(CustomerConstants.SEARCH_CUSTOMER_PARAMS[2]);
		if((!(customerContactName.isEmpty()))&&(!(customerBrandName.isEmpty()))&&(!(customerType.equals("0")))){
			hql+=" where ";
			hql+=" c.customerContactName= '"+customerContactName+"'"+" and c.customerBrandName= '"+customerBrandName+"'"+
			"and c.customerType='"+customerType+"'";
		}else if((customerContactName.isEmpty())&&(customerBrandName.isEmpty())&&(customerType.equals("0"))){
			
		}else if((!(customerContactName.isEmpty()))&&(!(customerBrandName.isEmpty()))&&(customerType.equals("0"))){
			hql+=" where ";
			hql+=" c.customerContactName= '"+customerContactName+"'"+" and c.customerBrandName= '"+customerBrandName+"'";
		}else if((!(customerContactName.isEmpty()))&&(customerBrandName.isEmpty())&&(!(customerType.equals("0")))){
			hql+=" where ";
			hql+=" c.customerContactName= '"+customerContactName+"'"+" and c.customerType= '"+customerType+"'";
		}else if((customerContactName.isEmpty())&&(!(customerBrandName.isEmpty()))&&(!(customerType.equals("0")))){
			hql+=" where ";
			hql+=" c.customerType= '"+customerType+"'"+" and c.customerBrandName= '"+customerBrandName+"'";
		}else if((customerContactName.isEmpty())&&(customerBrandName.isEmpty())&&(!(customerType.equals("0")))){
			hql+=" where ";
			hql+=" c.customerType='"+customerType+"'";
		}else if((customerContactName.isEmpty())&&(!(customerBrandName.isEmpty()))&&(customerType.equals("0"))){
			hql+=" where ";
			hql+=" c.customerBrandName= '"+customerBrandName+"'";
			System.out.println(customerBrandName);
		}else if((!(customerContactName.isEmpty()))&&(customerBrandName.isEmpty())&&(customerType.equals("0"))){
			hql+=" where ";
			hql+=" c.customerContactName= '"+customerContactName+"'";
		}
		PageBean pageBean = pageService.queryForPage(hql, pageSize, page);
		return pageBean;
	}
	
	@Override
	public Customer getByID(int customerID) {
		return customerDao.getByCustomerID(customerID);
	}
	

}
