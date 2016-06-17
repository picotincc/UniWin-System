package productManage.action.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.action.PageAction;
import productManage.model.wy.Department;
import productManage.model.yrd.Customer;
import productManage.service.customer.CustomerService;
import productManage.vo.PageBean;
import productManage.vo.customer.CustomerConstants;
import productManage.vo.technique.TechniqueConstants;


/**
 * @author yrd
 * @date 创建时间2016-03-07
 */

public class CustomerAction extends PageAction {
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CustomerService customerService;
	private String customerContactName;
	private String customerBrandName;
	private String customerType;
	private List<Customer> customerList;
	
	
	public CustomerService getCustomerService(){
		return customerService;
	}
	
	public void setCustomerService(CustomerService customerService){
		this.customerService = customerService;
	}
	
	public String getCustomerContactName(){
		return customerContactName;
	}
	
	public void setCustomerContactName(String customerContactName){
		this.customerContactName = customerContactName;
	}
	
	public String getCustomerBrandName(){
		return customerBrandName;
	}
	
	public void setCustomerBrandName(String customerBrandName){
		this.customerBrandName = customerBrandName;
	}
	
	public String getCustomerType(){
		return customerType;
	}
	
	public void setCustomerType(String customerType){
		this.customerType = customerType;
	}
	
	public List<Customer> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(List<Customer> customerList) {
		this.customerList = customerList;
	}
	
	//显示所有用户
	public String CustomerManage(){
		this.pageBean = customerService.getCustomersByPage(this.rowsPerPage, this.page);
		return SUCCESS; 
	}
	

	public String execute() throws ServletException, IOException{
		if (request.getSession().getAttribute("account")!=null){
//			String customerContactName = request.getParameter("customerContactName");
//			String customerBrandName = request.getParameter("customerBrandName");
//			String customerType =  request.getParameter("customerType");
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(CustomerConstants.SEARCH_CUSTOMER_PARAMS[0],customerContactName);
			params.put(CustomerConstants.SEARCH_CUSTOMER_PARAMS[1],customerBrandName );
			params.put(CustomerConstants.SEARCH_CUSTOMER_PARAMS[2],customerType );
			this.pageBean = customerService.searchCustomersByPage(this.rowsPerPage, this.page, params);
			return SUCCESS;
		}else{
			return "failed";
		}
		
	}
	
	public String examine(){
		if (request.getSession().getAttribute("account")!=null){
			String customerID = request.getParameter("examineID");
			String customerState = request.getParameter("examineState");
			customerService.examineCustomer(customerID,customerState);
			return SUCCESS;
		}else{
			return "failed";
		}
		
	}
	
	public String delete(){
		if (request.getSession().getAttribute("account")!=null){
			String customerID = request.getParameter("deleteID");
			customerService.deleteCustomer(customerID);
			return SUCCESS;
		}else{
			return "failed";
		}	
	}
}
