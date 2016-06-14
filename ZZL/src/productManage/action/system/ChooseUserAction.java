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
import productManage.model.wy.Department;
import productManage.service.system.DepartmentService;
import productManage.service.system.UserService;

public class ChooseUserAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	private User userItem;
	private List<User> userLsit;
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public User getUserItem() {
		return userItem;
	}
	public void setUserItem(User userItem) {
		this.userItem = userItem;
	}
	public List<User> getUserLsit() {
		return userLsit;
	}
	public void setUserLsit(List<User> userLsit) {
		this.userLsit = userLsit;
	}
	
	
	public String choose(){
		if (request.getSession().getAttribute("account")!=null){
			String UserID = request.getParameter("select");
			
			if(UserID == null){
				userLsit = userService.findAll();
				return ERROR;
			}
			
			userItem = userService.findById(UserID);

			return SUCCESS;
		}
		else{
			return "failed";
		}
		
	}


	
}