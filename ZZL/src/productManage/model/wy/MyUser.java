package productManage.model.wy;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author wangye
 * @date 创建时间2016-04-18
 */

@Entity
@Table(name="user")

public class MyUser {
	@Id
	private int userId;
	
	private int departmentID;
	
	private String userAccount;
	
	private String userName;
	
	private String userPassword;
	
	private String userAddr;
	
	private String userMobileNum;
	
	private String userEMail;
	
	private String userWeChatNum;//微信号
	
	private String userComName;
	
	private String userComment;//备注
	
	public MyUser(){}
	
	public MyUser(int userId, int departmentID, String userAccount,
			String userName, String userPassword, String userAddr,
			String userMobileNum, String userEMail, String userWeChatNum,
			String userComName, String userComment) {
		this.userId = userId;
		this.departmentID = departmentID;
		this.userAccount = userAccount;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userAddr = userAddr;
		this.userMobileNum = userMobileNum;
		this.userEMail = userEMail;
		this.userWeChatNum = userWeChatNum;
		this.userComName = userComName;
		this.userComment = userComment;
	}
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getUserMobileNum() {
		return userMobileNum;
	}

	public void setUserMobileNum(String userMobileNum) {
		this.userMobileNum = userMobileNum;
	}

	public String getUserEMail() {
		return userEMail;
	}

	public void setUserEMail(String userEMail) {
		this.userEMail = userEMail;
	}

	public String getUserWeChatNum() {
		return userWeChatNum;
	}

	public void setUserWeChatNum(String userWeChatNum) {
		this.userWeChatNum = userWeChatNum;
	}

	public String getUserComName() {
		return userComName;
	}

	public void setUserComName(String userComName) {
		this.userComName = userComName;
	}

	public String getUserComment() {
		return userComment;
	}

	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}

	public int getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(int departmentID) {
		this.departmentID = departmentID;
	}
}
