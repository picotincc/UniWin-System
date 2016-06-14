package productManage.vo.supplement;

public class SupplementMaterialVO {

	private String materialCode;
	private String materialName;
	private String materialIngredient;
	private String shellAccessoryType;
	private String colorDescription;
	private String vendorName;
	private int supplyId;
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
	public String getMaterialIngredient() {
		return materialIngredient;
	}
	public void setMaterialIngredient(String materialIngredient) {
		this.materialIngredient = materialIngredient;
	}
	public String getShellAccessoryType() {
		return shellAccessoryType;
	}
	public void setShellAccessoryType(String shellAccessoryType) {
		this.shellAccessoryType = shellAccessoryType;
	}
	public String getColorDescription() {
		return colorDescription;
	}
	public void setColorDescription(String colorDescription) {
		this.colorDescription = colorDescription;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public int getSupplyId() {
		return supplyId;
	}
	public void setSupplyId(int supplyId) {
		this.supplyId = supplyId;
	}
}
