package productManage.service.production;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import productManage.model.User;
import productManage.model.yk.Orders;
import productManage.model.zky.Production;
import productManage.vo.PageBean;
import productManage.vo.production.AbnormalParameterVO;
import productManage.vo.production.PrintProductionVO;
import productManage.vo.production.ProductionVO;

public interface ProductionService {
	/**
	 * 根据（多个）订单新增生产单
	 * @param orders 订单列表
	 * @return SUCCESS：成功，FAIL：失败
	 */
	public String addProduction(List<String> orders,User user);
	/**
	 * 按照特定条件，分页查询生产单列表信息
	 * @param pageSize 每页条目数
	 * @param page	页号
	 * @param params 其它参数
	 * @return 封装有生产单列表以及页面控制参数的组件
	 */
	public PageBean queryProductions(int pageSize,int page,Map<String,Object> params);
	/**
	 * 查询生产单详细信息
	 * @param productionCode 生产单编码
	 * @return 封装一系列订单信息的生产单详情
	 */
	public ProductionVO queryProduction(String productionCode);
	/**
	 * 
	 * @param productionCode 生产单编码
	 * @return 待打印的生产单详情
	 */
	public PrintProductionVO printProduction(String productionCode);
	/**
	 * 修改生产单
	 * @param vo
	 * @return 成功：SUCCESS,失败：FAIL
	 */
	public String modifyProduction(ProductionVO vo);
	/**
	 * 
	 * @return 异常积压订单参数列表
	 */
	public List<AbnormalParameterVO> queryAbnormalOrders(); 
	
	public void tryStartProcess(Production production,Timestamp time);
	
	public void tryStartOutsource(Production production,Timestamp time);
	
	public void tryPartReceive(Production production,Timestamp time);
	
	public void tryReceiveAll(Production production,Timestamp time);
	
	public void tryQC(Production production,Timestamp time);
	
	public void tryFinishQC(Production production,Timestamp time);
}
