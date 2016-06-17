package productManage.action.system;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.model.wy.Department;
import productManage.service.system.DepartmentService;

public class UpdateDepartmentAction extends BaseAction{
private static final long serialVersionUID = 1L;
	
	@Autowired
	private DepartmentService departmentService;
	private List<Department> departmentList;

	
	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	
	public List<Department> getDepartmentList() {
		return departmentList;
	}


	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}

	public String update(){
		if (request.getSession().getAttribute("account")!=null){
			int departmentID = Integer.parseInt(request.getParameter("departmentID"));
			String departmentFullName = request.getParameter("departmentFullName");
			String departmentEnName = request.getParameter("departmentEnName");
			String departmentAbbrName = request.getParameter("departmentAbbrName");
			String departmentPhone = request.getParameter("departmentPhone");
			String departmentDescription = request.getParameter("departmentDescription");
			
			Department new_department = new Department();
			new_department.setDepartmentID(departmentID);
			new_department.setDepartmentFullName(departmentFullName);
			new_department.setDepartmentEnName(departmentEnName);
			new_department.setDepartmentAbbrName(departmentAbbrName);
			new_department.setDepartmentPhone(departmentPhone);
			new_department.setDepartmentDescription(departmentDescription);
			
			departmentService.update(new_department);
			
			departmentList = departmentService.findAll();
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}



}