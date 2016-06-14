package productManage.vo.warehouse;

import java.io.Serializable;

import productManage.model.lhj.Vendor;

/**
 * @author WHQ
 * @date 创建时间2016-4-10
 */
public class MaterialAndVendor implements  Serializable{
	private String materialCode;
	private String materialName;
	private String materialType;
	private Vendor vendor;
	private String colorCode;
	private String colorDescription;
		
	public MaterialAndVendor(String materialCode, String materialName,
			String materialType, Vendor vendor, String colorCode,
			String colorDescription) {
		super();
		this.materialCode = materialCode;
		this.materialName = materialName;
		this.materialType = materialType;
		this.vendor = vendor;
		this.colorCode = colorCode;
		this.colorDescription = colorDescription;
	}



	public MaterialAndVendor() {
	}

	public String getMaterialCode() {
		return materialCode;
	}
	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public String getMaterialType() {
		return materialType;
	}
	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}
	public Vendor getVendor() {
		return vendor;
	}
	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}
	public String getColorCode() {
		return colorCode;
	}
	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}
	public String getColorDescription() {
		return colorDescription;
	}
	public void setColorDescription(String colorDescription) {
		this.colorDescription = colorDescription;
	}
	
	
}
