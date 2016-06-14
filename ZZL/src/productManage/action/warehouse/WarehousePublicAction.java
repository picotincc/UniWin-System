package productManage.action.warehouse;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
import productManage.service.warehouse.WarehouseManagerService;

public class WarehousePublicAction extends PageAction{

    @Autowired
    private WarehouseManagerService warehouseService;
    
    /**
     * ajax传参
     */
    private String materialCode;
    private int warehouseid;
    /**
     * ajax返回值：返回物料和仓库的详细信息（包括了供应商信息）
     */
    private String storeDetailAjax;
    
    public String getStoreDetailInfoAjax(){
    	System.out.println("In action: "+materialCode+" "+warehouseid);
    	Store storeT = warehouseService.getStore(materialCode, warehouseid);
    	
    	Material materialT = warehouseService.getMaterialByCode(materialCode);
    	WareHouse warehouseT = warehouseService.getWarehouseById(warehouseid);
    	System.out.println("物料："+materialT);
    	System.out.println("仓库："+warehouseT);
    	Set<Supply> supplysT = materialT.getSupplys();
    	
    	JSONObject json = new JSONObject();
    	try {
    		JSONObject material = new JSONObject();
    		JSONObject warehouse = new JSONObject();
    		JSONObject store = new JSONObject();
    		json.put("material",material);
    		json.put("warehouse",warehouse);
    		json.put("store",store);
    		JSONArray vendors = new JSONArray();
    		json.put("vendors",vendors);
			material.put("materialName",materialT.getMaterialName());
			material.put("materialCode",materialT.getMaterialCode());
			material.put("materialIngredient", materialT.getMaterialIngredient());
			material.put("unitPrice", materialT.getUnitPrice());
			material.put("materialType", materialT.getMaterialType());
			material.put("colorCode", materialT.getColorCode());
			material.put("colorDescription", materialT.getColorDescription());
			material.put("unit", materialT.getUnit());
			warehouse.put("location", warehouseT.getLocation());
			warehouse.put("remain", warehouseT.getRemain());
			store.put("remainVol", storeT==null?"":storeT.getRemainVol());
			for(Supply sp:supplysT){
				Vendor vendorT = sp.getVendor();
				JSONObject vendor = new JSONObject();
				vendor.put("vendorId", vendorT.getVendorId());
				vendor.put("vendorName", vendorT.getVendorName());
				vendor.put("vendorMobileNum", vendorT.getVendorMobileNum());
				vendor.put("vendorAddr", vendorT.getVendorAddr());
				vendors.put(vendor);
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	setStoreDetailAjax(json.toString());
    	return SUCCESS;
    }

	public String getStoreDetailAjax() {
		return storeDetailAjax;
	}

	public void setStoreDetailAjax(String storeDetailAjax) {
		this.storeDetailAjax = storeDetailAjax;
	}

	public String getMaterialCode() {
		return materialCode;
	}

	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}

	public int getWarehouseid() {
		return warehouseid;
	}

	public void setWarehouseid(int warehouseid) {
		this.warehouseid = warehouseid;
	}
	
}
