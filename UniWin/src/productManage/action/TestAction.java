package productManage.action;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.model.User;
import productManage.service.TestService;

//public class TestAction extends BaseAction{
//	
//    @Autowired
//    private TestService testService;
//	
//	//register
//	private String name;
//	private String password;
//	
//	public String register(){
//		
//		User user = new User();
//		user.setName(name);
//		user.setPassword(password);
//		boolean tag = testService.testRegister(user);
//		if(tag){
//			return "success";
//		}
//		return "failed";
//		
//	}
//
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	public String getPassword() {
//		return password;
//	}
//	public void setPassword(String password) {
//		this.password = password;
//	}
//	
//	
//	
//	
//
//}
