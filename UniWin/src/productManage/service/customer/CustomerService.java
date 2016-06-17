package productManage.service.customer;

import java.util.List;
import java.util.Map;


import productManage.model.yrd.Customer;
import productManage.vo.PageBean;

/**
 * @author yrd
 * @date 创建时间2016-03-03
 */

public interface CustomerService {
	
	//查询客户信息
	public List<Customer> findCustomerInfo(String customerContactName,String customerBrandName,String customerType);
	
	//审核客户
	public void examineCustomer(String customerID,String customerState);
	
	public void deleteCustomer(String customerID);
	
	public  List<Customer> getAll() ;

//	public PageBean queryCustomer(int pageSize, int page,
//			Map<String, Object> params);
	
	public Customer getByContactName(String customerContactName);
	
	public Customer getByBrandName(String customerBrandName);
	
	public Customer getByID(int customerID);
	
	public List<Customer> getByType(String customerType);
	
	public PageBean getCustomersByPage(int pageSize,int page);
	
	public PageBean searchCustomersByPage(int pageSize,int page,Map<String, Object> params);
	

}
