package productManage.service.supplement;

import java.util.List;
import java.util.Map;

import productManage.model.lhj.Material;
import productManage.model.szl.Supplement;
import productManage.model.szl.SupplementMaterial;
import productManage.vo.PageBean;
import productManage.vo.supplement.SupplementMaterialVO;

public interface SupplementCreateService {

	public int createSupplement(Supplement supplement);
	public void createSupplementMaterial(SupplementMaterial sm);
	public List<SupplementMaterialVO> getLiningMaterial(String materialCode,String materialName,String shellAccessoryType);
	public List<SupplementMaterialVO> getAuxMaterial(String materialCode,String materialName,String shellAccessoryType);
	
}
