package productManage.service.material;

import java.util.List;
import java.util.Map;

import productManage.model.lhj.Material;
import productManage.model.lhj.Supply;
import productManage.model.lhj.WareHouse;
import productManage.model.wjx.Store;
import productManage.vo.PageBean;

public interface MaterialService {
	
	public void addMaterial(Material material);
	
	public void addSupply(Supply supply);
	
	public void addStore(Store store);
	
	public void updateMaterial(Material material);
	
	public PageBean queryMaterial(int pageSize, int page, Map<String, Object> params);
	
	public Material getMaterialByCode(String materialCode);
	
	public List<Material> getMaterialByKey(String key);
	
	public WareHouse getWarehouseByLocation(String location);
	
	public PageBean queryApply(int pageSize, int page, Map<String, Object> params);
	
	public List<Material> getMaterialList(Map<String, Object> params);
	
	public List<WareHouse> getWareHouseList();
	
	public List<Material> getFuliaoMaterial();
}
