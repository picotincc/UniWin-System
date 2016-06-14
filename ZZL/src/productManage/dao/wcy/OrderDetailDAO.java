package productManage.dao.wcy;

import java.util.List;

import productManage.model.User;
import productManage.model.lhj.Material;
import productManage.model.lhj.Supply;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.OrderMaterialDetail;

public interface OrderDetailDAO {
	
	public void save(OrderDetail orderDetail);
	public void update(OrderDetail orderDetail);
	public OrderDetail getOrderDetail(int orderID);
	public List<OrderDetail> getAll();
	public void SaveOrderMaterailDetail(OrderMaterialDetail orderMaterialDetail);
	public void add(OrderDetail od);
	public Material getMaterial(String materialName,String colorCode,String materialType);
	public Supply getSupply(String materialCode, int vendorId);
	public void addOrderMaterialdetail(OrderMaterialDetail od);
	public void addSupply(Supply supply1);
}
