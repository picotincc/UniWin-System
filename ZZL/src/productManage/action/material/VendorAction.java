package productManage.action.material;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.PageAction;
import productManage.model.lhj.Vendor;
import productManage.service.material.VendorService;
import productManage.vo.PageBean;
import productManage.vo.material.MaterialConstants;
import productManage.vo.material.VendorConstants;

public class VendorAction extends PageAction{

	private static final long serialVersionUID = 1L;
	@Autowired
	private VendorService vendorservice;
	
	private String vendorName;
	
	public String addVendor(){
		Vendor vendor = new Vendor();
		vendor.setVendorId(Integer.parseInt(request.getParameter("new_Code")));
		vendor.setVendorName(request.getParameter("new_Name"));
		vendor.setVendorPhoneNum(request.getParameter("new_Tel"));
		vendor.setVendorMobileNum(request.getParameter("new_Mobile"));
		vendor.setVendorAddr(request.getParameter("new_Addr"));
		vendor.setVendorRank(request.getParameter("new_VendorLevel"));
		vendor.setVendorArea(request.getParameter("new_Area"));
		boolean tag = vendorservice.addVendor(vendor);
		if(!tag){
			return ERROR;		
		}
		return SUCCESS;
	}
	
	public String updateVendor(){
		Vendor vendor = new Vendor();
		vendor.setVendorId(Integer.parseInt(request.getParameter("update_Code")));
		vendor.setVendorName(request.getParameter("update_Name"));
		vendor.setVendorPhoneNum(request.getParameter("update_Tel"));
		vendor.setVendorMobileNum(request.getParameter("update_Mobile"));
		vendor.setVendorAddr(request.getParameter("update_Addr"));
		vendor.setVendorRank(request.getParameter("update_VendorLevel"));
		vendor.setVendorArea(request.getParameter("update_Area"));
		boolean tag = vendorservice.updateVendor(vendor);
		if(!tag){
			return ERROR;		
		}
		return SUCCESS;
	}

	//获取供应商详细信息，以便修改
	private String vendorDetialAjax="";
	
	public String getVendorDetialAjax() {
		return vendorDetialAjax;
	}

	public void setVendorDetialAjax(String vendorDetialAjax) {
		this.vendorDetialAjax = vendorDetialAjax;
	}

	public String getVendorById(){
		System.out.println("enter getVendorByID");
		String vendorId = request.getParameter("vendorId");
		Vendor vendor = vendorservice.getVendorById(vendorId);
		JSONObject result = new JSONObject();
		try {
			result.put("vendorId", vendor.getVendorId());
			result.put("vendorName", vendor.getVendorName());
			result.put("vendorPhoneNum", vendor.getVendorPhoneNum());
			result.put("vendorMobileNum", vendor.getVendorMobileNum());
			result.put("vendorAddr", vendor.getVendorAddr());
			result.put("vendorRank", vendor.getVendorRank());
			result.put("vendorArea", vendor.getVendorArea());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		setVendorDetialAjax(result.toString());
		System.out.println(result.toString());
		return SUCCESS;
	}
	
	public String showVendorList(){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put(VendorConstants.SEARCH_VENDOR_PARAMS[0], this.vendorName);
		try {
			this.pageBean = vendorservice.queryVendor(this.rowsPerPage, this.page, params);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

}
