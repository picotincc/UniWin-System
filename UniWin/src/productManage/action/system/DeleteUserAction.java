package productManage.action.system;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.mapping.Map;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;

import productManage.action.BaseAction;
import productManage.model.User;
import productManage.service.system.UserService;

public class DeleteUserAction extends BaseAction{

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
	
	public String delete(){
		if (request.getSession().getAttribute("account")!=null){
			String userId = request.getParameter("select");
			
			User newUser = userService.findById(userId);
			
			newUser.setDepartmentID(-1);
			
			userService.update(newUser);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}
		
	}


	
}