package productManage.model.wy;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author wangye
 * @date 创建时间2016-02-29
 */

@Entity
@Table(name="module")

public class Module {
	@Id
	private int moduleID;
	
	private String middleModuleName;
	
	private String highModuleName;
	
	private String lowModuleName;
	
	private int moduleNum;//排列序号
	
	private String moduleRoute;//路径
	
	private String moduleOwnCode;//自编码
	
	private boolean moduleEnabled;//是否启用
	
	private String moduleSpecification;//程式说明
	
	public Module(int moduleId,String midModuleName,String highModuleName,
			String lowModuleName,int moduleNum,String moduleRoute,
			String moduleOwnCode,boolean moduleEnabled,String moduleSpecification){
		this.moduleID = moduleId;
		this.middleModuleName = midModuleName;
		this.highModuleName = highModuleName;
		this.lowModuleName = lowModuleName;
		this.moduleNum = moduleNum;
		this.moduleRoute = moduleRoute;
		this.moduleOwnCode = moduleOwnCode;
		this.moduleEnabled = moduleEnabled;
		this.moduleSpecification = moduleSpecification;
	}
	
	public Module(){}

	public int getModuleID() {
		return moduleID;
	}

	public void setModuleID(int moduleID) {
		this.moduleID = moduleID;
	}

	public String getMiddleModuleName() {
		return middleModuleName;
	}

	public void setMiddleModuleName(String middleModuleName) {
		this.middleModuleName = middleModuleName;
	}

	public String getHighModuleName() {
		return highModuleName;
	}

	public void setHighModuleName(String highModuleName) {
		this.highModuleName = highModuleName;
	}

	public String getLowModuleName() {
		return lowModuleName;
	}

	public void setLowModuleName(String lowModuleName) {
		this.lowModuleName = lowModuleName;
	}

	public int getModuleNum() {
		return moduleNum;
	}

	public void setModuleNum(int moduleNum) {
		this.moduleNum = moduleNum;
	}

	public String getModuleRoute() {
		return moduleRoute;
	}

	public void setModuleRoute(String moduleRoute) {
		this.moduleRoute = moduleRoute;
	}

	public String getModuleOwnCode() {
		return moduleOwnCode;
	}

	public void setModuleOwnCode(String moduleOwnCode) {
		this.moduleOwnCode = moduleOwnCode;
	}

	public boolean getModuleEnabled() {
		return moduleEnabled;
	}

	public void setModuleEnabled(boolean moduleEnabled) {
		this.moduleEnabled = moduleEnabled;
	}

	public String getModuleSpecification() {
		return moduleSpecification;
	}

	public void setModuleSpecification(String moduleSpecification) {
		this.moduleSpecification = moduleSpecification;
	}
}
