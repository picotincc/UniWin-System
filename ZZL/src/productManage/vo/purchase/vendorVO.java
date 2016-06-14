package productManage.vo.purchase;
/**  
* 类说明   
*  
* @author tyc  
* @date 2016年4月6日 新建 
*/
public class vendorVO {
	private String vendorName;
	private String vendorPhone;
	public vendorVO(){
		
	}
	public vendorVO(String vendorName, String vendorPhone) {
		super();
		this.vendorName = vendorName;
		this.vendorPhone = vendorPhone;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getVendorPhone() {
		return vendorPhone;
	}
	public void setVendorPhone(String vendorPhone) {
		this.vendorPhone = vendorPhone;
	}

}
