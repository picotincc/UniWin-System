package productManage.action.inquiry;

/**
 * @author TMS
 * @date 2016-3-02
 */
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;







import productManage.action.BaseAction;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.Inquiry;
import productManage.model.yk.Orders;
import productManage.service.inquiry.InquiryService;
import productManage.service.orders.OrderDetailService;
import productManage.service.orders.OrdersService;

/**
 * @author TMS
 * @date 2016-3-02
 */
public class ManageInquiryAction extends BaseAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private InquiryService inquiryService;
	public InquiryService getInquiryService() {
		return inquiryService;
	}

	public void setInquiryService(InquiryService inquiryService) {
		this.inquiryService = inquiryService;
	}

	@Autowired
	private OrdersService ordersService;
	public OrdersService getOrdersService() {
		return ordersService;
	}

	public void setOrdersService(OrdersService ordersService) {
		this.ordersService = ordersService;
	}
	
	@Autowired
	private OrderDetailService orderDetailService;
	public OrderDetailService getOrderDetailService() {
		return orderDetailService;
	}

	public void setOrderDetailService(OrderDetailService orderDetailService) {
		this.orderDetailService = orderDetailService;
	}
	
	
	private String inquiryCode;
	public String getInquiryCode() {
		return inquiryCode;
	}

	public void setInquiryCode(String inquiryCode) {
		this.inquiryCode = inquiryCode;
	}
	
	
	public String excute() throws ServletException, IOException{
		ServletContext sc = request.getServletContext();
		Inquiry inquiry = inquiryService.getByCode(inquiryCode);
		Orders orders = ordersService.getOrderByInquiryID(inquiry.getInquiryID());
		OrderDetail orderDetail = orderDetailService.getOrderDetail(orders.getOrderID());
		sc.setAttribute("inquiry", inquiry);
		sc.setAttribute("order", orders);
		sc.setAttribute("orderDetail", orderDetail);
		return SUCCESS;
	}


}
