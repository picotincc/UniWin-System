package productManage.action.supplement;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.PageAction;
import productManage.dao.lhj.SupplyDao;
import productManage.dao.szl.SupplementDao;
import productManage.dao.wy.UserDao;
import productManage.dao.zky.ProductionDao;
import productManage.model.User;
import productManage.model.szl.Supplement;
import productManage.model.szl.SupplementMaterial;
import productManage.model.zky.Production;
import productManage.service.supplement.SupplementCreateService;
import productManage.util.DateFormat;
import productManage.vo.supplement.SupplementMaterialVO;

/**
 * @author SZL
 * @date 2016-3-23
 */

@Controller
public class AddSupplementAction extends PageAction{

	private static final long serialVersionUID = 1L;
	@Autowired
	private SupplementCreateService supplementCreateService;
		
	public void setSupplementCreateService(SupplementCreateService supplementCreateService) {
		this.supplementCreateService = supplementCreateService;
	}
	
	public SupplementCreateService getSupplementCreateService() {
		return supplementCreateService;
	}
	
	@Autowired
	ProductionDao pdao;
	
	@Autowired
	UserDao udao;
	
	@Autowired
	SupplyDao sdao;
	
	@Autowired 
	SupplementDao smdao;
	
	private String detailMsg;
	private String shellAccessoryType;
	private String materialCode;
	private String materialName;	
	public String showLiningSupplementMaterial(){
		if (request.getSession().getAttribute("account")!=null){
		List<SupplementMaterialVO> smList = new ArrayList<SupplementMaterialVO>();
		if(isAjaxRes()){
			this.detailMsg = null;
			smList = supplementCreateService.getLiningMaterial(materialCode, materialName, shellAccessoryType);
			if( smList != null ){
				try{
				JSONArray json = new JSONArray();
				for(SupplementMaterialVO sm : smList){
	                JSONObject jo = new JSONObject();	                
	                jo.put("materialCode", sm.getMaterialCode());	               
	                jo.put("materialName", sm.getMaterialName());
	                jo.put("materialIngredient", sm.getMaterialIngredient());
	                jo.put("shellAccessoryType", sm.getShellAccessoryType());
	                jo.put("colorDescription", sm.getColorDescription());
	                jo.put("vendorName", sm.getVendorName());
	                jo.put("supplyID", sm.getSupplyId());
	                json.put(jo);
	            } 
					this.detailMsg = json.toString();
				}catch(Exception e){
					System.out.println(e);
				}
				//System.out.println(detailMsg);
				
				return "success";
			}
		}
		
		return "success";	
		}else{
			return "failed";
		}
	}
	public String showAuxSupplementMaterial(){
		if (request.getSession().getAttribute("account")!=null){
		List<SupplementMaterialVO> smList = new ArrayList<SupplementMaterialVO>();
		if(isAjaxRes()){
			this.detailMsg = null;
			smList = supplementCreateService.getAuxMaterial(materialCode, materialName, shellAccessoryType);
			if( smList != null ){
				try{
				JSONArray json = new JSONArray();
				for(SupplementMaterialVO sm : smList){
	                JSONObject jo = new JSONObject();	                
	                jo.put("materialCode", sm.getMaterialCode());	               
	                jo.put("materialName", sm.getMaterialName());
	                jo.put("materialIngredient", sm.getMaterialIngredient());
	                jo.put("shellAccessoryType", sm.getShellAccessoryType());
	                jo.put("colorDescription", sm.getColorDescription());
	                jo.put("vendorName", sm.getVendorName());
	                jo.put("supplyID", sm.getSupplyId());
	                json.put(jo);
	            } 
					this.detailMsg = json.toString();
				}catch(Exception e){
					System.out.println(e);
				}
				//System.out.println(detailMsg);
				return "success";
			}
		}
		
		return "success";	
	}else{
		return "failed";
	}
	}
	private boolean isAjaxRes(){		 
        String header = request.getHeader("X-Requested-With");
        if (header != null && "XMLHttpRequest".equals(header))
            return true;
        else
            return false;
	}
	
	private String supplementType;
	private String supplementCode;
	private String productionCode;
	private String supplementDate;
	private String userName;
	private String supplementComment;
	private String addMsg;
	private String smList ;
	
	public String createSupplement()throws ServletException, IOException{
		if (request.getSession().getAttribute("account")!=null){
		Supplement sp =new Supplement();
		sp.setSupplementCode(supplementCode);
		sp.setSupplementComment(supplementComment);
		sp.setSupplementState("待审核");
		sp.setSupplementType(supplementType);
		if(productionCode.equals("")){
			//此处应该设为null，待完善
			//sp.setProduction(null);
			sp.setProduction(pdao.getProductionById(14));
		}else{
			
			
			//System.out.println(productionCode);
			Production p = pdao.getProductionByCode(productionCode);
			if(p==null){
				addMsg="未找到生产单";
				return "success";
			}
			sp.setProduction(p);
		}
		sp.setSupplementDate(DateFormat.StringToDate(supplementDate));
		
		//此处应该查找user，待数据完备修改,权限管理加入后自动获取user
		
		User u = udao.getUserByName(userName).get(0);
		if(u==null){
			addMsg="此补料人无权限";
			return "success";
		}
		sp.setUser(u);
		
		supplementCreateService.createSupplement(sp);
		Supplement supplementTemp=smdao.getSupplementByCode(supplementCode);
		
		smList=smList.substring(0,smList.length()-1);
		String[] smItem=smList.split(":");
		for(int i=0;i<smItem.length;i++){
			String[] temp=smItem[i].split(";",-1);
			SupplementMaterial sm =new SupplementMaterial();
			sm.setSupply(sdao.getSupplyByID(Integer.parseInt(temp[0])));		
			sm.setSupplement(supplementTemp);		
			sm.setMaterialSpecification(temp[1]);
			sm.setMaterialVol(Integer.parseInt(temp[2]));
			sm.setSupUsage(temp[3]);
			supplementCreateService.createSupplementMaterial(sm);
		}
		//System.out.println(smList);
		addMsg="提交成功";
		return "success";
		}else{
			return "failed";
		}
		
	}


	


	public String getShellAccessoryType() {
		return shellAccessoryType;
	}

	public void setShellAccessoryType(String shellAccessoryType) {
		this.shellAccessoryType = shellAccessoryType;
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

	public String getDetailMsg() {
		return detailMsg;
	}

	public void setDetailMsg(String detailMsg) {
		this.detailMsg = detailMsg;
	}

	public String getSupplementType() {
		return supplementType;
	}

	public void setSupplementType(String supplementType) {
		this.supplementType = supplementType;
	}

	public String getSupplementCode() {
		return supplementCode;
	}

	public void setSupplementCode(String supplementCode) {
		this.supplementCode = supplementCode;
	}

	public String getProductionCode() {
		return productionCode;
	}

	public void setProductionCode(String productionCode) {
		this.productionCode = productionCode;
	}

	public String getSupplementDate() {
		return supplementDate;
	}

	public void setSupplementDate(String supplementDate) {
		this.supplementDate = supplementDate;
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

	public String getAddMsg() {
		return addMsg;
	}

	public void setAddMsg(String addMsg) {
		this.addMsg = addMsg;
	}

	public String getSmList() {
		return smList;
	}

	public void setSmList(String smList) {
		this.smList = smList;
	}








}
