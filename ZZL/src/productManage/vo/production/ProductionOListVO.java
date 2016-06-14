package productManage.vo.production;

import org.springframework.stereotype.Component;

@Component
public class ProductionOListVO {
	private String designPicUrl;
	private String productionCode;
	private String designNewOld;
	private String productionPriority;
	private String processType;
	private String designCode;
	private String designName;
	private String customerBrand;
	/**
	 * 用料核对
	 */
	private Boolean materialExamined = false;
	private Boolean warehouseExamined = false;
	private Boolean phoneOrdered = false;
	private Boolean faxed = false;
	private Boolean financeChecked = false;
	/**
	 * 物料核对
	 */
	private Boolean materialChecked = false;
	private Boolean materialInWarehouse = false;
	/**
	 * 款式工艺单
	 */
	private String techniqueCode;
	/**
	 * 生产单进度
	 */
	private String productionProgress;
	/**
	 * 辅料（采购）状况
	 */
	private String accessoryState;
	/**
	 * 排单状态
	 */
	private String productionState;
	private int productionID;
	private int outsourceID;

	public ProductionOListVO() {
	}

	public ProductionOListVO(String designPicUrl, String productionCode, String designNewOld, String productionPriority,
			String processType, String designCode, String designName, String customerBrand, String productionProgress,
			String accessoryState, String productionState, int productionID, String techniqueCode,
			Boolean materialExamined, Boolean warehouseExamined, Boolean phoneOrdered, Boolean faxed,
			Boolean financeChecked, Boolean materialChecked, Boolean materialInWarehouse,int outsourceID) {
		super();
		this.designPicUrl = designPicUrl;
		this.productionCode = productionCode;
		this.designNewOld = designNewOld;
		this.productionPriority = productionPriority;
		this.processType = processType;
		this.designCode = designCode;
		this.designName = designName;
		this.customerBrand = customerBrand;
		this.productionProgress = productionProgress;
		this.accessoryState = accessoryState;
		this.productionState = productionState;
		this.productionID = productionID;
		this.techniqueCode = techniqueCode;
		this.materialExamined = materialExamined;
		this.warehouseExamined = warehouseExamined;
		this.phoneOrdered = phoneOrdered;
		this.faxed = faxed;
		this.financeChecked = financeChecked;
		this.materialChecked = materialChecked;
		this.materialInWarehouse = materialInWarehouse;
		this.outsourceID=outsourceID;
	}

	public String getDesignPicUrl() {
		return designPicUrl;
	}

	public void setDesignPicUrl(String designPicUrl) {
		this.designPicUrl = designPicUrl;
	}

	public String getProductionCode() {
		return productionCode;
	}

	public void setProductionCode(String productionCode) {
		this.productionCode = productionCode;
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

	public String getProcessType() {
		return processType;
	}

	public void setProcessType(String processType) {
		this.processType = processType;
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

	public String getCustomerBrand() {
		return customerBrand;
	}

	public void setCustomerBrand(String customerBrand) {
		this.customerBrand = customerBrand;
	}

	public String getProductionProgress() {
		return productionProgress;
	}

	public void setProductionProgress(String productionProgress) {
		this.productionProgress = productionProgress;
	}

	public String getAccessoryState() {
		return accessoryState;
	}

	public void setAccessoryState(String accessoryState) {
		this.accessoryState = accessoryState;
	}

	public String getProductionState() {
		return productionState;
	}

	public void setProductionState(String productionState) {
		this.productionState = productionState;
	}

	public int getProductionID() {
		return productionID;
	}

	public void setProductionID(int productionID) {
		this.productionID = productionID;
	}

	public String getTechniqueCode() {
		return techniqueCode;
	}

	public void setTechniqueCode(String techniqueCode) {
		this.techniqueCode = techniqueCode;
	}

	public Boolean getMaterialExamined() {
		return materialExamined;
	}

	public void setMaterialExamined(Boolean materialExamined) {
		this.materialExamined = materialExamined;
	}

	public Boolean getWarehouseExamined() {
		return warehouseExamined;
	}

	public void setWarehouseExamined(Boolean warehouseExamined) {
		this.warehouseExamined = warehouseExamined;
	}

	public Boolean getPhoneOrdered() {
		return phoneOrdered;
	}

	public void setPhoneOrdered(Boolean phoneOrdered) {
		this.phoneOrdered = phoneOrdered;
	}

	public Boolean getFaxed() {
		return faxed;
	}

	public void setFaxed(Boolean faxed) {
		this.faxed = faxed;
	}

	public Boolean getFinanceChecked() {
		return financeChecked;
	}

	public void setFinanceChecked(Boolean financeChecked) {
		this.financeChecked = financeChecked;
	}

	public Boolean getMaterialChecked() {
		return materialChecked;
	}

	public void setMaterialChecked(Boolean materialChecked) {
		this.materialChecked = materialChecked;
	}

	public Boolean getMaterialInWarehouse() {
		return materialInWarehouse;
	}

	public void setMaterialInWarehouse(Boolean materialInWarehouse) {
		this.materialInWarehouse = materialInWarehouse;
	}

	public int getOutsourceID() {
		return outsourceID;
	}

	public void setOutsourceID(int outsourceID) {
		this.outsourceID = outsourceID;
	}
	
}
