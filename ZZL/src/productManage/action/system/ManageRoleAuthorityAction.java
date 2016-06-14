package productManage.action.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.soap.Detail;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.PageAction;
import productManage.model.wy.Authority;
import productManage.model.wy.Module;
import productManage.model.wy.Role;
import productManage.service.system.AuthorityService;
import productManage.service.system.RoleService;

public class ManageRoleAuthorityAction extends PageAction{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private AuthorityService authorityService;
	
	private List<Role> roleList;
	private Role roleItem;
	
	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public Role getRoleItem() {
		return roleItem;
	}

	public void setRoleItem(Role roleItem) {
		this.roleItem = roleItem;
	}
	
	public String showRole(){
		if (request.getSession().getAttribute("account")!=null){
			this.pageBean = roleService.getRoleByPage(this.rowsPerPage, this.page);
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}

}
