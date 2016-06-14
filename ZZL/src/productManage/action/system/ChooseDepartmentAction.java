package productManage.action.system;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.mapping.Map;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;

import productManage.action.BaseAction;
import productManage.model.wy.Department;
import productManage.service.system.DepartmentService;

public class ChooseDepartmentAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private DepartmentService departmentService;
	private Department departmentItem;
	private List<Department> departmentLsit;
	
	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	
	public Department getDepartmentItem() {
		return departmentItem;
	}
	public void setDepartmentItem(Department departmentItem) {
		this.departmentItem = departmentItem;
	}
	
	public List<Department> getDepartmentLsit() {
		return departmentLsit;
	}
	public void setDepartmentLsit(List<Department> departmentLsit) {
		this.departmentLsit = departmentLsit;
	}
	
	public String choose(){
		if (request.getSession().getAttribute("account")!=null){
			String departmentID = request.getParameter("select");
			
			if(departmentID == null){
				departmentLsit = departmentService.findAll();
				return ERROR;
			}
			
			departmentItem = departmentService.findByID(departmentID);

			return SUCCESS;
		}
		else{
			return "failed";
		}
		
	}

	
}
