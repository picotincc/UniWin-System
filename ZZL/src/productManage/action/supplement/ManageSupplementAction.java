package productManage.action.supplement;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.BaseAction;
import productManage.model.cs.OutSource;
import productManage.model.szl.Supplement;
import productManage.service.supplement.SupplementManagerService;

/**
 * @author SZL
 * @date 2016-3-28
 */

@Controller
public class ManageSupplementAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	@Autowired
	private SupplementManagerService supplementManagerService;
	
		
	public void setSupplementManagerService(SupplementManagerService supplementManagerService) {
		this.supplementManagerService = supplementManagerService;
	}
	
	public SupplementManagerService getSupplementManagerService() {
		return supplementManagerService;
	}
	
	public String changeState(){
		if (request.getSession().getAttribute("account")!=null){
		String supplementCode = request.getParameter("changeCode");
		String supplementState = request.getParameter("supplementState");
		//System.out.println(supplementCode);
		Supplement supplement = supplementManagerService.changeState(supplementCode, supplementState);
//		if(supplement == null){
//			return "error";
//		}
//			
		return "success";
		}else{
			return "failed";
		}
		
	}
}
