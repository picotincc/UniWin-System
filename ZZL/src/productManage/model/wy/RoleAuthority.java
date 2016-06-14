package productManage.model.wy;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author wangye
 * @date 创建时间2016-02-28
 */

@Entity
@Table(name="roleAuthority")

public class RoleAuthority {
	@Id
	private int roleAuthID;
	
	private int roleID;
	
	private int authorityID;
	
	public RoleAuthority(int roleAuthID,int roleID,int authorityID){
		this.roleAuthID = roleAuthID;
		this.roleID = roleID;
		this.authorityID = authorityID;
	}
	
	public RoleAuthority(){}

	public int getRoleAuthID() {
		return roleAuthID;
	}

	public void setRoleAuthID(int roleAuthID) {
		this.roleAuthID = roleAuthID;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public int getAuthorityID() {
		return authorityID;
	}

	public void setAuthorityID(int authorityID) {
		this.authorityID = authorityID;
	}
	
	
}
