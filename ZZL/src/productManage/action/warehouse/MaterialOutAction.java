package productManage.action.warehouse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.PageAction;
import productManage.model.User;
import productManage.model.lhj.Material;
import productManage.model.lhj.Materialapply;
import productManage.model.lhj.WareHouse;
import productManage.model.wjx.MaterialOutput;
import productManage.model.wjx.Store;
import productManage.service.system.UserService;
import productManage.service.warehouse.WarehouseManagerService;
import productManage.vo.warehouse.StoreAndApply;

public class MaterialOutAction extends PageAction{

    @Autowired
    private WarehouseManagerService warehouseService;
    @Autowired
    private UserService userService;
    
//  出库单管理的搜索参数：
    private String date = "";
    
    private String errorMessage;
    
//  创建出库单时传递的数据：
    private String comment;//备注
    private int outVol;//出仓数量
    private String materialCode;
    private int warehouseId;
    private String materialApplyCode;
    
    private String searchMaterialCode;
    private String searchMaterialName;
    private String searchDesignCode;
    private String searchMaterialApplyCode;
    
    /**
     * 用于ajax的参数传递：根据日期获取该日期下的详细出库单
     */
    private String dateAjax;
    private String outputDateDetialAjax;
    
    public String showAllStores(){
    	if (request.getSession().getAttribute("account")!=null){
    		this.searchMaterialCode = null;
    		this.searchMaterialName = null;
    		this.searchDesignCode = null;
    		this.searchMaterialApplyCode = null;
    		pageBean = warehouseService.getAllOutStores(this.page, this.rowsPerPage);
    		List<Object[]> queryResults = pageBean.getList();
    		List<StoreAndApply> results = storeApplyConversion(queryResults);
    		pageBean.setList(results);
    		return "showAllStores";
    	}else{
    		return "failed";
    	}
    }
    
    public String showStoresByFilter(){
    	if (request.getSession().getAttribute("account")!=null){
    		Map filter = new HashMap();
    		filter.put("materialCode", searchMaterialCode);
    		filter.put("materialName", searchMaterialName);
    		filter.put("designCode", searchDesignCode);
    		filter.put("materialApplyCode", searchMaterialApplyCode);
    		pageBean = warehouseService.getStoresByFilter(this.page, this.rowsPerPage, filter);
    		List<Object[]> queryResults = pageBean.getList();
    		List<StoreAndApply> results = storeApplyConversion(queryResults);
    		pageBean.setList(results);
    		return "showAllStores";
    	}else{
    		return "failed";
    	}
    }
    
    public List<StoreAndApply> storeApplyConversion(List<Object[]> queryResults){
    	int count = 0;
    	List<StoreAndApply> results = new ArrayList<StoreAndApply>();
    	for(Object[] os : queryResults){
        	StoreAndApply sa = new StoreAndApply();
        	Store store = (Store)os[2];
        	sa.setLocation(store.getWarehouse().getLocation());
        	sa.setMaterialApplyCode((String)os[0]);
        	sa.setMaterialApplyVol((float)os[1]);
        	sa.setMaterialCode(store.getMaterial().getMaterialCode());
        	sa.setMaterialName(store.getMaterial().getMaterialName());
        	sa.setRemain(store.getWarehouse().getRemain());
        	sa.setRemainVol(store.getRemainVol());
        	List<MaterialOutput> materialOutputs = warehouseService.getMaterialOutputs((String)os[0], store.getMaterial().getMaterialCode(), store.getWarehouse().getWarehouseid());
    		float outSum = 0;
    		for(MaterialOutput mo:materialOutputs){
    			outSum+=mo.getMaterialOutputVol();
    		}
    		sa.setActualOutVol(outSum);
    		sa.setWarehouseId(store.getWarehouse().getWarehouseid());
    		results.add(sa);
        }
    	return results;
    }
    
    public String doMaterialOut(){
    	if (request.getSession().getAttribute("account")!=null){
    		
    		Store store = warehouseService.getStore(materialCode, warehouseId);
    		if(outVol>store.getRemainVol()){
    			System.out.println("出库数大于现有量");
    			setErrorMessage("抱歉，您的出库数量大于库存数量");
    			return "error";
    		}
    		//出库操作1：新建出库单
    		MaterialOutput moNew = new MaterialOutput();
    		Materialapply map = warehouseService.getMaterialApplyByCode(materialApplyCode);
    		moNew.setMaterialApply(map);
    		moNew.setMaterial(store.getMaterial());
    		moNew.setMaterialOutputComment(comment);
    		Calendar now = Calendar.getInstance();
    		now.set(now.get(Calendar.YEAR), now.get(Calendar.MONTH),now.get(Calendar.DATE));
    		moNew.setMaterialOutputDate(new java.sql.Date(now.getTimeInMillis()));
    		moNew.setMaterialOutputVol(outVol);
    		User user = userService.getUserByAccount((String)request.getSession().getAttribute("account"));
    		moNew.setUser(user);
    		moNew.setWarehouse(store.getWarehouse());
    		warehouseService.addMaterialOutput(moNew);
    		//出库操作2：修改store的物料剩余量
    		store.setRemainVol(store.getRemainVol()-outVol);
    		warehouseService.updateStore(store);
    		//出仓操作处理后初始化界面
    		try {
				response.sendRedirect(request.getContextPath()+"/"+"Warehouse/materialOut_showAllStores");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		return "showAllStores";
    	}else{
    		return "failed";
    	}
    }
    
    public String showMaterialOutputs(){
if (request.getSession().getAttribute("account")!=null){
    		
	Calendar calendar = Calendar.getInstance();
	System.out.println(getDate());
	if(getDate().equals("")||getDate() == null){
		calendar = null;
	}else{
		//时间用-分割
		String[] dates = getDate().split("-");
		calendar.set(Integer.parseInt(dates[0]), Integer.parseInt(dates[1])-1, Integer.parseInt(dates[2]));
	}
	this.pageBean = warehouseService.getMaterialOutputList(calendar, this.page, this.rowsPerPage);
	setDate("");
	return "showMaterialOutputs";
    	}else{
    		return "failed";
    	}
    }

    
    public String getOutputDetailByDate(){
if (request.getSession().getAttribute("account")!=null){
    		
	Calendar cal = Calendar.getInstance();
	String[] dates = getDateAjax().split("-");
	cal.set(Integer.parseInt(dates[0]), Integer.parseInt(dates[1])-1, Integer.parseInt(dates[2]));
	List<MaterialOutput> results = warehouseService.getMaterialOutputList(cal);
	System.out.println("in action ajax0"+getDateAjax());
	JSONArray json = new JSONArray();
	try {
		for(MaterialOutput mo:results){
			Material materialT = mo.getMaterial();
			WareHouse warehouseT = mo.getWarehouse();
			User userT = mo.getUser();
			Store storeT = warehouseService.getStore(mo.getMaterial().getMaterialCode(), mo.getWarehouse().getWarehouseid());
			JSONObject jo = new JSONObject();
			JSONObject material = new JSONObject();
			JSONObject warehouse = new JSONObject();
			JSONObject user = new JSONObject();
			JSONObject store = new JSONObject();
			jo.put("material", material);
			jo.put("warehouse", warehouse);
			jo.put("user", user);
			jo.put("store", store);
			material.put("materialName", materialT.getMaterialName());
			material.put("materialCode", materialT.getMaterialCode());
			warehouse.put("warehouseid", warehouseT.getWarehouseid());
			warehouse.put("location", warehouseT.getLocation());
			warehouse.put("remain", warehouseT.getRemain());
			user.put("userName", userT.getUserName());
			store.put("remainVol", storeT==null?"":storeT.getRemainVol());
			jo.put("materialOutputVol", mo.getMaterialOutputVol());
			json.put(jo);
		}
	} catch (JSONException e) {
		e.printStackTrace();
	}
	setOutputDateDetialAjax(json.toString());
	return SUCCESS;
    	}else{
    		return "failed";
    	}
    }

    public WarehouseManagerService getWarehouseService() {
        return warehouseService;
    }

    public void setWarehouseService(WarehouseManagerService warehouseService) {
        this.warehouseService = warehouseService;
    }
    
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}


	public String getDateAjax() {
		return dateAjax;
	}

	public void setDateAjax(String dateAjax) {
		this.dateAjax = dateAjax;
	}


	public String getOutputDateDetialAjax() {
		return outputDateDetialAjax;
	}

	public void setOutputDateDetialAjax(String outputDateDetialAjax) {
		this.outputDateDetialAjax = outputDateDetialAjax;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getOutVol() {
		return outVol;
	}

	public void setOutVol(int outVol) {
		this.outVol = outVol;
	}

	public String getMaterialCode() {
		return materialCode;
	}

	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}

	public int getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(int warehouseId) {
		this.warehouseId = warehouseId;
	}

	public String getMaterialApplyCode() {
		return materialApplyCode;
	}

	public void setMaterialApplyCode(String materialApplyCode) {
		this.materialApplyCode = materialApplyCode;
	}

	public String getSearchMaterialCode() {
		return searchMaterialCode;
	}

	public void setSearchMaterialCode(String searchMaterialCode) {
		this.searchMaterialCode = searchMaterialCode;
	}

	public String getSearchMaterialName() {
		return searchMaterialName;
	}

	public void setSearchMaterialName(String searchMaterialName) {
		this.searchMaterialName = searchMaterialName;
	}

	public String getSearchDesignCode() {
		return searchDesignCode;
	}

	public void setSearchDesignCode(String searchDesignCode) {
		this.searchDesignCode = searchDesignCode;
	}

	public String getSearchMaterialApplyCode() {
		return searchMaterialApplyCode;
	}

	public void setSearchMaterialApplyCode(String searchMaterialApplyCode) {
		this.searchMaterialApplyCode = searchMaterialApplyCode;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
	
    
}
