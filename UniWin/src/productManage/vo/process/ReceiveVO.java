package productManage.vo.process;

import java.util.Date;
import java.util.List;

import productManage.model.cs.ReceiveDetail;

public class ReceiveVO {
	
	private int receiveID;
	private String processorCode;
	private String processorName;
	private String processorMobile;
	private String processorDistrict;
	private String deliveryType;
	private String outsourceCode;
	private Date receiveDate;
	private String userName;
	private int sum;
	private String designImgUrl;
	
	
	private List<ReceiveDetail> details;

	
	
	public String getProcessorMobile() {
		return processorMobile;
	}

	public void setProcessorMobile(String processorMobile) {
		this.processorMobile = processorMobile;
	}

	public int getReceiveID() {
		return receiveID;
	}

	public void setReceiveID(int receiveID) {
		this.receiveID = receiveID;
	}

	public String getProcessorCode() {
		return processorCode;
	}

	public void setProcessorCode(String processorCode) {
		this.processorCode = processorCode;
	}

	public String getProcessorName() {
		return processorName;
	}

	public void setProcessorName(String processorName) {
		this.processorName = processorName;
	}

	public String getProcessorDistrict() {
		return processorDistrict;
	}

	public void setProcessorDistrict(String processorDistrict) {
		this.processorDistrict = processorDistrict;
	}

	public String getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}

	public String getOutsourceCode() {
		return outsourceCode;
	}

	public void setOutsourceCode(String outsourceCode) {
		this.outsourceCode = outsourceCode;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public String getDesignImgUrl() {
		return designImgUrl;
	}

	public void setDesignImgUrl(String designImgUrl) {
		this.designImgUrl = designImgUrl;
	}

	public List<ReceiveDetail> getDetails() {
		return details;
	}

	public void setDetails(List<ReceiveDetail> details) {
		this.details = details;
	}
	
	
	

}
