package productManage.dao.lhj;

import productManage.model.lhj.Material;
import productManage.model.lhj.Materialapply;


public interface MaterialapplyDao {
	/**
	 * 根据物料申请单的id获取物料申请单
	 * @param id
	 * @return
	 */
	
	
	public Materialapply getMaterialApplyByCode(String materialApplyCode);
}
