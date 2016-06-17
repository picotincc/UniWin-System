package productManage.model.tz;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import productManage.model.cs.OutSource;
import productManage.model.tms.Design;

/*
 * 工艺阶段表
 * 
 * @author 唐泽
 */
@Entity
@Table(name = "techniquePhase")

public class TechniquePhase implements Serializable {
	// 编号
	@Id
	private int techPhaseID;

	// 外发单id 外键 一对一
	@OneToOne(targetEntity=OutSource.class)
	@JoinColumn(name="outsourceID",referencedColumnName="outsourceID",unique=true)
	private OutSource outSource;

	// 开始时间
	@Column(name = "techPhaseStartingTime")
	private Date techPhaseStartingTime;

	// 结束时间
	@Column(name = "techPhaseEndTime")
	private Date techPhaseEndTime;

	public TechniquePhase() {

	}

	

	public TechniquePhase(int techPhaseID, OutSource outsource, Date techPhaseStartingTime, Date techPhaseEndTime) {
		super();
		this.techPhaseID = techPhaseID;
		this.outSource = outsource;
		this.techPhaseStartingTime = techPhaseStartingTime;
		this.techPhaseEndTime = techPhaseEndTime;
	}



	public int getTechPhaseID() {
		return techPhaseID;
	}


	public Date getTechPhaseStartingTime() {
		return techPhaseStartingTime;
	}

	public OutSource getOutSource() {
		return outSource;
	}



	public void setOutSource(OutSource outSource) {
		this.outSource = outSource;
	}






	public Date getTechPhaseEndTime() {
		return techPhaseEndTime;
	}



	public void setTechPhaseEndTime(Date techPhaseEndTime) {
		this.techPhaseEndTime = techPhaseEndTime;
	}



	public void setTechPhaseID(int techPhaseID) {
		this.techPhaseID = techPhaseID;
	}



	public void setTechPhaseStartingTime(Date techPhaseStartingTime) {
		this.techPhaseStartingTime = techPhaseStartingTime;
	}
	

}
