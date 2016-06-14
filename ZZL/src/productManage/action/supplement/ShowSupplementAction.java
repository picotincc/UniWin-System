package productManage.action.supplement;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.BaseAction;
import productManage.action.PageAction;
import productManage.model.szl.Supplement;
import productManage.service.supplement.SupplementManagerService;
import productManage.util.DateFormat;
import productManage.vo.PageBean;
import productManage.vo.process.ProcessConstants;
import productManage.vo.supplement.SupplementConstants;
import productManage.vo.supplement.SupplementDetailVO;
import productManage.vo.supplement.SupplementVO;

/**
 * @author SZL
 * @date 2016-3-24
 */

@Controller
public class ShowSupplementAction extends PageAction{

	private static final long serialVersionUID = 1L;
	@Autowired
	private SupplementManagerService supplementManagerService;
	private List<Supplement> supplementList;
	
	private SupplementDetailVO supplementDetailVO;
	
	private String supplementCode;
	public void setSupplementCode(String supplementCode){
		this.supplementCode=supplementCode;
	}
	public String getSupplementCode(){
		return supplementCode;
	}
	

		
	public void setSupplementManagerService(SupplementManagerService supplementManagerService) {
		this.supplementManagerService = supplementManagerService;
	}
	
	public SupplementManagerService getSupplementManagerService() {
		return supplementManagerService;
	}
	
	public List<Supplement> getSupplementList() {
		return supplementList;
	}

	public void setSupplementList(List<Supplement> supplementList) {
		this.supplementList = supplementList;
	}
	
	
	public String showAll(){
		if (request.getSession().getAttribute("account")!=null){
		try {
			this.pageBean = supplementManagerService.getAllSupplement(this.rowsPerPage, this.page);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return "error";
		}
		return "success";
		}else{
			return "failed";
		}
	}
	
	private String designCode;
	private String supplementDate;
	private String materialType;
	private String vendorName;
	private String supplementState;
	
	public String showByMoreDetails(){
		if (request.getSession().getAttribute("account")!=null){
		Map<String, Object> params = new HashMap<String, Object>();
		if(!(this.designCode.equals(""))){
			params.put(SupplementConstants.SEARCH_SUPPLEMENTS_PARAMS[0], this.designCode);
		}
		if(!(this.supplementDate.equals(""))){
			params.put(SupplementConstants.SEARCH_SUPPLEMENTS_PARAMS[1], this.supplementDate);
		}
		if(!(this.materialType.equals(""))){
			params.put(SupplementConstants.SEARCH_SUPPLEMENTS_PARAMS[2], this.materialType);
		}
		if(!(this.vendorName.equals(""))){
			params.put(SupplementConstants.SEARCH_SUPPLEMENTS_PARAMS[3], this.vendorName);
		}
		if(!(this.supplementState.equals(""))){
			params.put(SupplementConstants.SEARCH_SUPPLEMENTS_PARAMS[4], this.supplementState);
		}
		try {
			this.pageBean = supplementManagerService.querySupplements(this.rowsPerPage, this.page, params);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean = new PageBean();
			return ERROR;
		}
		return SUCCESS;
		}else{
			return "failed";
		}
		
	}
	
	public String getDesignCode(){
		return designCode;
	}
	public void setDesignCode(String designCode){
		this.designCode=designCode;
	}
	public String getSupplementDate(){
		return supplementDate;
	}
	public void setSupplementDate(String supplementDate){
		this.supplementDate=supplementDate;
	}
	public String getMaterialType(){
		return materialType;
	}
	public void setMaterialType(String materialType){
		this.materialType=materialType;
	}
	public String getVendorName(){
		return vendorName;
	}
	public void setVendorName(String vendorName){
		this.vendorName=vendorName;
	}
	public String getSupplementState(){
		return supplementState;
	}
	public void setSupplementState(String supplementState){
		this.supplementState=supplementState;
	}
	
	
	public String showSupplementDetail(){
		
		if (request.getSession().getAttribute("account")!=null){
		this.supplementDetailVO=supplementManagerService.getSupplementDetail(supplementCode);
		//System.out.println(supplementDetailVO.getSupplementCode());
		return SUCCESS;
		}else{
			return "failed";
		}
		
	}
//	public String execute() throws ServletException, IOException {
//	String supplementCode = request.getParameter("supplementCode");
//	System.out.println(supplementCode);
//	if(supplementCode.equals("")){
//		supplementList = supplementManagerService.getAllSupplement();
//	}
//	else{
//		supplementList = supplementManagerService.getSupplementByCode(supplementCode);
//	}
//	return SUCCESS;
//	
//}
	public SupplementDetailVO getSupplementDetailVO() {
		return supplementDetailVO;
	}
	public void setSupplementDetailVO(SupplementDetailVO supplementDetailVO) {
		this.supplementDetailVO = supplementDetailVO;
	}

//	public String showByMoreDetails()throws ServletException, IOException{
//	//	supplementList.clear();
//		String designCode=request.getParameter("designCode");
//		String supplementDate = request.getParameter("supplementDate");
//		String materialType = request.getParameter("materialType");
//		String vendorName = request.getParameter("vendorName");
//		String supplementState = request.getParameter("supplementState");
//		List<Supplement> tempByDesign=null;
//		List<Supplement> tempByDate=null;
//		List<Supplement> tempByType=null;
//		List<Supplement> tempByVendor=null;
//		List<Supplement> tempByState=null;
//	//	if((designCode.equals(""))&&(supplementDate.equals(""))&&(materialType.equals(""))&&(vendorName.equals(""))&&(supplementState.equals(""))){
//			supplementList = supplementManagerService.getAllSupplement();
//				
//			if(!(designCode.equals(""))){
//				tempByDesign=supplementManagerService.getSupplementByDesignCode(designCode);
//				supplementList=interact(supplementList,tempByDesign);
//			}
//			if(!(supplementDate.equals(""))){
//				tempByDate=supplementManagerService.getSupplementByDate(StringToDate(supplementDate));
//				supplementList=interact(supplementList,tempByDate);
//			}
//			if(!(materialType.equals(""))){
//				tempByType=supplementManagerService.getSupplementByMaterialType(materialType);
//				supplementList=interact(supplementList,tempByType);
//			}
//			if(!(vendorName.equals(""))){
//				tempByVendor=supplementManagerService.getSupplementByVendorName(vendorName);
//				supplementList=interact(supplementList,tempByVendor);
//			}
//			if(!(supplementState.equals(""))){
//	//			System.out.println("wo zai state");
//				tempByState=supplementManagerService.getSupplementByState(supplementState);
//				supplementList=interact(supplementList,tempByState);
//			}
//		
//		return SUCCESS;
//		
//	}
//
//	private List<Supplement> interact(List<Supplement> tempA,List<Supplement> tempB) {
//		List<Supplement> result= new ArrayList<Supplement>();
//		for(int i=0;i<tempA.size();i++){
//			for(int j=0;j<tempB.size();j++){
//				if(tempA.get(i).getSupplementID()==tempB.get(j).getSupplementID()){
//					result.add(tempA.get(i));
//					break;
//				}
//			}
//		}
//		//System.out.println("wo zai jiao");
//		return result;
//	}


}
