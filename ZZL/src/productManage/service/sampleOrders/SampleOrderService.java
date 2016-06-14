package productManage.service.sampleOrders;

import java.util.Map;

import productManage.model.yk.SampleOrders;
import productManage.vo.PageBean;

public interface SampleOrderService {
	/*
	 * 样衣单服务库
	 */
	public SampleOrders getSampleOrderByID(int sampleOrderID);
	public SampleOrders getSampleOrderByCode(String sampleOrderCode);
	public PageBean getAllSampleOrdersByPage(int pageSize,int page);
	public PageBean searchSampleOrdersByPage(int pageSize,int page,Map<String, Object> params);
}
