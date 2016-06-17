package productManage.dao.zky;

import java.util.List;

import productManage.model.zky.Production;

/**
 * 
 * @author 克崽兽EX
 *
 */
public interface ProductionDao {
	/**
	 * 保存（新增）生产单
	 * 
	 * @param production
	 */
	public void save(Production production);
	/**
	 * 获取生产单
	 * @param productionNo 生产单编码
	 * @return 生产单
	 */
	public Production getProductionByCode(String productionNo);
	/**
	 * 获取生产单
	 * @param productionId 生产单ID
	 * @return 生产单
	 */
	public Production getProductionById(int productionId);
	/**
	 * 根据排单状态获取生产单
	 * @param productionState 排单状态
	 * @return 生产单列表
	 */
	public List<Production> getProductionByProductionState(String productionState);
}
