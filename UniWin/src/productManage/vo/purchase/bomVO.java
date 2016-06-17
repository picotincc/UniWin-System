package productManage.vo.purchase;
/**  
* 类说明   
*  
* @author tyc  
* @date 2016年4月7日 新建 
*/
public class bomVO {
	
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
	private float volPerDesign;     //单件用量
	private String materialPosition;  //部位
	private float remainVol;        //库存用量
    private float frozenVol;        //冻结用量
    private float totalVol;         //总用量
    private String vendor;         //供应商
	private int vendorId;       //供应商编号
	
	private float purchaseVol;  //采购数量
	private float available;    //可用库存
	public bomVO(){
		
	}
	
	




	public bomVO(String materialCode, String materialName, String materialType, String colorCode,
			String colorDescription, String materialIngredient, float unitPrice, String unit, float width,
			float outputVol, float volPerDesign, String materialPosition, float remainVol, float frozenVol,
			float totalVol, String vendor, int vendorId, float purchaseVol, float available) {
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
		this.volPerDesign = volPerDesign;
		this.materialPosition = materialPosition;
		this.remainVol = remainVol;
		this.frozenVol = frozenVol;
		this.totalVol = totalVol;
		this.vendor = vendor;
		this.vendorId = vendorId;
		this.purchaseVol = purchaseVol;
		this.available = available;
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
	public String getMaterialIngredient() {
		return materialIngredient;
	}
	public void setMaterialIngredient(String materialIngredient) {
		this.materialIngredient = materialIngredient;
	}
	public float getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(float unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public float getWidth() {
		return width;
	}
	public void setWidth(float width) {
		this.width = width;
	}
	public float getOutputVol() {
		return outputVol;
	}
	public void setOutputVol(float outputVol) {
		this.outputVol = outputVol;
	}
	public float getVolPerDesign() {
		return volPerDesign;
	}
	public void setVolPerDesign(float volPerDesign) {
		this.volPerDesign = volPerDesign;
	}
	public String getMaterialPosition() {
		return materialPosition;
	}
	public void setMaterialPosition(String materialPosition) {
		this.materialPosition = materialPosition;
	}

	public float getRemainVol() {
		return remainVol;
	}

	public void setRemainVol(float remainVol) {
		this.remainVol = remainVol;
	}

	public float getFrozenVol() {
		return frozenVol;
	}

	public void setFrozenVol(float frozenVol) {
		this.frozenVol = frozenVol;
	}
	public float getTotalVol() {
		return totalVol;
	}
	public void setTotalVol(float totalVol) {
		this.totalVol = totalVol;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public int getVendorId() {
		return vendorId;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

	public float getPurchaseVol() {
		return purchaseVol;
	}

	public void setPurchaseVol(float purchaseVol) {
		this.purchaseVol = purchaseVol;
	}






	public float getAvailable() {
		return available;
	}






	public void setAvailable(float available) {
		this.available = available;
	}

	
	

}
