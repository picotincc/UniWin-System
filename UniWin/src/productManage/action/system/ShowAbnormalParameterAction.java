package productManage.action.system;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.action.PageAction;
import productManage.model.wy.AbnormalParameter;
import productManage.service.system.AbnormalParameterService;
import productManage.service.system.DepartmentService;

public class ShowAbnormalParameterAction extends PageAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private AbnormalParameterService abnormalParameterService;
	private List<AbnormalParameter> abnormalParameterList;
	private AbnormalParameter abnormalParameterItem;
	
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
	
	public AbnormalParameter getAbnormalParameterItem() {
		return abnormalParameterItem;
	}

	public void setAbnormalParameterItem(AbnormalParameter abnormalParameterItem) {
		this.abnormalParameterItem = abnormalParameterItem;
	}
	
	public String show(){
		if (request.getSession().getAttribute("account")!=null){
			this.pageBean = abnormalParameterService.getAbnormalParameterByPage(this.rowsPerPage, this.page);
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
	
	public String add(){
		if (request.getSession().getAttribute("account")!=null){
			String abParaName = request.getParameter("abParaName");
			Float abParaValue = Float.parseFloat(request.getParameter("abParaValue"));
			
			AbnormalParameter abnormalParameter = new AbnormalParameter();
			abnormalParameter.setAbParaName(abParaName);
			abnormalParameter.setAbParaValue(abParaValue);
			
			abnormalParameterService.save(abnormalParameter);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
	
	public String choose(){
		if (request.getSession().getAttribute("account")!=null){
			String abnormalParameterID = request.getParameter("select");
			
			if(abnormalParameterID == null || abnormalParameterID.equals("")){
				return ERROR;
			}
			
			abnormalParameterItem = abnormalParameterService.findByID(abnormalParameterID);

			return SUCCESS;
		}
		else{
			return "failed";
		}
		
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
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}

}
