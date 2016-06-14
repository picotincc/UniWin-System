package productManage.model.wy;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author wangye
 * @date 创建时间2016-02-29
 */

@Entity
@Table(name="department")

public class Department {
	@Id
	private int departmentID;
	
	private String departmentFullName;//部门名全称
	
	private String departmentEnName;//部门英文名
	
	private String departmentAbbrName;//部门名简称
	
	private String departmentPhone;
	
	private String departmentDescription;

	public Department(int deptID,String deptFullName,String deptEngName,
			String deptShortName,String deptPhone,String deptDescription){
		this.departmentID = deptID;
		this.departmentFullName = deptFullName;
		this.departmentEnName = deptEngName;
		this.departmentAbbrName = deptShortName;
		this.departmentPhone = deptPhone;
		this.departmentDescription = deptDescription;
	}
	
	public Department(){}
	
	public int getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(int departmentID) {
		this.departmentID = departmentID;
	}

	public String getDepartmentFullName() {
		return departmentFullName;
	}

	public void setDepartmentFullName(String departmentFullName) {
		this.departmentFullName = departmentFullName;
	}

	public String getDepartmentAbbrName() {
		return departmentAbbrName;
	}

	public void setDepartmentAbbrName(String departmentAbbrName) {
		this.departmentAbbrName = departmentAbbrName;
	}

	public String getDepartmentEnName() {
		return departmentEnName;
	}

	public void setDepartmentEnName(String departmentEnName) {
		this.departmentEnName = departmentEnName;
	}

	public String getDepartmentPhone() {
		return departmentPhone;
	}

	public void setDepartmentPhone(String departmentPhone) {
		this.departmentPhone = departmentPhone;
	}

	public String getDepartmentDescription() {
		return departmentDescription;
	}

	public void setDepartmentDescription(String departmentDescription) {
		this.departmentDescription = departmentDescription;
	}
}
