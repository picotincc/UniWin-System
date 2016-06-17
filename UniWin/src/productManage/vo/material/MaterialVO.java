package productManage.vo.material;

import java.sql.Date;

public class MaterialVO {

	private String materialCode;      //物料编号
    private String materialName;    //物料名称
    private String materialType;        //物料类型
    private String colorCode;           //色号
    private String colorDescription;    //颜色说明
    private String materialIngredient;      //物料成分
    private float unitPrice;        //单价
    private String unit;        //单位
    private float width;        //门幅
    private float outputVol;        //出量
    
    public MaterialVO(){}
    
    public MaterialVO(String materialCode, String materialName,
            String materialType, String colorCode, String colorDescription,
            String materialIngredient, float unitPrice, String unit,
            float width, float outputVol) {
        super();
        this.materialCode = materialCode;
        this.materialName = materialName;
        this.materialType = materialType;
        this.colorCode = colorCode;
        this.colorDescription = colorDescription;
        this.materialIngredient = materialIngredient;
        this.unitPrice = unitPrice;
        this.unit = unit;
        this.width = width;
        this.outputVol = outputVol;
    }
    
	public String getMaterialCode() {
		return materialCode;
	}

	public String getMaterialName() {
		return materialName;
	}

	public String getMaterialType() {
		return materialType;
	}

	public String getColorCode() {
		return colorCode;
	}

	public String getColorDescription() {
		return colorDescription;
	}

	public String getMaterialIngredient() {
		return materialIngredient;
	}

	public float getUnitPrice() {
		return unitPrice;
	}

	public String getUnit() {
		return unit;
	}

	public float getWidth() {
		return width;
	}

	public float getOutputVol() {
		return outputVol;
	}

	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}

	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}

	public void setColorDescription(String colorDescription) {
		this.colorDescription = colorDescription;
	}

	public void setMaterialIngredient(String materialIngredient) {
		this.materialIngredient = materialIngredient;
	}

	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public void setWidth(float width) {
		this.width = width;
	}

	public void setOutputVol(float outputVol) {
		this.outputVol = outputVol;
	}
}
