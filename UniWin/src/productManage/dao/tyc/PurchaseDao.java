package productManage.dao.tyc;

import java.sql.Date;
import java.util.List;

import productManage.model.szl.Supplement;
import productManage.model.tyc.Purchase;

/**  
* 类说明   
*  
* @author tyc  
* @date 2016年3月2日 新建 
*/

public interface PurchaseDao {
	
	public List<Purchase> allPurchase(String type);//返回所有采购单
	
	public Purchase purchaseDetail(int purchaseID);
	
	public List<Purchase> selectPurchase(Date Eta,Date scheduledPurchaseDate,int vendorId,String purchaseState,int styleId,int oldOrNew);//搜索采购单

	public void updatePurchaseState(int purchaseID,String state);//更新采购状态
	
	public Purchase usingMaterialAudit(int purchaseId);//用料审核
	
	public Purchase stockAudit(int purchaseId);//库存审核
	
	public Purchase getPurchaseByPurchaseCode(String purchaseCode);//whq添加 根据purchasecode获取purchase
	
	public void update(Purchase purchase);//更新采购单状态信息
	
	public void delete(Purchase purchase);
}
