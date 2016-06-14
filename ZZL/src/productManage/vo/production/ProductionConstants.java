package productManage.vo.production;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ProductionConstants {
	/**
	 * 生产单进度
	 */
	public static String[] PRODUCTION_PROGRESS={"采购中","裁剪/工艺阶段","外发加工中","部分收货","完整收货","质检中","质检完成"};
	/**
	 * 排单状态
	 */
	public static String[] PRODUCTION_STATE={"未排单","已排单"};
	public static String[] PRODUCTION_PRIORITY={"第一时间","普通"};
	/**
	 * 辅料采购状况
	 */
	public static String[] ACCESSORY_STATE={"无需采购辅料","已完成部分采购","已完成辅料采购"};
	public static String[] PURCHASE_TYPE={"shell","accessory"};
	public static String[] DESIGN_NEW_OLD={"新款","老款"};
	/**
	 * 搜索生产单时的参数名列表
	 */
	public static String[] SEARCH_PRODUCTION_PARAMS={"DesignCode","CustomerName","CustomerRepresentative","ProductionPriority","OrderDate","ProductionState","DesignNewOrOld","AccessoryState"};
	/**
	 * 与参数名列表一一对应的model中的属性名
	 */
	public static String[] SEARCH_PRODUCTION_PARAM_NAMES={"design.designCode","customer.customerBrandName","customer.customerContactName","orders.orderPriority","orders.orderDate","production.productionState","orders.orderDesignIsNew","purchase.purchaseType = '"+PURCHASE_TYPE[1]+"' and purchase.purchaseState"};
	public static String[] PROCESS_TYPES={"春夏款","秋冬款","毛衣款"};
	public static String[] ABNORMAL_STATES={"计划采购——电话订购","电话订购——传码单","传码单——财务付款","财务付款——核对面料","面料齐备——裁剪/工艺","裁剪/工艺——外发"};
	public static String[] PURCHASE_STATES={"待审核","待库存审核","待电话订购","待传码单","待财务对账","待核对面料","采购完成（自有）","审核不通过","面料齐备"};
	/**
	 * 生成生产单码
	 * @return 生产单码
	 */
	public static String getProductionCode(){
		SimpleDateFormat fmt=new SimpleDateFormat("mmss_yyyyMMdd");
		return "SCD"+fmt.format(new Date());
	}
	
}
