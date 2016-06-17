package productManage.action.orders;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.PageAction;
import productManage.model.yk.Orders;
import productManage.service.orders.OrdersService;
import productManage.vo.orders.OrdersConstants;

public class OrderAction extends PageAction{
	@Autowired
	private OrdersService ordersService;
	
	private int orderID;
	private String orderCode;//客户订单编码
	private String customerName;//客户名称
	private String inquiryProgress;//询价单进度
	private String sampleOrderProgress;//样衣单进度
	private String productionProgress;//生产单进度
	private String chargeName;//负责人名字
	private Orders order;//客户订单
	
	/*
	 * Ajax更新订单负责人
	 */
	private int chargeId;//负责人ID
	private String orderCodeAjax;//客户订单编码
	
	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getInquiryProgress() {
		return inquiryProgress;
	}

	public void setInquiryProgress(String inquiryProgress) {
		this.inquiryProgress = inquiryProgress;
	}

	public String getSampleOrderProgress() {
		return sampleOrderProgress;
	}

	public void setSampleOrderProgress(String sampleOrderProgress) {
		this.sampleOrderProgress = sampleOrderProgress;
	}

	public String getProductionProgress() {
		return productionProgress;
	}

	public void setProductionProgress(String productionProgress) {
		this.productionProgress = productionProgress;
	}

	public String getChargeName() {
		return chargeName;
	}

	public void setChargeName(String chargeName) {
		this.chargeName = chargeName;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public int getChargeId() {
		return chargeId;
	}

	public void setChargeId(int chargeId) {
		this.chargeId = chargeId;
	}

	public String getOrderCodeAjax() {
		return orderCodeAjax;
	}

	public void setOrderCodeAjax(String orderCodeAjax) {
		this.orderCodeAjax = orderCodeAjax;
	}

	public String getAllOrdersByPage() {
		if (request.getSession().getAttribute("account")!=null) {
			this.orderCode = null;
			this.customerName = null;
			this.inquiryProgress = null;
			this.sampleOrderProgress = null;
			this.productionProgress = null;
			this.chargeName = null;
			this.pageBean = ordersService.getAllOrdersByPage(this.rowsPerPage,this.page);
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
	public String searchOrdersByPage(){
		if (request.getSession().getAttribute("account")!=null) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(OrdersConstants.SEARCH_ORDERS_PARAMS[0], this.orderCode);
			params.put(OrdersConstants.SEARCH_ORDERS_PARAMS[1], this.customerName);
			params.put(OrdersConstants.SEARCH_ORDERS_PARAMS[2], this.inquiryProgress);
			params.put(OrdersConstants.SEARCH_ORDERS_PARAMS[3], this.sampleOrderProgress);
			params.put(OrdersConstants.SEARCH_ORDERS_PARAMS[4], this.productionProgress);
			params.put(OrdersConstants.SEARCH_ORDERS_PARAMS[5], this.chargeName);
			
			this.pageBean = ordersService.searchOrdersByPage(this.rowsPerPage, this.page, params);
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
	public String getOrderByID(){
		if (request.getSession().getAttribute("account")!=null) {
			this.order = ordersService.getOrderByID(orderID);
			if(order==null)
				return ERROR;
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
	public String updateCharge(){
		if (request.getSession().getAttribute("account")!=null) {
			ordersService.updateCharge(orderCodeAjax, chargeId);
			return SUCCESS;
		}else{
			return "failed";
		}
	}
}
