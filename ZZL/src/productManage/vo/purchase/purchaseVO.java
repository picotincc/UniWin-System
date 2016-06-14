package productManage.vo.purchase;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;
import productManage.model.lhj.Vendor;
import productManage.vo.production.OrderDetailVO;
import productManage.model.cs.OutSourceDetail;
import productManage.model.lhj.Material;

/**  
* 类说明   
*  
* @author tyc  
* @date 2016年4月2日 新建 
*/
@Component
public class purchaseVO {
	
	private String designNewOld;
	private String purchaseCode;
	private String designCode;
	private String customerName;
	private String purDocumentDate;
	private String designName;
	private String vendors; 
	private String userName;
	private String purchaseComment;
	private String picURL;
	private List<bomVO> materials;
	private List<OrderDetailVO> orderDetails; 
	private String scheduledPurchaseDate;
	private String purchaseState;
	private String orderPriority;
	private int purchaseID;
	private bomVO bom1;
	private String orderCode;
	private String eta;
	private String faxTime;
	private String financeCheckTime;
	public purchaseVO(){
		
	}
	
	

	public purchaseVO(String designNewOld, String purchaseCode, String designCode, String customerName,
			String purDocumentDate, String designName, String vendors, String userName, String purchaseComment,
			String picURL, List<bomVO> materials, List<OrderDetailVO> orderDetails, String scheduledPurchaseDate,
			String purchaseState, String orderPriority, int purchaseID, bomVO bom1, String orderCode, String eta,
			String faxTime, String financeCheckTime) {
		super();
		this.designNewOld = designNewOld;
		this.purchaseCode = purchaseCode;
		this.designCode = designCode;
		this.customerName = customerName;
		this.purDocumentDate = purDocumentDate;
		this.designName = designName;
		this.vendors = vendors;
		this.userName = userName;
		this.purchaseComment = purchaseComment;
		this.picURL = picURL;
		this.materials = materials;
		this.orderDetails = orderDetails;
		this.scheduledPurchaseDate = scheduledPurchaseDate;
		this.purchaseState = purchaseState;
		this.orderPriority = orderPriority;
		this.purchaseID = purchaseID;
		this.bom1 = bom1;
		this.orderCode = orderCode;
		this.eta = eta;
		this.faxTime = faxTime;
		this.financeCheckTime = financeCheckTime;
	}



	public String getDesignNewOld() {
		return designNewOld;
	}
	public void setDesignNewOld(String designNewOld) {
		this.designNewOld = designNewOld;
	}
	public String getPurchaseCode() {
		return purchaseCode;
	}
	public void setPurchaseCode(String purchaseCode) {
		this.purchaseCode = purchaseCode;
	}
	public String getDesignCode() {
		return designCode;
	}
	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getPurDocumentDate() {
		return purDocumentDate;
	}
	public void setPurDocumentDate(String purDocumentDate) {
		this.purDocumentDate = purDocumentDate;
	}
	public String getDesignName() {
		return designName;
	}
	public void setDesignName(String designName) {
		this.designName = designName;
	}
	public String getVendors() {
		return vendors;
	}
	public void setVendors(String vendors) {
		this.vendors = vendors;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPurchaseComment() {
		return purchaseComment;
	}
	public void setPurchaseComment(String purchaseComment) {
		this.purchaseComment = purchaseComment;
	}
	public String getPicURL() {
		return picURL;
	}
	public void setPicURL(String picURL) {
		this.picURL = picURL;
	}
	public List<bomVO> getMaterials() {
		return materials;
	}
	public void setMaterials(List<bomVO> materials) {
		this.materials = materials;
	}
	
	public List<OrderDetailVO> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(List<OrderDetailVO> orderDetails) {
		this.orderDetails = orderDetails;
	}
	public String getScheduledPurchaseDate() {
		return scheduledPurchaseDate;
	}
	public void setScheduledPurchaseDate(String scheduledPurchaseDate) {
		this.scheduledPurchaseDate = scheduledPurchaseDate;
	}

	public String getPurchaseState() {
		return purchaseState;
	}

	public void setPurchaseState(String purchaseState) {
		this.purchaseState = purchaseState;
	}

	public String getOrderPriority() {
		return orderPriority;
	}

	public void setOrderPriority(String orderPriority) {
		this.orderPriority = orderPriority;
	}

	public int getPurchaseID() {
		return purchaseID;
	}


	public void setPurchaseID(int purchaseID) {
		this.purchaseID = purchaseID;
	}

	public bomVO getBom1() {
		return bom1;
	}

	public void setBom1(bomVO bom1) {
		this.bom1 = bom1;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getEta() {
		return eta;
	}

	public void setEta(String eta) {
		this.eta = eta;
	}



	public String getFaxTime() {
		return faxTime;
	}



	public void setFaxTime(String faxTime) {
		this.faxTime = faxTime;
	}



	public String getFinanceCheckTime() {
		return financeCheckTime;
	}



	public void setFinanceCheckTime(String financeCheckTime) {
		this.financeCheckTime = financeCheckTime;
	}
	

	
}
