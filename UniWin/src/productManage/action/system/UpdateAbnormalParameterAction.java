package productManage.action.system;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.model.wy.AbnormalParameter;
import productManage.model.wy.Department;
import productManage.service.system.AbnormalParameterService;
import productManage.service.system.DepartmentService;

public class UpdateAbnormalParameterAction extends BaseAction{
private static final long serialVersionUID = 1L;
	
	@Autowired
	private AbnormalParameterService abnormalParameterService;
	private List<AbnormalParameter> abnormalParameterList;

	
	public AbnormalParameterService getAbnormalParameterService() {
		return abnormalParameterService;
	}


	public void setAbnormalParameterService(AbnormalParameterService abnormalParameterService) {
		this.abnormalParameterService = abnormalParameterService;
	}
	
	public List<AbnormalParameter> getAbnormalParameterList() {
		return abnormalParameterList;
	}


	public void setAbnormalParameterList(List<AbnormalParameter> abnormalParameterList) {
		this.abnormalParameterList = abnormalParameterList;
	}

	public String update(){
		if (request.getSession().getAttribute("account")!=null){
			int abnormalParameterID = Integer.parseInt(request.getParameter("abnormalParameterID"));
			String abParaName = request.getParameter("abParaName");
			Float abParaValue = Float.parseFloat(request.getParameter("abParaValue"));
			
			AbnormalParameter new_abnormalParameter = new AbnormalParameter();
			new_abnormalParameter.setAbnormalParameterID(abnormalParameterID);
			new_abnormalParameter.setAbParaName(abParaName);
			new_abnormalParameter.setAbParaValue(abParaValue);
			
			abnormalParameterService.update(new_abnormalParameter);
			
			abnormalParameterList = abnormalParameterService.findAll();
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}






}