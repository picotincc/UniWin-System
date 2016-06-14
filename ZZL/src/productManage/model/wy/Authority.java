package productManage.model.wy;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author wangye
 * @date 创建时间2016-02-28
 */

@Entity
@Table(name="authority")

public class Authority {
	@Id
	private int authorityID;
	
	private String middleAuthName;
	
	private String highAuthName;
	
	private String lowAuthName;
	
	private String authDescription;
	
	private int authorityEnabled;
	
	public Authority(){}

	public Authority(int authorityID, String middleAuthName,
			String highAuthName, String lowAuthName, String authDescription,
			int authorityEnabled) {
		super();
		this.authorityID = authorityID;
		this.middleAuthName = middleAuthName;
		this.highAuthName = highAuthName;
		this.lowAuthName = lowAuthName;
		this.authDescription = authDescription;
		this.authorityEnabled = authorityEnabled;
	}

	public String getMiddleAuthName() {
		return middleAuthName;
	}

	public void setMiddleAuthName(String middleAuthName) {
		this.middleAuthName = middleAuthName;
	}

	public String getHighAuthName() {
		return highAuthName;
	}

	public void setHighAuthName(String highAuthName) {
		this.highAuthName = highAuthName;
	}

	public int getAuthorityID() {
		return authorityID;
	}

	public void setAuthorityID(int authorityID) {
		this.authorityID = authorityID;
	}

	public String getLowAuthName() {
		return lowAuthName;
	}

	public void setLowAuthName(String lowAuthName) {
		this.lowAuthName = lowAuthName;
	}

	public String getAuthDescription() {
		return authDescription;
	}

	public void setAuthDescription(String authDescription) {
		this.authDescription = authDescription;
	}

	public int getAuthorityEnabled() {
		return authorityEnabled;
	}

	public void setAuthorityEnabled(int authorityEnabled) {
		this.authorityEnabled = authorityEnabled;
	}
	
}
