package productManage.action.material;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.PageAction;
import productManage.model.lhj.Material;
import productManage.model.lhj.Supply;
import productManage.model.lhj.Vendor;
import productManage.model.lhj.WareHouse;
import productManage.model.wjx.Store;
import productManage.service.material.MaterialService;
import productManage.service.material.VendorService;
import productManage.vo.PageBean;
import productManage.vo.material.ApplyConstants;
import productManage.vo.material.MaterialConstants;

public class MaterialAction extends PageAction{

	private static final long serialVersionUID = 1L;
	@Autowired
	private MaterialService materialservice;
	
	@Autowired
	private VendorService vendorservice;
	
	private String materialName;

	public String showAddMaterial(){
		if (request.getSession().getAttribute("account")!=null){
			return SUCCESS;
		}
		else{
			return "failed";
		}
	}
	
	public String addMaterial() throws ServletException, IOException{
		Material material = new Material();
		
		//信息设置
	    String materialCode = "A001";
	    String materialName = "A001";
	    String materialType = "A001";
	    String colorCode = "A001";
	    String colorDescription = "A001";
	    String materialIngredient = "A001";
	    float unitPrice = 100;
	    String unit = "A001";
	    float width = 10;
	    float outputVol = 10;
		Date modificationDate = new Date();
	    
	    materialCode = request.getParameter("materialCode");
	    materialName = request.getParameter("materialName");
	    materialType = request.getParameter("materialType");
	    colorCode = request.getParameter("colorCode");
	    colorDescription = request.getParameter("colorDescription");
	    materialIngredient = request.getParameter("materialIngredient");
	    unitPrice = Float.parseFloat(request.getParameter("unitPrice"));
	    unit = request.getParameter("unit");
	    width = Float.parseFloat(request.getParameter("width"));
	    outputVol = Float.parseFloat(request.getParameter("outputVol"));
	    modificationDate = new Date();
	    
	    material.setMaterialCode(materialCode);
	    material.setMaterialName(materialName);
	    material.setMaterialType(materialType);
	    material.setColorCode(colorCode);
	    material.setColorDescription(colorDescription);
	    material.setMaterialIngredient(materialIngredient);
	    material.setUnitPrice(unitPrice);
	    material.setUnit(unit);
	    material.setWidth(width);
	    material.setOutputVol(outputVol);
	    material.setModificationDate(new java.sql.Date(modificationDate.getTime()));
	    
		materialservice.addMaterial(material);
		//Supply=============================================
		String vendorName = request.getParameter("vendorName");
		
		Material materialGet = materialservice.getMaterialByCode(materialCode);
		Vendor vendor = vendorservice.getVendorByName(vendorName);
		Supply supply = new Supply(vendor,materialGet);
		materialservice.addSupply(supply);
		//Store==============================================
		String location = request.getParameter("warehouse");
		float remainVol = 0;
		float frozenVol = 0;
		
		WareHouse warehouse = materialservice.getWarehouseByLocation(location);
		Store store = new Store(warehouse,material,remainVol,frozenVol);
		materialservice.addStore(store);
		
		return SUCCESS;
	}
	
	public String showMaterialList(){
		String materialName = request.getParameter("materialName");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put(MaterialConstants.SEARCH_MATERIAL_PARAMS[0], materialName);
		try {
			this.pageBean = materialservice.queryMaterial(this.rowsPerPage, this.page, params);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	
	//供应商列表==========================================================
	private String vendorlistAjax;
	
	public String getVendorlistAjax() {
		return vendorlistAjax;
	}

	public void setVendorlistAjax(String vendorlistAjax) {
		this.vendorlistAjax = vendorlistAjax;
	}

	public String getVendorList(){
		List<Vendor> list = vendorservice.getVendorList();
		
		JSONArray json = new JSONArray();
		for(Vendor vendor:list){
			JSONObject jo = new JSONObject();
			try {
				jo.put("vendorID",vendor.getVendorId());
				jo.put("vendorName", vendor.getVendorName());
				jo.put("vendorAddr", vendor.getVendorAddr());
				json.put(jo);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		setVendorlistAjax(json.toString());
		System.out.println(json.toString());
		return SUCCESS;
	}
	
	//仓储列表==========================================================
	private String warehouselistAjax;
	
	public String getWarehouselistAjax() {
		return warehouselistAjax;
	}

	public void setWarehouselistAjax(String warehouselistAjax) {
		this.warehouselistAjax = warehouselistAjax;
	}

	public String getWarehouseList(){
		List<WareHouse> list = materialservice.getWareHouseList();
		
		JSONArray json = new JSONArray();
		for(WareHouse warehouse:list){
			JSONObject jo = new JSONObject();
			try {
				jo.put("warehouseid",warehouse.getWarehouseid());
				jo.put("location", warehouse.getLocation());
				json.put(jo);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		setWarehouselistAjax(json.toString());
		System.out.println(json.toString());
		return SUCCESS;
	}
	
	//物料详情、修改==============================================================
	private Material materialvo;
	
	public Material getMaterialvo() {
		return materialvo;
	}

	public void setMaterialvo(Material materialvo) {
		this.materialvo = materialvo;
	}

	public String getMaterial(){
		this.materialvo = materialservice.getMaterialByCode(request.getParameter("materialCode"));
		return SUCCESS;
	}
	
	public String updateMaterial() throws ServletException, IOException{
		Material material = new Material();
		String materialCode = request.getParameter("materialCode");
	    String materialName = request.getParameter("materialName");
	    String materialType = request.getParameter("materialType");
	    String colorCode = request.getParameter("colorCode");
	    String colorDescription = request.getParameter("colorDescription");
	    String materialIngredient = request.getParameter("materialIngredient");
	    float unitPrice = Float.parseFloat(request.getParameter("unitPrice"));
	    String unit = request.getParameter("unit");
	    float width = Float.parseFloat(request.getParameter("width"));
	    float outputVol = Float.parseFloat(request.getParameter("outputVol"));
	    Date modificationDate = new Date();
	    
	    material.setMaterialCode(materialCode);
	    material.setMaterialName(materialName);
	    material.setMaterialType(materialType);
	    material.setColorCode(colorCode);
	    material.setColorDescription(colorDescription);
	    material.setMaterialIngredient(materialIngredient);
	    material.setUnitPrice(unitPrice);
	    material.setUnit(unit);
	    material.setWidth(width);
	    material.setOutputVol(outputVol);
	    material.setModificationDate(new java.sql.Date(modificationDate.getTime()));
	    
	    materialservice.updateMaterial(material);
		return SUCCESS;
	}
	
	
	//物料预定查询============================================
	private String materialApplyCode="";

	private String materialApplyDate="";
	
	private String materialCodeAjax;

	private String materialDetialAjax="";
	
	public String getMaterialApplyCode() {
		return materialApplyCode;
	}

	public String getMaterialApplyDate() {
		return materialApplyDate;
	}

	public void setMaterialApplyCode(String materialApplyCode) {
		this.materialApplyCode = materialApplyCode;
	}
	
	public void setMaterialApplyDate(String materialApplyDate) {
		this.materialApplyDate = materialApplyDate;
	}
	
	public String getMaterialCodeAjax() {
		return materialCodeAjax;
	}

	public String getMaterialDetialAjax() {
		return materialDetialAjax;
	}

	public void setMaterialCodeAjax(String materialCodeAjax) {
		this.materialCodeAjax = materialCodeAjax;
	}

	public void setMaterialDetialAjax(String materialDetialAjax) {
		this.materialDetialAjax = materialDetialAjax;
	}
	
	public String showApplyList(){
		System.out.println("enter showApplyList");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put(ApplyConstants.SEARCH_APPLY_PARAMS[0], this.materialApplyCode);
		params.put(ApplyConstants.SEARCH_APPLY_PARAMS[1], this.materialApplyDate);
		try {
			this.pageBean = materialservice.queryApply(this.rowsPerPage, this.page, params);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	public String showMaterialDetail(){
		System.out.println("enter showMaterialDetail");
		System.out.println(getMaterialCodeAjax());
		Material material = materialservice.getMaterialByCode(getMaterialCodeAjax());
		JSONObject result = new JSONObject();
		try {
			result.put("materialCode", material.getMaterialCode());
			result.put("materialName", material.getMaterialName());
			result.put("materialType", material.getMaterialType());
			result.put("colorCode", material.getColorCode());
			result.put("colorDescription", material.getColorDescription());
			result.put("materialIngredient", material.getMaterialIngredient());
			result.put("unitPrice", material.getUnitPrice());
			result.put("unit", material.getUnit());
			result.put("width", material.getWidth());
			result.put("outputVol", material.getOutputVol());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		setMaterialDetialAjax(result.toString());
		System.out.println(result.toString());
		return SUCCESS;
	}
}
