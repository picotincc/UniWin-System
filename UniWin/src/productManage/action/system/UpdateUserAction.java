package productManage.action.system;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.model.User;
import productManage.model.wy.Department;
import productManage.service.system.DepartmentService;
import productManage.service.system.UserService;

public class UpdateUserAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	private List<User> userList;

	
	public UserService getUserService() {
		return userService;
	}


	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<User> getUserList() {
		return userList;
	}


	public void setUserList(List<User> userList) {
		this.userList = userList;
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
			int departmentID = Integer.parseInt(request.getParameter("departmentID"));
			
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
			
			userList = userService.findAll();
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
}