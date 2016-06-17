package productManage.dao.wcy;

import java.util.List;

import productManage.model.lhj.Vendor;
import productManage.model.tms.Design;
import productManage.model.yk.OrderMaterialDetail;
import productManage.model.yk.Orders;
import productManage.model.yrd.Customer;

public interface OrdersDAO {

	public void save(Orders orders);
	public void update(Orders orders);
	public List<Orders> getAll();
	public Orders getOrderByID(int orderID);
	public Orders getOrderByCode(String orderCode);
	public List<Orders> getOrderList(int designID);
	public Orders getOrderByProductionID(int productionID);
	public Orders getOrderByInquiryID(int inquiryID);
	public Design getDesignByID(int designID);
	public Customer getCustomer(String customerBrandName);
	public Vendor getVendor(String vendorName);

}
