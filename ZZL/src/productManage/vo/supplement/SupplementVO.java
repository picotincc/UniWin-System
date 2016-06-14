package productManage.vo.supplement;

import java.util.Date;
import java.util.List;

public class SupplementVO {
	private String supplementCode;
	private String designCode;
	private String designName;
	private Date supplementDate;
	private String userName;
	private List<String> vendorName;
	private List<String> vendorPhoneNum;
	private String supplementState;
	public String getSupplementCode(){
		return supplementCode;
	}
	public void setSupplementCode(String supplementCode){
		this.supplementCode=supplementCode;
	}
	public String getDesignCode(){
		return designCode;
	}
	public void setDesignCode(String designCode){
		this.designCode=designCode;
	}
	public String getDesignName() {
		return designName;
	}
	public void setDesignName(String designName) {
		this.designName = designName;
	}
	public Date getSupplementDate() {
		return supplementDate;
	}
	public void setSupplementDate(Date supplementDate) {
		this.supplementDate = supplementDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSupplementState() {
		return supplementState;
	}
	public void setSupplementState(String supplementState) {
		this.supplementState = supplementState;
	}
	public List<String> getVendorName() {
		return vendorName;
	}
	public void setVendorName(List<String> vendorName) {
		this.vendorName = vendorName;
	}
	public List<String> getVendorPhoneNum() {
		return vendorPhoneNum;
	}
	public void setVendorPhoneNum(List<String> vendorPhoneNum) {
		this.vendorPhoneNum = vendorPhoneNum;
	}
}
