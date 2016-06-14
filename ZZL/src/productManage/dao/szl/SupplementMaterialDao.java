package productManage.dao.szl;

import java.util.List;

import productManage.model.lhj.Supply;
import productManage.model.szl.SupplementMaterial;

public interface SupplementMaterialDao {
	
	public void add(SupplementMaterial supplementMaterial);
	
	public List<SupplementMaterial> getSupplementMaterialBySupplementID(int supplementID);
	
	public String getMaterialType(int supplementID);
	
	public List<Supply> getMaterialForSelect(String hql);
}
