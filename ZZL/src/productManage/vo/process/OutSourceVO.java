package productManage.vo.process;

import java.util.Date;
import java.util.List;

import productManage.model.cs.OutSourceDetail;

public class OutSourceVO {
	
	private int outsourceID;
	private String osCode;
	private String productionID;
	private int sum;
	private String osPriority;
	private String designCode;
	private String designImg;
    private String designName;
    private Date osDate;
	private Date finishDate;
	private Date osScheduleDate;
	private String processorCode;
	private String processorName;
	private String processorMobile;
	private String osState;
	private float labourCost;
	private Date actualOutDate;
	private String UserName;
	private List<OutSourceDetail> details;
	
	
	
	public int getOutsourceID() {
		return outsourceID;
	}
	public void setOutsourceID(int outsourceID) {
		this.outsourceID = outsourceID;
	}
	public Date getOsScheduleDate() {
		return osScheduleDate;
	}
	public void setOsScheduleDate(Date osScheduleDate) {
		this.osScheduleDate = osScheduleDate;
	}
	public float getLabourCost() {
		return labourCost;
	}
	public void setLabourCost(float labourCost) {
		this.labourCost = labourCost;
	}
	public Date getActualOutDate() {
		return actualOutDate;
	}
	public void setActualOutDate(Date actualOutDate) {
		this.actualOutDate = actualOutDate;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getProductionID() {
		return productionID;
	}
	public void setProductionID(String productionID) {
		this.productionID = productionID;
	}
	public String getOsCode() {
		return osCode;
	}
	public void setOsCode(String osCode) {
		this.osCode = osCode;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getOsPriority() {
		return osPriority;
	}
	public void setOsPriority(String osPriority) {
		this.osPriority = osPriority;
	}
	public String getDesignCode() {
		return designCode;
	}
	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}
	public String getDesignImg() {
		return designImg;
	}
	public void setDesignImg(String designImg) {
		this.designImg = designImg;
	}
	public String getDesignName() {
		return designName;
	}
	public void setDesignName(String designName) {
		this.designName = designName;
	}
	public Date getOsDate() {
		return osDate;
	}
	public void setOsDate(Date osDate) {
		this.osDate = osDate;
	}
	public Date getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	public String getProcessorCode() {
		return processorCode;
	}
	public void setProcessorCode(String processorCode) {
		this.processorCode = processorCode;
	}
	public String getProcessorMobile() {
		return processorMobile;
	}
	public void setProcessorMobile(String processorMobile) {
		this.processorMobile = processorMobile;
	}
	public String getOsState() {
		return osState;
	}
	public void setOsState(String osState) {
		this.osState = osState;
	}
	public List<OutSourceDetail> getDetails() {
		return details;
	}
	public void setDetails(List<OutSourceDetail> details) {
		this.details = details;
	}
	public String getProcessorName() {
		return processorName;
	}
	public void setProcessorName(String processorName) {
		this.processorName = processorName;
	}
	
	
}
