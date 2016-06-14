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
@Table(name="techniquecondition")                      //工艺单积压数表

public class TechniqueCondition {
	public TechniqueCondition() {
		
	}
	
	@Id
	private int techConditionID;
	
	private Date techConditionDate;
	
	private int techConditionVol;
	
	public void setTechConditionID(int techConditionID){
		this.techConditionID = techConditionID;
	}
	
	public int getTechConditionID(){
		return this.techConditionID;
	}
	
	public void setTechConditionDate(Date techConditionDate){
		this.techConditionDate = techConditionDate;
	}
	
	public Date getTechConditionDate(){
		return this.techConditionDate;
	}
	
	public void setTechConditionVol(int techConditionVol){
		this.techConditionVol = techConditionVol;
	}
	
	public int getTechConditionVol(){
		return this.techConditionVol;
	}


}
