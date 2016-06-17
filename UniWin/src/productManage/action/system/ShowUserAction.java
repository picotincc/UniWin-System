package productManage.action.system;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.action.PageAction;
import productManage.model.User;
import productManage.model.wy.Department;
import productManage.model.wy.Role;
import productManage.service.system.DepartmentService;
import productManage.service.system.UserService;
import productManage.vo.PageBean;
import productManage.vo.system.ChargeConstants;
import productManage.vo.system.UserConstants;
import productManage.vo.technique.TechniqueConstants;

public class ShowUserAction extends PageAction{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	@Autowired
	private DepartmentService departmentService;
	
	//private List<User> userList;
	private String userName;
	
	private List<UserVO> userList;
	private List<DepartmentVO> departmentList;
	
	/*
	 * user ajax json返回结果userJson
	 */
	private String userJson;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	
	public List<UserVO> getUserList() {
		return userList;
	}

	public void setUserList(List<UserVO> userList) {
		this.userList = userList;
	}
	
	public List<DepartmentVO> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<DepartmentVO> departmentList) {
		this.departmentList = departmentList;
	}
	
	public String getUserJson() {
		return userJson;
	}

	public void setUserJson(String userJson) {
		this.userJson = userJson;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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
	
	private User userItem;
	
	public User getUserItem() {
		return userItem;
	}
	public void setUserItem(User userItem) {
		this.userItem = userItem;
	}

	public String show(){
		if (request.getSession().getAttribute("account")!=null){
			//获取所有部门列表
			List<Department> initDepartmentList = departmentService.findAll();
			
			departmentList = new ArrayList<>();
			for(Department department:initDepartmentList){
				departmentList.add(new DepartmentVO(department,false));
			}
			
			PageBean pb = userService.getUserVOByPage(this.rowsPerPage, this.page);
			
			List<User> userList = pb.getList();
			
			List<UserVO> userVOList = new ArrayList();
			
			for(User user: userList) {
				int departmentId = user.getDepartmentID();
				String departmentName = departmentService.findByID(departmentId+"").getDepartmentFullName();
				
				userVOList.add(new UserVO(user, departmentName));
			}
			pb.setList(userVOList);
			
			this.pageBean = pb;
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
	
	public String getAllChargeByPageAjax(){
		try {
			this.rowsPerPage = 6;
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(ChargeConstants.SEARCH_CHARGE_PARAMS[0], this.userName);
			this.pageBean = userService.getChargeByPage(rowsPerPage, this.page,params);
			List<User> userList = pageBean.getList();
			JSONObject json = new JSONObject();
			json.put("allRow", pageBean.getAllRow());
			json.put("totalPage", pageBean.getTotalPage());
			json.put("currentPage", pageBean.getCurrentPage());
			JSONArray users = new JSONArray();
			json.put("users", users);
			for (int i = 0; i < userList.size(); i++) {
				User userX = userList.get(i);
				JSONObject user = new JSONObject();
				user.put("userId", userX.getUserId());
				user.put("userName", userX.getUserName());
				user.put("userMobileNum", userX.getUserMobileNum());
				user.put("userAddr", userX.getUserAddr());
				users.put(user);
			}
			setUserJson(json.toString());
			//System.out.println(userJson);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String search(){
		if (request.getSession().getAttribute("account")!=null){
//			String userAccount = request.getParameter("userAccount");
//			System.out.println("userAccount:" + userAccount);
//			String searchedUserName = request.getParameter("userName");
//			System.out.println("userName:" + searchedUserName);
			
			
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(UserConstants.SEARCH_USER_PARAMS[0],userAccount);
			params.put(UserConstants.SEARCH_USER_PARAMS[1], searchedUserName);
			
			PageBean pb = userService.searchUserByPage(this.rowsPerPage, this.page,params);
			
			List<User> userList = pb.getList();
			
			List<UserVO> userVOList = new ArrayList();
			
			for(User user: userList) {
				int departmentId = user.getDepartmentID();
				String departmentName = departmentService.findByID(departmentId+"").getDepartmentFullName();
				
				userVOList.add(new UserVO(user, departmentName));
			}
			
			pb.setList(userVOList);
			
			this.pageBean = pb;
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
	
	public String add(){
		if (request.getSession().getAttribute("account")!=null){
			String userAccount = request.getParameter("userAccount");
			String userName = request.getParameter("userName");
			String userPassword = request.getParameter("userPassword");
			String userAddr = request.getParameter("userAddr");
			String userMobileNum = request.getParameter("userMobileNum");
			String userEMail = request.getParameter("userEMail");
			String userWeChatNum = request.getParameter("userWeChatNum");
			String userComName = request.getParameter("userComName");
			String userComment = request.getParameter("userComment");
			int departmentID = Integer.parseInt(request.getParameter("department"));
			
			User user = new User();
			user.setUserAccount(userAccount);
			user.setUserName(userName);
			user.setUserPassword(userPassword);
			user.setUserAddr(userAddr);
			user.setUserMobileNum(userMobileNum);
			user.setUserEMail(userEMail);
			user.setUserWeChatNum(userWeChatNum);
			user.setUserComName(userComName);
			user.setUserComment(userComment);
			user.setDepartmentID(departmentID);
			
			userService.save(user);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}

	public String choose(){
		if (request.getSession().getAttribute("account")!=null){
			String UserID = request.getParameter("select");
			
			if(UserID == null || UserID.equals("")){
				return ERROR;
			}
			
			userItem = userService.findById(UserID);
			
			//获取所有部门列表
			List<Department> initDepartmentList = departmentService.findAll();
			
			departmentList = new ArrayList<>();
			for(Department department:initDepartmentList){
				boolean belongToUser = false;
				if(department.getDepartmentID() == userItem.getDepartmentID()){
					belongToUser = true;
				}
				System.out.print(belongToUser + ",");
				
				departmentList.add(new DepartmentVO(department,belongToUser));
			}
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}

	public String update(){
		if (request.getSession().getAttribute("account")!=null){
			String userId = request.getParameter("userId");
			String userAccount = request.getParameter("userAccount");
			String userName = request.getParameter("userName");
			String userPassword = request.getParameter("userPassword");
			String userAddr = request.getParameter("userAddr");
			String userMobileNum = request.getParameter("userMobileNum");
			String userEMail = request.getParameter("userEMail");
			String userWeChatNum = request.getParameter("userWeChatNum");
			String userComName = request.getParameter("userComName");
			String userComment = request.getParameter("userComment");
			int departmentID = Integer.parseInt(request.getParameter("department"));
			
			User user = userService.findById(userId);
			user.setUserAccount(userAccount);
			user.setUserName(userName);
			user.setUserPassword(userPassword);
			user.setUserAddr(userAddr);
			user.setUserMobileNum(userMobileNum);
			user.setUserEMail(userEMail);
			user.setUserWeChatNum(userWeChatNum);
			user.setUserComName(userComName);
			user.setUserComment(userComment);
			user.setDepartmentID(departmentID);

			userService.update(user);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}

	public String delete(){
		if (request.getSession().getAttribute("account")!=null){
			String userId = request.getParameter("select");
			
			User newUser = userService.findById(userId);
			
			newUser.setUserPassword("");
			
			userService.update(newUser);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
}