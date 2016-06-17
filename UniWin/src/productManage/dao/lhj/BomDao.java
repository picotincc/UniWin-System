package productManage.dao.lhj;

import productManage.model.lhj.Bom;
import productManage.model.lhj.Material;
import productManage.model.tms.Design;

public interface BomDao {

	public void addBom(Bom bom);
	
	public void deleteBom(Material m,Design d);
}
