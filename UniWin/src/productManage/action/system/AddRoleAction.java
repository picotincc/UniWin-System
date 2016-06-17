package productManage.action.system;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.model.wy.Role;
import productManage.service.system.RoleService;

public class AddRoleAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	@Autowired
	private RoleService roleService;
	
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	
	public String add(){
		if (request.getSession().getAttribute("account")!=null){
			String roleName = request.getParameter("newRoleName");
			String roleDescription = request.getParameter("newRoleDescription");
			
			Role role = new Role();
			role.setRoleName(roleName);
			role.setRoleDescription(roleDescription);
			
			roleService.saveRole(role);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}
		
	}

}
