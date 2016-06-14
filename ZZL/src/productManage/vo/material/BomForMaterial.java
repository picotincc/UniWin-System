package productManage.vo.material;

public class BomForMaterial {

	String materialPosition;
	
	String materialCode;
	
	String materialName;
	
	float unitPrice;
	
	String materialType;
	
	String colorCode;
	
	float volPerDesign;
	
	public BomForMaterial(){}
	
	public BomForMaterial(String materialPosition,String materialCode,String materialName,float unitPrice,String materialType,String colorCode,float volPerDesign){
		this.materialPosition = materialPosition;
		this.materialCode = materialCode;
		this.materialName = materialName;
		this.unitPrice = unitPrice;
		this.materialType = materialType;
		this.colorCode = colorCode;
		this.volPerDesign = volPerDesign;
	}
	
	
	public String getMaterialPosition() {
		return materialPosition;
	}

	public String getMaterialCode() {
		return materialCode;
	}

	public String getMaterialName() {
		return materialName;
	}

	public float getUnitPrice() {
		return unitPrice;
	}

	public String getMaterialType() {
		return materialType;
	}

	public String getColorCode() {
		return colorCode;
	}

	public float getVolPerDesign() {
		return volPerDesign;
	}

	public void setMaterialPosition(String materialPosition) {
		this.materialPosition = materialPosition;
	}

	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}

	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}

	public void setVolPerDesign(float volPerDesign) {
		this.volPerDesign = volPerDesign;
	}
}
