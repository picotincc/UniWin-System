package productManage.service.orders;

import java.util.List;
import java.util.Map;

import productManage.model.yk.Orders;
import productManage.vo.PageBean;

public interface OrdersService {

	public void save(Orders orders);
	public void update(Orders orders);
	public List<Orders> getAll();
	public Orders getOrderByID(int orderID);
	public List<Orders> getOrderList(int designID);
	public Orders getOrderByProductionID(int productionID);
	public Orders getOrderByInquiryID(int inquiryID);
	public PageBean getAllOrdersByPage(int pageSize,int page);
	public PageBean searchOrdersByPage(int pageSize,int page,Map<String, Object> params);
	public void updateCharge(String orderCode,int chargeId);
	/**
	 * 根据订单编码获取订单
	 * @param productionCode 订单编码
	 * @return 订单
	 */
	public Orders getOrderByCode(String productionCode);
}
