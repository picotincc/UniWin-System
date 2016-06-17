package productManage.model.yrd;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author yrd
 * @date 创建时间2016-02-28
 */

@Entity
@Table(name="phasescondition")                  //环节积压订单数表  

public class PhaseCondition {
	
	@Id
	private int phasesConditionID;
	
	private String phaseName;
	
	private Date phasesConditionDate;
	
	private int phasesConditionVol;
	
	public void setPhasesConditionID(int phasesConditionID){
		this.phasesConditionID = phasesConditionID;
	}
	
	public int getPhasesConditionID(){
		return this.phasesConditionID;
	}
	
	public void setPhaseName(String phaseName){
		this.phaseName = phaseName;
	}
	
	public String getPhaseName(){
		return this.phaseName;
	}
	
	public void setPhasesConditionDate(Date phasesConditionDate){
		this.phasesConditionDate = phasesConditionDate;
	}
	
	public Date getPhasesConditionDate(){
		return this.phasesConditionDate;
	}
	
	public void setPhasesConditionVol(int phasesConditionVol){
		this.phasesConditionVol = phasesConditionVol;
	}
	
	public int getPhasesConditionVol(){
		return this.phasesConditionVol;
	}
	

}
