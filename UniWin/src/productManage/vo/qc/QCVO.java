package productManage.vo.qc;


import java.util.List;

import org.springframework.stereotype.Component;

import productManage.model.User;
import productManage.model.tms.Design;
import productManage.model.wcy.Qc;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.Orders;
import productManage.model.zky.Production;
import productManage.vo.production.OrderDetailVO;

@Component
public class QCVO {
	private Qc qc;
	private Design design;
	private Orders orders;
	private Production production;
	private User user;
	private List<OrderDetailVO> orderDetails;
	private String customerName;
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public List<OrderDetailVO> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(List<OrderDetailVO> orderDetails) {
		this.orderDetails = orderDetails;
	}
	public Design getDesign() {
		return design;
	}
	public void setDesign(Design design) {
		this.design = design;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	
	public Production getProduction() {
		return production;
	}
	public void setProduction(Production production) {
		this.production = production;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Qc getQc() {
		return qc;
	}
	public void setQc(Qc qc) {
		this.qc = qc;
	}
	
	
	
	
}
