package productManage.service.material;

import java.util.Map;

import productManage.model.lhj.Bom;
import productManage.model.lhj.Material;
import productManage.model.tms.Design;
import productManage.vo.PageBean;

public interface BomService {
	
	public PageBean queryDesign(int pageSize, int page, Map<String, Object> params);
	
	public void addDesign(Design design);
	
	public void quitDesign(String designId);
	
	public void addBom(Bom bm);
	
	public void deleteBom(Material m,Design d);
		
	public Design getDesignById(String id);
	
}
