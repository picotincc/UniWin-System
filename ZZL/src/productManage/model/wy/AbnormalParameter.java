package productManage.model.wy;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author wangye
 * @date 创建时间2016-02-29
 */

@Entity
@Table(name="abnormalParameter")

public class AbnormalParameter {
	@Id
	private int abnormalParameterID;
	
	private String abParaName;
	
	private float abParaValue;//参数值上限
	
	public AbnormalParameter(int paraId,String paraName,float paraMax){
		this.abnormalParameterID = paraId;
		this.abParaName = paraName;
		this.abParaValue = paraMax;
	}
	
	public AbnormalParameter(){}

	public int getAbnormalParameterID() {
		return abnormalParameterID;
	}

	public void setAbnormalParameterID(int abnormalParameterID) {
		this.abnormalParameterID = abnormalParameterID;
	}

	public String getAbParaName() {
		return abParaName;
	}

	public void setAbParaName(String abParaName) {
		this.abParaName = abParaName;
	}

	public float getAbParaValue() {
		return abParaValue;
	}

	public void setAbParaValue(float abParaValue) {
		this.abParaValue = abParaValue;
	}
}
