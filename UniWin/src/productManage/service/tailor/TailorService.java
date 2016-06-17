package productManage.service.tailor;

import java.util.Map;

import productManage.model.zky.Production;
import productManage.vo.PageBean;
import productManage.vo.tailor.TailorDetailVO;
/**
 * 
 * @author 克崽兽EX
 *
 */
public interface TailorService {
	/**
	 * 按照特定条件，分页查询裁剪情况
	 * @param pageSize 每页条目数
	 * @param page	页号
	 * @param params 其它参数
	 * @return 封装有裁剪情况列表以及页面控制参数的组件
	 */
	public PageBean queryTailorsCondition(int pageSize,int page,Map<String,Object> params);
	
	public TailorDetailVO queryTailor(int tailorID);
	
	public TailorDetailVO modifyTailor(TailorDetailVO tailor);
	
	/**
	 * 根据生产单建立未开始的裁剪单
	 * @param productionCode 生产单编码
	 */
	public void initializeTailors(String productionCode);
}
