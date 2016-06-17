package productManage.action.system;

import productManage.model.User;

public class UserVO {
	private User user;
	private String departmentName;
	
	public UserVO(User user, String departmentName) {
		this.user = user;
		this.departmentName = departmentName;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
}