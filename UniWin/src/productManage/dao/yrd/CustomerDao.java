package productManage.dao.yrd;

import java.util.List;

import productManage.model.yrd.Customer;

/**
 * @author yrd
 * @date 创建时间2016-02-27
 */

public interface CustomerDao {
	
	public List<Customer> findCustomerInfo(String customerContactName,String customerBrandName,String customerType);//查询客户资料
	public void examineCustomer(Customer customer);//审核客户
	public void deleteCustomer(Customer customer);
	public List<Customer> getAll();
	public Customer getByContactName(String customerContactName);
	public Customer getByBrandName(String customerBrandName);
	public Customer getByCustomerID(int customerID);
	public Customer getByID(String  customerID);
	public List<Customer> getByType(String customerType);
	public void update(Customer customer);

}
