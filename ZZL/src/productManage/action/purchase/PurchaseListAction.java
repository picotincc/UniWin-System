package productManage.action.purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.BaseAction;
import productManage.action.PageAction;
import productManage.model.szl.Supplement;
import productManage.model.tyc.Purchase;
import productManage.model.wcy.Qc;
import productManage.service.purchase.PurchaseService;
import productManage.service.qc.QcService;
import productManage.vo.PageBean;
import productManage.vo.production.OrderDetailVO;
import productManage.vo.purchase.*;
/**  
* 类说明   
*  
* @author tyc  
* @date 2016年3月16日 新建 
*/

@Controller
public class PurchaseListAction extends PageAction{
	
	@Autowired
	private PurchaseService purchaseService;
	private int purchaseID;
	private purchaseVO purchaseVO;
	private OrderDetailVO orderDetailVO;
	
	public OrderDetailVO getOrderDetailVO() {
		return orderDetailVO;
	}
	public void setOrderDetailVO(OrderDetailVO orderDetailVO) {
		this.orderDetailVO = orderDetailVO;
	}
	public purchaseVO getPurchaseVO() {
		return purchaseVO;
	}
	public void setPurchaseVO(purchaseVO purchaseVO) {
		this.purchaseVO = purchaseVO;
	}


	public int getPurchaseID() {
		return purchaseID;
	}
	public void setPurchaseID(int purchaseID) {
		this.purchaseID = purchaseID;
	}

	List<purchaseVO>  purchaseList = new ArrayList<purchaseVO>();
	
	Purchase purchase = new Purchase();
	
	public Purchase getPurchase() {
		return purchase;
	}
	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}
	
	public List<purchaseVO> getPurchaseList() {
		return purchaseList;
	}
	public void setPurchaseList(List<purchaseVO> purchaseList) {
		this.purchaseList = purchaseList;
	}
	public PurchaseService getPurchaseService() {
		return purchaseService;
	}
	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}
	
	//显示面料采购单
	public String showPurchaseList() {
		try{
			this.pageBean = purchaseService.allShellPurchase(this.rowsPerPage,this.page);
		}catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return "error";
		}
		return SUCCESS;
	}
	
	public String showAccessoryPurchaseList() {
		try{
			this.pageBean = purchaseService.allAccessoryPurchase(this.rowsPerPage,this.page);
		}catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return "error";
		}
		return SUCCESS;
	}
	
	
	public String purchaseDetail(){
        ServletContext sc = request.getServletContext();
		
	    purchaseVO = purchaseService.purchaseDetail(purchaseID,"面料");
		
		
		return SUCCESS;
	}
	
	public String changeState(){
		String Code = request.getParameter("changeCode");
		String State = request.getParameter("changeState");
		//System.out.println(State);
		Purchase purchase = purchaseService.changeState(Code, State,1);
		return "success";
		
		
	}
	public String changeAccessoryState(){
		String Code = request.getParameter("changeCode");
		String State = request.getParameter("changeState");
		//System.out.println(State);
		Purchase purchase = purchaseService.changeState(Code, State,0);
		return "success";
		
		
	}
	
	public String cancelPurchase(){
		String code = request.getParameter("cancelCode");
		boolean res = purchaseService.cancelPurchase(code);
		if(res){
			return "success";
		}
			
		return "error";
	}
	
	private String designCode;
	private String vendor;
	private String purchaseState;
	private String oldOrNew;
	private String scheduledPurchaseDate;
	private String eta;
	
	public String searchPurchaseList(){
		Map<String, Object> params = new HashMap<String, Object>();
		if(null != designCode && !"".equals(designCode)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[0], this.designCode);
		}
		if(null != vendor && !"".equals(vendor)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[1], this.vendor);
		}
		if(null != purchaseState && !"".equals(purchaseState)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[2], this.purchaseState);
		}
		if(null != oldOrNew && !"".equals(oldOrNew)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[3], this.oldOrNew);
		}
		if(null != scheduledPurchaseDate && !"".equals(scheduledPurchaseDate)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[4], this.scheduledPurchaseDate);
		}
		if(null != eta && !"".equals(eta)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[5], this.eta);
		}
		try {
			this.pageBean = purchaseService.queryPurchase(this.rowsPerPage, this.page, params);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean = new PageBean();
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	
	public String getDesignCode() {
		return designCode;
	}
	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	public String getPurchaseState() {
		return purchaseState;
	}
	public void setPurchaseState(String purchaseState) {
		this.purchaseState = purchaseState;
	}
	public String getOldOrNew() {
		return oldOrNew;
	}
	public void setOldOrNew(String oldOrNew) {
		this.oldOrNew = oldOrNew;
	}
	public String getScheduledPurchaseDate() {
		return scheduledPurchaseDate;
	}
	public void setScheduledPurchaseDate(String scheduledPurchaseDate) {
		this.scheduledPurchaseDate = scheduledPurchaseDate;
	}
	public String getEta() {
		return eta;
	}
	public void setEta(String eta) {
		this.eta = eta;
	}
	
	
	public String searchAccessoryPurchaseList(){
		Map<String, Object> params = new HashMap<String, Object>();
		if(null != designCode && !"".equals(designCode)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[0], this.designCode);
		}
		if(null != vendor && !"".equals(vendor)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[1], this.vendor);
		}
		if(null != purchaseState && !"".equals(purchaseState)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[2], this.purchaseState);
		}
		if(null != oldOrNew && !"".equals(oldOrNew)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[3], this.oldOrNew);
		}
		if(null != scheduledPurchaseDate && !"".equals(scheduledPurchaseDate)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[4], this.scheduledPurchaseDate);
		}
		if(null != eta && !"".equals(eta)){
			params.put(purchaseConstants.SEARCH_PURCHASE_PARAMS[5], this.eta);
		}
		try {
			this.pageBean = purchaseService.queryPurchase(this.rowsPerPage, this.page, params);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean = new PageBean();
			return ERROR;
		}
		return SUCCESS;
	}
	
}
