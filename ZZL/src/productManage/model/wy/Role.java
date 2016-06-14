package productManage.model.wy;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author wangye
 * @date 创建时间2016-02-28
 */

@Entity
@Table(name="role")

public class Role {
	@Id
	private int roleID;
	
	private String roleName;
	
	private String roleDescription;
	
	public Role(int ri,String rn,String rd){
		roleID = ri;
		roleName = rn;
		roleDescription = rd;
	}
	
	public Role(){}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDescription() {
		return roleDescription;
	}

	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}
}
