package productManage.dao.lhj;

import java.util.List;

import productManage.model.lhj.Supply;

public interface SupplyDao {
	
	public Supply getSupplyByID(int supplyID);//by szl

	public void add(Supply supply);
	
	
	
	public void update(Supply supply);
	
	public List<Supply> getSupplyByVendor(int vendorId);
	
	public List<Supply> getSupplyByMaterial(String materialCode);
}
