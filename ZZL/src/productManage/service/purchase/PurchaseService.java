package productManage.service.purchase;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import productManage.model.tyc.Purchase;
import productManage.vo.PageBean;
import productManage.vo.purchase.purchaseVO;

/**  
* 类说明   
*  
* @author tyc  
* @date 2016年3月8日 新建 
*/
public interface PurchaseService {
	
    public PageBean allShellPurchase(int rowsPerPage, int page);//返回所有面料采购单
    
    public PageBean allAccessoryPurchase(int rowsPerPage, int page);//返回所有辅料采购单
    
    public purchaseVO purchaseDetail(int purchaseID,String type);//采购单详细信息
	
	public List<Purchase> selectPurchase(Date Eta,Date scheduledPurchaseDate,int vendorId,String purchaseState,int styleId,int oldOrNew);//搜索采购单

	public void updatePurchaseState(int purchaseID,String state);//更新采购状态
	
	public Purchase usingMaterialAudit(int purchaseId);//用料审核
	
	public Purchase stockAudit(int purchaseId);//库存审核
	
	public Purchase getPurchaseByCode(String purchaseCode);//whq添加 根据purchasecode获取purchase
	
	public Purchase changeState(String selectedCode, String selectedState,int type); //更改状态

	public boolean cancelPurchase(String code);
	
	public PageBean queryPurchase(int pageSize,int page,Map<String,Object> params);
}
