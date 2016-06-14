package productManage.model.yrd;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import productManage.model.tms.Technique;
import productManage.model.yk.Orders;

/**
 * @author yrd
 * @date 创建时间2016-02-27
 */

@Entity
@Table(name="customer")

public class Customer {

	@Id
	private int customerID;
	
	private String customerContactName;
	
	private String customerBrandName;
	
	private String customerType;
	
	private String customerPhone;
	
	private String customerEMail;
	
	private String customerState;
	
	private String customerAddress;

	 /**
     * 客户订单的集合 
     */
    @OneToMany(mappedBy="customer",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    private Set<Orders> orders=new HashSet<Orders>();
	public Customer(){
    	
    }
    
	public Customer(int customerID, String customerContactName,
			String customerBrandName, String customerType,
			String customerPhone, String customerEMail, String customerState,
			String customerAddress, Set<Orders> orders) {
		this.customerID = customerID;
		this.customerContactName = customerContactName;
		this.customerBrandName = customerBrandName;
		this.customerType = customerType;
		this.customerPhone = customerPhone;
		this.customerEMail = customerEMail;
		this.customerState = customerState;
		this.customerAddress = customerAddress;
		this.orders = orders;
	}


	public Set<Orders> getOrders() {
		return orders;
	}

	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}

	public int getCustomerID() {
		return customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	public String getCustomerContactName() {
		return customerContactName;
	}

	public void setCustomerContactName(String customerContactName) {
		this.customerContactName = customerContactName;
	}

	public String getCustomerBrandName() {
		return customerBrandName;
	}

	public void setCustomerBrandName(String customerBrandName) {
		this.customerBrandName = customerBrandName;
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerEMail() {
		return customerEMail;
	}

	public void setCustomerEMail(String customerEMail) {
		this.customerEMail = customerEMail;
	}

	public String getCustomerState() {
		return customerState;
	}

	public void setCustomerState(String customerState) {
		this.customerState = customerState;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
    
}
