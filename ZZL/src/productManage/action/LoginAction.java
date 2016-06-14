package productManage.action;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.model.User;
import productManage.model.wy.Authority;
import productManage.service.system.AuthorityService;
import productManage.service.system.UserService;

public class LoginAction extends BaseAction{
	@Autowired
	private UserService userService;
	@Autowired
	private AuthorityService authorityService;
	
	public String login(){
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		boolean loginResult = userService.login(account, password);
		if (loginResult){
			List<Authority>authoList = userService.myAuthorities(account);
			request.getSession().setAttribute("account", account);
			request.getSession().setAttribute("highAutho", authorityService.high(authoList));
			request.getSession().setAttribute("highMiddleAutho", authorityService.highMiddle(authoList));
			request.getSession().setAttribute("authorityList", authoList);
			try {
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return SUCCESS;
		}
		else 
			return ERROR;
	}
	
	public String logout(){
		request.getSession().removeAttribute("account");
		request.getSession().removeAttribute("highAutho");
		request.getSession().removeAttribute("authorityList");
		try {
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
		
	}
	
	public boolean isOnline(){
		if (request.getSession().getAttribute("account")!=null)
			return true;
		else
			return false;
	}
	
}
