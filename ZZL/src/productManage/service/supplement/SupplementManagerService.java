package productManage.service.supplement;

import java.util.Map;

import productManage.model.szl.Supplement;
import productManage.vo.PageBean;
import productManage.vo.supplement.SupplementDetailVO;

public interface SupplementManagerService {
	
	public SupplementDetailVO getSupplementDetail(String supplementCode);
	
	
	public PageBean querySupplements(int pageSize,int page,Map<String,Object> params);

	public PageBean getAllSupplement(int page, int rowsPerPage);

	public Supplement changeState(String supplementCode, String supplementState);
}
