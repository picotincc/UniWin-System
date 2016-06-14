package productManage.action.system;

import productManage.model.wy.Role;

public class RoleVO {
	private Role role;
	private Boolean checked;
	
	public RoleVO(Role role, boolean checked) {
		this.role = role;
		this.checked = new Boolean(checked);
	}
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
}
