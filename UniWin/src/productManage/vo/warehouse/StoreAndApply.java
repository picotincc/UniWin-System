package productManage.vo.warehouse;

import java.io.Serializable;

public class StoreAndApply implements Serializable{
	private String materialApplyCode;
	private String materialCode;
	private String materialName;
	private String location;
	private float remainVol;//该物料在该仓库下的余量
	private float remain;//该仓库的剩余空间
	private float materialApplyVol;//该物料的申请数量
	private float actualOutVol;//该预定单号、仓库、物料下的实际出仓总数
	private int warehouseId;
	
	public StoreAndApply(String materialApplyCode, String materialCode,
			String materialName, String location, float remainVol,
			float remain, float materialApplyVol, float actualOutVol,int warehouseId) {
		super();
		this.materialApplyCode = materialApplyCode;
		this.materialCode = materialCode;
		this.materialName = materialName;
		this.location = location;
		this.remainVol = remainVol;
		this.remain = remain;
		this.materialApplyVol = materialApplyVol;
		this.actualOutVol = actualOutVol;
		this.warehouseId = warehouseId;
	}
	public StoreAndApply(){
		
	}
	public String getMaterialApplyCode() {
		return materialApplyCode;
	}
	public void setMaterialApplyCode(String materialApplyCode) {
		this.materialApplyCode = materialApplyCode;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public float getRemainVol() {
		return remainVol;
	}
	public void setRemainVol(float remainVol) {
		this.remainVol = remainVol;
	}
	public float getRemain() {
		return remain;
	}
	public void setRemain(float remain) {
		this.remain = remain;
	}
	public float getMaterialApplyVol() {
		return materialApplyVol;
	}
	public void setMaterialApplyVol(float materialApplyVol) {
		this.materialApplyVol = materialApplyVol;
	}
	public float getActualOutVol() {
		return actualOutVol;
	}
	public void setActualOutVol(float actualOutVol) {
		this.actualOutVol = actualOutVol;
	}
	public int getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(int warehouseId) {
		this.warehouseId = warehouseId;
	}
	
}
