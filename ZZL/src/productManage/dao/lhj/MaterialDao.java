package productManage.dao.lhj;

import java.util.List;

import productManage.model.lhj.Material;


public interface MaterialDao {
	

	public Material getMaterialByMaterialCode(String materialCode);
	public List<Material> getMaterialList(String hql);
	public List<Material> getMaterialByKey(String key);
	
    public List<MaterialDao> getAll();
    public List<MaterialDao> getMaterialInList(String id,String ClouthStyleId,String style,String purcharseId);
    public List<MaterialDao> getMaterialOutList(String id,String ClouthStyleId,String MaterialName ,String preOrderId);

	public void add(Material material);

	public void update(Material material);

	public void delete(String materialCode);
}
