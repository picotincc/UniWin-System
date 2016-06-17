package productManage.model.wy;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * @author wangye
 * @date 创建时间2016-03-01
 */

@Entity
@Table(name="userRole")

public class UserRole {
	@Id
	private int userRoleID;
	
	private int userId;
	
	private int roleID;
	
	public UserRole(int userRoleID,int userId,int roleID){
		this.userRoleID = userRoleID;
		this.userId = userId;
		this.roleID = roleID;
	}
	
	public UserRole(){}

	public int getUserRoleID() {
		return userRoleID;
	}

	public void setUserRoleID(int userRoleID) {
		this.userRoleID = userRoleID;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}
}
