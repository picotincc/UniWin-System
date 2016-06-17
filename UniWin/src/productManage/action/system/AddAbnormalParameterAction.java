package productManage.action.system;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.model.wy.AbnormalParameter;
import productManage.service.system.AbnormalParameterService;

public class AddAbnormalParameterAction extends BaseAction{
	
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
	
	public String add(){
		if (request.getSession().getAttribute("account")!=null){
			String abParaName = request.getParameter("abParaName");
			Float abParaValue = Float.parseFloat(request.getParameter("abParaValue"));
			
			AbnormalParameter abnormalParameter = new AbnormalParameter();
			abnormalParameter.setAbParaName(abParaName);
			abnormalParameter.setAbParaValue(abParaValue);
			
			abnormalParameterService.save(abnormalParameter);
			
			abnormalParameterList = abnormalParameterService.findAll();
			return SUCCESS;
		}
		else{
			return "failed";
		}
		
	}
}
