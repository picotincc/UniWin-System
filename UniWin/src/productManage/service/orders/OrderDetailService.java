package productManage.service.orders;

import java.util.List;

import productManage.model.yk.OrderDetail;
import productManage.model.yk.OrderMaterialDetail;

public interface OrderDetailService {
	
	public void save(OrderDetail orderDetail);
	public void update(OrderDetail orderDetail);
	public OrderDetail getOrderDetail(int orderID);
	public List<OrderDetail> getAll();
	public void SaveOrderMaterailDetail(OrderMaterialDetail orderMaterialDetail);
}
