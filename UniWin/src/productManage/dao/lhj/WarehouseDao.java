package productManage.dao.lhj;

import java.util.List;

import productManage.model.lhj.WareHouse;

public interface WarehouseDao {

	public void add(WareHouse warehouse);
	
	public void update(WareHouse warehouse);
	
	public WareHouse getWarehouseByLocation(String location);
	
	public WareHouse getWarehouseById(int id);
	
	public List<WareHouse> getWarehouseList();
}
