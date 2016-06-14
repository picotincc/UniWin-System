package productManage.action.system;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.action.PageAction;
import productManage.model.wy.Department;
import productManage.service.system.DepartmentService;

public class ShowDepartmentAction extends PageAction{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private DepartmentService departmentService;
	private List<Department> departmentList;
	private Department departmentItem;

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
	
	public Department getDepartmentItem() {
		return departmentItem;
	}

	public void setDepartmentItem(Department departmentItem) {
		this.departmentItem = departmentItem;
	}
	
	public String show(){
		if (request.getSession().getAttribute("account")!=null){
			this.pageBean = departmentService.getDepartmentByPage(this.rowsPerPage, this.page);
			return SUCCESS;
		}
		else{
			return "failed";
		}

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
			
			//this.pageBean = departmentService.getDepartmentByPage(this.rowsPerPage, this.page);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
	
	public String add(){
		if (request.getSession().getAttribute("account")!=null){
			String departmentFullName = request.getParameter("departmentFullName");
			String departmentEnName = request.getParameter("departmentEnName");
			String departmentAbbrName = request.getParameter("departmentAbbrName");
			String departmentPhone = request.getParameter("departmentPhone");
			String departmentDescription = request.getParameter("departmentDescription");
			
			Department new_department = new Department();
			new_department.setDepartmentFullName(departmentFullName);
			new_department.setDepartmentEnName(departmentEnName);
			new_department.setDepartmentAbbrName(departmentAbbrName);
			new_department.setDepartmentPhone(departmentPhone);
			new_department.setDepartmentDescription(departmentDescription);
			
			departmentService.save(new_department);
			
			//this.pageBean = departmentService.getDepartmentByPage(this.rowsPerPage, this.page);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
	
	public String choose(){
		if (request.getSession().getAttribute("account")!=null){
			String departmentID = request.getParameter("select");
			
			//String result = SUCCESS;
			if(departmentID == null || departmentID.equals("")){
				//this.pageBean = departmentService.getDepartmentByPage(this.rowsPerPage, this.page);
				return ERROR;
			}
			
			setDepartmentItem(departmentService.findByID(departmentID));

			return SUCCESS;
		}
		else{
			return "failed";
		}

	}


}
