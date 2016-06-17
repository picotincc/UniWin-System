package productManage.action.system;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.action.PageAction;
import productManage.model.User;
import productManage.model.wy.Department;
import productManage.model.wy.Role;
import productManage.model.wy.UserRole;
import productManage.service.system.DepartmentService;
import productManage.service.system.RoleService;
import productManage.service.system.UserRoleService;
import productManage.service.system.UserService;
import productManage.vo.PageBean;
import productManage.vo.system.RoleListVO;
import productManage.vo.system.UserConstants;

public class ShowUserRoleAction extends PageAction{
	
	private static final long serialVersionUID = 1L;
	
	//protected PageBean pageBean2;
	
	@Autowired
	private UserRoleService userRoleService;
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	private List<UserRole> userRoleList;
	private List<User> userList;
	
	private List<RoleVO> roleList;
	private List<Object> isSelected;

	private String selectedUserId;
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public UserRoleService getUserRoleService() {
		return userRoleService;
	}

	public void setUserRoleService(UserRoleService userRoleService) {
		this.userRoleService = userRoleService;
	}
	
	public List<UserRole> getUserRoleList() {
		return userRoleList;
	}

	public void setUserRoleList(List<UserRole> userRoleList) {
		this.userRoleList = userRoleList;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<RoleVO> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<RoleVO> roleList) {
		this.roleList = roleList;
	}

	public String getSelectedUserId() {
		return selectedUserId;
	}

	public void setSelectedUserId(String selectedUserId) {
		this.selectedUserId = selectedUserId;
	}
	
	private String userAccount;
	private String searchedUserName;
	
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getSearchedUserName() {
		return searchedUserName;
	}
	public void setSearchedUserName(String searchedUserName) {
		this.searchedUserName = searchedUserName;
	}
	
	public String showUserRole(){
		if (request.getSession().getAttribute("account")!=null){
			//userList = userService.findAll();
			//PageBean pb = userService.getUserVOByPage(this.rowsPerPage, this.page);
			
			this.pageBean = userService.getUserVOByPage(this.rowsPerPage, this.page);
			//PageBean pb2 = roleService.getRoleByPage(this.rowsPerPage, this.page);

			
			if(RoleListVO.roleList == null){
				List<Role> roleDtoList = roleService.findAll();
				roleList = new ArrayList<RoleVO>();
				
				for(Role role: roleDtoList) {
					roleList.add(new RoleVO(role, false));
				}
			}
			else{
				roleList = RoleListVO.roleList;
				}
			//RoleListVO.roleList.clear();

			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
	
	public String search(){
		if (request.getSession().getAttribute("account")!=null){
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(UserConstants.SEARCH_USER_PARAMS[0],userAccount);
			params.put(UserConstants.SEARCH_USER_PARAMS[1], searchedUserName);
			
			this.pageBean = userService.searchUserByPage(this.rowsPerPage, this.page,params);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
	
	public String showRoleOfUser(){
		if (request.getSession().getAttribute("account")!=null){
			selectedUserId = request.getParameter("selectedUserId");
			System.out.println(selectedUserId);
			
			roleList = new ArrayList<>();
			List<Role> roleDtoList = roleService.findAll();

			//根据用户id获取到了他的角色列表
			List<Role> roleOfUser = userRoleService.findRoleOfUser(Integer.parseInt(selectedUserId));
			
			isSelected = new ArrayList<Object>();
			
			for(int i = 0;i < roleDtoList.size();i++){
				Role roleItem = roleDtoList.get(i);
				
				boolean selected = false;
				
				for(int k = 0;k < roleOfUser.size();k++){
					Role roleItemOfUser = roleOfUser.get(k);
					if(roleItemOfUser.getRoleID() == roleItem.getRoleID()){
						selected = true;
					}
				}
				
				isSelected.add(selected);
				
				roleList.add(new RoleVO(roleItem, selected));
			}
			RoleListVO.roleList = roleList;
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}

	public String saveRoleOfUser(){
		if (request.getSession().getAttribute("account")!=null){
			selectedUserId = request.getParameter("selectedUserId");
			System.out.println("userId:" + selectedUserId);
			
			List<Role> roleOfUser = userRoleService.findRoleOfUser(Integer.parseInt(selectedUserId));
			
			String[] roleIdList = request.getParameterValues("role");
			
			//遍历用户原有的所有角色，逐一和roleIdList比对，不存在的则删除
			for(Role role:roleOfUser){
				String roleId = role.getRoleID()+"";
				
				boolean stillExist = false;
				for(int i = 0;i < roleIdList.length;i++){
					if(roleId.equals(roleIdList[i])){
						stillExist = true;
					}
				}
				if(!stillExist){
					userRoleService.delete(selectedUserId,roleId);
				}
			}
			
			//遍历roleIdList，对于用户没有的角色则添加进去
			for(int i = 0;i < roleIdList.length;i++){
				System.out.print(roleIdList[i]);
				System.out.print(",");
				
				Role roleItem = roleService.findById(roleIdList[i]);
				
				//检验该角色是否被用户拥有
				boolean isHad = false;
				for(Role role: roleOfUser) {
					if(role.getRoleID() == Integer.parseInt(roleIdList[i])){
						isHad = true;
					}
				}
				
				if(!isHad){
					UserRole roleUser = new UserRole();
					roleUser.setUserId(Integer.parseInt(selectedUserId));
					roleUser.setRoleID(Integer.parseInt(roleIdList[i]));
					
					userRoleService.save(roleUser);
				}
			}
			
			userList = userService.findAll();
			List<Role> roleDtoList = roleService.findAll();
			
			roleList = new ArrayList<>();
			for(Role role: roleDtoList) {
				roleList.add(new RoleVO(role, false));
			}
			
			RoleListVO.roleList = roleList;
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}




}