package productManage.vo.orders;

public class OrdersConstants {
	/**
	 * 搜索客户订单列表时的参数列表
	 */
	public static String[] SEARCH_ORDERS_PARAMS={"orderCode","customerName","inquiryProgress","sampleOrderProgress","productionProgress","chargeName"};
	/**
	 * 订单来源
	 */
	public static String[] ORDER_SOURCES={"旗舰店","速卖通","外贸店","专营店","阿里巴巴","国外平台","雅酷衣衣","好衣汇","hodoyi","其他客户"};
	/**
	 * 订单类型
	 */
	public static String[] ORDER_TYPES={"翻单","新款"};
}
