package productManage.vo.supplement;

import java.util.Date;
import java.util.List;
import java.util.Map;

import productManage.model.szl.SupplementMaterial;
import productManage.model.wjx.Store;

public class SupplementDetailVO {

	private String supplementType;
	private String productionCode;
	private String supplementCode;
	private String materialType;
	private Date supplementDate;
	private String userName;
	private String supplementComment;
	private List<SupplementMaterial> smList;
	private Map<SupplementMaterial,List<Store>> storeMap;
	public String getSupplementType() {
		return supplementType;
	}
	public void setSupplementType(String supplementType) {
		this.supplementType = supplementType;
	}
	public String getProductionCode() {
		return productionCode;
	}
	public void setProductionCode(String productionCode) {
		this.productionCode = productionCode;
	}
	public String getSupplementCode() {
		return supplementCode;
	}
	public void setSupplementCode(String supplementCode) {
		this.supplementCode = supplementCode;
	}
	public String getMaterialType() {
		return materialType;
	}
	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSupplementComment() {
		return supplementComment;
	}
	public void setSupplementComment(String supplementComment) {
		this.supplementComment = supplementComment;
	}
	public List<SupplementMaterial> getSmList() {
		return smList;
	}
	public void setSmList(List<SupplementMaterial> smList) {
		this.smList = smList;
	}
	public Date getSupplementDate() {
		return supplementDate;
	}
	public void setSupplementDate(Date supplementDate) {
		this.supplementDate = supplementDate;
	}
	public Map<SupplementMaterial,List<Store>> getStoreMap() {
		return storeMap;
	}
	public void setStoreMap(Map<SupplementMaterial,List<Store>> storeMap) {
		this.storeMap = storeMap;
	}

}
