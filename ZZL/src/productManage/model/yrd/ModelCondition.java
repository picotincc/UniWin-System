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
@Table(name="modelcondition")                  //制版单积压数表 

public class ModelCondition {
	
	@Id
	private int modelConditionID;
	
	private Date modelConditionDate;
	
	private int modelConditionVol;
	
	public void setModelConditionID(int modelConditionID){
		this.modelConditionID = modelConditionID;
	}
	
	public int getModelConditionID(){
		return this.modelConditionID;
	}
	
	public void setModelConditionDate(Date modelConditionDate){
		this.modelConditionDate = modelConditionDate;
	}
	
	public Date getModelConditionDate(){
		return this.modelConditionDate;
	}
	
	public void setModelConditionVol(int modelConditionVol){
		this.modelConditionVol = modelConditionVol;
	}
	
	public int getModelConditionVol(){
		return this.modelConditionVol;
	}

}
