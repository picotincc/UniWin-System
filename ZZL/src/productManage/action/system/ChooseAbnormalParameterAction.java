package productManage.action.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.model.wy.AbnormalParameter;
import productManage.service.system.AbnormalParameterService;

public class ChooseAbnormalParameterAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private AbnormalParameterService abnormalParameterService;
	private AbnormalParameter abnormalParameterItem;
	private List<AbnormalParameter> abnormalParameterLsit;
	
	public AbnormalParameterService getAbnormalParameterService() {
		return abnormalParameterService;
	}
	public void setAbnormalParameterService(AbnormalParameterService abnormalParameterService) {
		this.abnormalParameterService = abnormalParameterService;
	}
	
	public AbnormalParameter getAbnormalParameterItem() {
		return abnormalParameterItem;
	}

	public void setAbnormalParameterItem(AbnormalParameter abnormalParameterItem) {
		this.abnormalParameterItem = abnormalParameterItem;
	}

	public List<AbnormalParameter> getAbnormalParameterLsit() {
		return abnormalParameterLsit;
	}

	public void setAbnormalParameterLsit(List<AbnormalParameter> abnormalParameterLsit) {
		this.abnormalParameterLsit = abnormalParameterLsit;
	}
	
	public String choose(){
		if (request.getSession().getAttribute("account")!=null){
			String abnormalParameterID = request.getParameter("select");
			
			if(abnormalParameterID == null){
				setAbnormalParameterLsit(abnormalParameterService.findAll());
				return ERROR;
			}
			
			abnormalParameterItem = abnormalParameterService.findByID(abnormalParameterID);

			return SUCCESS;
		}
		else{
			return "failed";
		}
		
	}
	
}
