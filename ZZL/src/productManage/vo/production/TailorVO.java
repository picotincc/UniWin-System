package productManage.vo.production;

import org.springframework.stereotype.Component;

@Component
public class TailorVO {
	private int tailorID;
	private String designPicURL;
	private String productionCode;
	private int productionID;
	private String color;
	private String designCode;
	private String designName;
	private String customerName;
	private int orderVol;
	private int actualVol;
	private String progress;
	public TailorVO(){}
	/**
	 * 
	 * @param designPicURL 款式图片URL
	 * @param productionCode 生产单编码
	 * @param productionID 生产单ID
	 * @param color 颜色
	 * @param designCode 款式编码（款号）
	 * @param designName 款式名称
	 * @param customerName 客户名称
	 * @param orderVol 订单数量
	 * @param actualVol 裁剪数量
	 * @param progress 进度
	 */
	public TailorVO(int tailorID,String designPicURL, String productionCode, int productionID, String color, String designCode,
			String designName, String customerName, int orderVol, int actualVol, String progress) {
		super();
		this.tailorID=tailorID;
		this.designPicURL = designPicURL;
		this.productionCode = productionCode;
		this.productionID = productionID;
		this.color = color;
		this.designCode = designCode;
		this.designName = designName;
		this.customerName = customerName;
		this.orderVol = orderVol;
		this.actualVol = actualVol;
		this.progress = progress;
	}
	public String getDesignPicURL() {
		return designPicURL;
	}
	public void setDesignPicURL(String designPicURL) {
		this.designPicURL = designPicURL;
	}
	public String getProductionCode() {
		return productionCode;
	}
	public void setProductionCode(String productionCode) {
		this.productionCode = productionCode;
	}
	public int getProductionID() {
		return productionID;
	}
	public void setProductionID(int productionID) {
		this.productionID = productionID;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getDesignCode() {
		return designCode;
	}
	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}
	public String getDesignName() {
		return designName;
	}
	public void setDesignName(String designName) {
		this.designName = designName;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public int getOrderVol() {
		return orderVol;
	}
	public void setOrderVol(int orderNum) {
		this.orderVol = orderNum;
	}
	public int getActualVol() {
		return actualVol;
	}
	public void setActualVol(int actualNum) {
		this.actualVol = actualNum;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public int getTailorID() {
		return tailorID;
	}
	public void setTailorID(int tailorID) {
		this.tailorID = tailorID;
	}
	
	
}
