package productManage.model.cs;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import productManage.model.User;
import productManage.model.tms.Design;
import productManage.model.tms.Technique;
import productManage.model.tz.TechniquePhase;
import productManage.model.zky.Production;

@Entity
@Table(name="outsource")

public class OutSource {
	
	@Id
	private int outsourceID;
	
	private String outsourceCode;
	
	private Date finishDate;
	
	private Date osScheduleDate;
	
	private String outsourceState;
	
	private float labourCost;
	
	private Date actualOutDate;
	
	private Date referenceOutDate;
	
	/**
     * 外发负责人外键关联
     */
	@ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
	@JoinColumn(name="userId")
	private User user;
	
	/**
     * 款式表外键关联
     */
	@ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
	@JoinColumn(name="designID")
	private Design design;
	
	/**
     * 生产单外键关联
     */
	@ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
	@JoinColumn(name="productionID")
	private Production production;
	
	/**
     * 加工方外键关联
     */
	@ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
	@JoinColumn(name="processorID")
	private Processor processor;
	
	/**
     * 外发单详细信息的集合
     */
	@OneToMany(mappedBy="outsource", cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, fetch=FetchType.EAGER)
	@OrderBy(value="outsourceDetailID")
	private Set<OutSourceDetail> outSourceDetails = new HashSet<OutSourceDetail>();
	
	/**
     * 收货单详细信息的集合
     */
	@OneToMany(mappedBy="r_outsource", cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, fetch=FetchType.EAGER)
	@OrderBy(value="receiveID")
	private Set<Receive> receives = new HashSet<Receive>();

	@OneToOne(mappedBy="outSource",targetEntity=TechniquePhase.class)
	private TechniquePhase techniquePhase;

	public int getOutsourceID() {
		return outsourceID;
	}

	public void setOutsourceID(int outsourceID) {
		this.outsourceID = outsourceID;
	}

	public String getOutsourceCode() {
		return outsourceCode;
	}

	public void setOutsourceCode(String outsourceCode) {
		this.outsourceCode = outsourceCode;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public Date getOsScheduleDate() {
		return osScheduleDate;
	}

	public void setOsScheduleDate(Date osScheduleDate) {
		this.osScheduleDate = osScheduleDate;
	}

	public String getOutsourceState() {
		return outsourceState;
	}

	public void setOutsourceState(String outsourceState) {
		this.outsourceState = outsourceState;
	}

	public float getLabourCost() {
		return labourCost;
	}

	public void setLabourCost(float labourCost) {
		this.labourCost = labourCost;
	}

	public Date getActualOutDate() {
		return actualOutDate;
	}

	public void setActualOutDate(Date actualOutDate) {
		this.actualOutDate = actualOutDate;
	}

	public Date getReferenceOutDate() {
		return referenceOutDate;
	}

	public void setReferenceOutDate(Date referenceOutDate) {
		this.referenceOutDate = referenceOutDate;
	}
	
	public Processor getProcessor() {
		return processor;
	}
	
	public void setProcessor(Processor processor) {
		this.processor = processor;
	}

	public Production getProduction() {
		return production;
	}

	public void setProduction(Production production) {
		this.production = production;
	}

	public Design getDesign() {
		return design;
	}

	public void setDesign(Design design) {
		this.design = design;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<OutSourceDetail> getOutSourceDetails() {
		return outSourceDetails;
	}

	public void setOutSourceDetails(Set<OutSourceDetail> outSourceDetails) {
		this.outSourceDetails = outSourceDetails;
	}
	
	public void addOutSourceDetail(OutSourceDetail os){
		if(! this.outSourceDetails.contains(os)){
			this.outSourceDetails.add(os);
			os.setOutsource(this);
		}
	}

	public void removeOutSourceDetail(OutSourceDetail os){
		os.setOutsource(null);;
		this.outSourceDetails.remove(os);
	}

	public Set<Receive> getReceives() {
		return receives;
	}

	public void setReceives(Set<Receive> receives) {
		this.receives = receives;
	}
	
	public void addReceive(Receive r){
		if(! this.receives.contains(r)){
			this.receives.add(r);
			r.setR_outsource(this);
		}
	}

	public void removeReceive(Receive r){
		r.setR_outsource(null);;
		this.receives.remove(r);
	}

	public TechniquePhase getTechniquePhase() {
		return techniquePhase;
	}

	public void setTechniquePhase(TechniquePhase techniquePhase) {
		this.techniquePhase = techniquePhase;
	}

	
	

}
