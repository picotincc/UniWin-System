package productManage.action.system;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.model.wy.Role;
import productManage.service.system.RoleService;

public class UpdateRoleAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;

	@Autowired
	private RoleService roleService;
	
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	
	public String update(){
		if (request.getSession().getAttribute("account")!=null){
			String roleID = request.getParameter("roleID1");
			String roleName = request.getParameter("roleName1");
			String roleDescription = request.getParameter("roleDescription1");
			
			Role role = new Role();
			
			role.setRoleID(Integer.parseInt(roleID));
			role.setRoleName(roleName);
			role.setRoleDescription(roleDescription);
			
			roleService.update(role);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
}
