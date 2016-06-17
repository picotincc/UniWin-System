package productManage.service.designOrder;

import java.util.List;

import productManage.model.User;
import productManage.model.cs.OutSourceDetail;
import productManage.model.lhj.Supply;
import productManage.model.lhj.Vendor;
import productManage.model.tms.Design;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.OrderMaterialDetail;
import productManage.model.yk.Orders;
import productManage.model.yrd.Customer;

public interface DesignOrderService {

	public Design getDesignByID(int designID);
	public Customer getCustomer(String customerBrandName);
	public Vendor getVendor(String vendorName);
	public void save(Orders orders,User user);
	public void save1(Orders orders);

	public void update(Orders orders);
	public void addOrderDetail(Orders orders,List<OrderDetail> details_add);
	public void addOrderMaterialdetail(Orders orders,List<OrderMaterialDetail> materialdetails_add);
	public OrderMaterialDetail getOD(OrderMaterialDetail orderMaterialDetail,
			String materialName, String materialType, String colorCode,
			String vendorName);
	public List<Supply> getSupplyList(Design design);
}
