package productManage.vo.production;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ProductionVO {
	private String designNewOld;//注意判断：数据库中格式为int
	private String productionPriority;
	private String orderSource;
	private String orderMaker;
	private String designCode;
	private String orderDate;
	private String orderContractNum;
	private String processType;
	private String customerName;
	private String customerRepresentative;
	/**
	 * 联系方式：电话和email
	 */
	private String contact;
	private String designName;
	private String orderType;
	private List<OrderDetailVO> orderDetails;
	private String specialTechnique;
	private String sampleYardage;
	private String shellIngredient;
	
	private String comment;
	
	private String picUrl;
	
	private String productionCode;
	
	public ProductionVO(){}

	

	public ProductionVO(String productionCode,String designNewOld, String productionPriority, String orderSource, String orderMaker,
			String designCode, String orderDate, String orderContractNum, String processType, String customerName,
			String customerRepresentative, String contact, String designName, String orderType,
			List<OrderDetailVO> orderDetails, String specialTechnique, String sampleYardage, String shellIngredient,
			String comment, String picUrl) {
		super();
		this.productionCode=productionCode;
		this.designNewOld = designNewOld;
		this.productionPriority = productionPriority;
		this.orderSource = orderSource;
		this.orderMaker = orderMaker;
		this.designCode = designCode;
		this.orderDate = orderDate;
		this.orderContractNum = orderContractNum;
		this.processType = processType;
		this.customerName = customerName;
		this.customerRepresentative = customerRepresentative;
		this.contact = contact;
		this.designName = designName;
		this.orderType = orderType;
		this.orderDetails = orderDetails;
		this.specialTechnique = specialTechnique;
		this.sampleYardage = sampleYardage;
		this.shellIngredient = shellIngredient;
		this.comment = comment;
		this.picUrl = picUrl;
	}



	public String getDesignNewOld() {
		return designNewOld;
	}

	public void setDesignNewOld(String designNewOld) {
		this.designNewOld = designNewOld;
	}

	public String getProductionPriority() {
		return productionPriority;
	}

	public void setProductionPriority(String productionPriority) {
		this.productionPriority = productionPriority;
	}

	public String getOrderSource() {
		return orderSource;
	}

	public void setOrderSource(String orderSource) {
		this.orderSource = orderSource;
	}

	public String getOrderMaker() {
		return orderMaker;
	}

	public void setOrderMaker(String orderMaker) {
		this.orderMaker = orderMaker;
	}

	public String getDesignCode() {
		return designCode;
	}

	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderContractNum() {
		return orderContractNum;
	}

	public void setOrderContractNum(String orderContractNum) {
		this.orderContractNum = orderContractNum;
	}

	public String getProcessType() {
		return processType;
	}

	public void setProcessType(String processType) {
		this.processType = processType;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerRepresentative() {
		return customerRepresentative;
	}

	public void setCustomerRepresentative(String customerRepresentative) {
		this.customerRepresentative = customerRepresentative;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getDesignName() {
		return designName;
	}

	public void setDesignName(String designName) {
		this.designName = designName;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public List<OrderDetailVO> getOrderDetails() {
		return orderDetails;
	}

	public String getSpecialTechnique() {
		return specialTechnique;
	}

	public void setSpecialTechnique(String specialTechnique) {
		this.specialTechnique = specialTechnique;
	}

	public String getSampleYardage() {
		return sampleYardage;
	}

	public void setSampleYardage(String sampleYardage) {
		this.sampleYardage = sampleYardage;
	}

	public String getShellIngredient() {
		return shellIngredient;
	}

	public void setShellIngredient(String shellIngredient) {
		this.shellIngredient = shellIngredient;
	}


	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public void setOrderDetails(List<OrderDetailVO> orderDetails) {
		this.orderDetails = orderDetails;
	}



	public String getProductionCode() {
		return productionCode;
	}



	public void setProductionCode(String productionCode) {
		this.productionCode = productionCode;
	}
	
}
