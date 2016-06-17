package productManage.action.system;

import productManage.model.wy.Department;

public class DepartmentVO {
	private Department department;
	private boolean belongToUser;
	
	public DepartmentVO(Department department,boolean belongToUser){
		this.department = department;
		this.belongToUser = belongToUser;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public boolean isBelongToUser() {
		return belongToUser;
	}

	public void setBelongToUser(boolean belongToUser) {
		this.belongToUser = belongToUser;
	}

}
