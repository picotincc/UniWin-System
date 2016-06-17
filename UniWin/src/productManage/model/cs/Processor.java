package productManage.model.cs;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import productManage.model.tms.Technique;

@Entity
@Table(name="processor")

public class Processor {
	
	@Id
	private int processorID;
	
	private String processorCode;
	
	private String processorName;
	
	private String processorState;
	
	private String processorInitialPassword;
	
	private String processorMobileNum;
	
	private String processorRank;
	
	private String processorAddr;
	
	private int processorWorkerNum;
	
	private String processorDistrict;
	
	private String deliveryType;
	
	private Date startingDate;
	
	private String processorComment;
	
	/**
     * 外发单的集合
     */
	@OneToMany(mappedBy="processor", cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, fetch=FetchType.LAZY)
	@OrderBy(value="outsourceID")
	private Set<OutSource> outSources = new HashSet<OutSource>();
	
	/**
     * 收货单的集合
     */
	@OneToMany(mappedBy="processor", cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, fetch=FetchType.LAZY)
	@OrderBy(value="receiveID")
	private Set<Receive> receives = new HashSet<Receive>();

	/**
     * 款式工艺单的集合
     */
	@OneToMany(mappedBy="processor", cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, fetch=FetchType.LAZY)
	@OrderBy(value="techid")
	private Set<Technique> techniques = new HashSet<Technique>();
	public int getProcessorID() {
		return processorID;
	}

	public void setProcessorID(int processorID) {
		this.processorID = processorID;
	}

	public String getProcessorCode() {
		return processorCode;
	}

	public void setProcessorCode(String processorCode) {
		this.processorCode = processorCode;
	}

	public String getProcessorName() {
		return processorName;
	}

	public void setProcessorName(String processorName) {
		this.processorName = processorName;
	}

	public String getProcessorState() {
		return processorState;
	}

	public void setProcessorState(String processorState) {
		this.processorState = processorState;
	}

	public String getProcessorInitialPassword() {
		return processorInitialPassword;
	}

	public void setProcessorInitialPassword(String processorInitialPassword) {
		this.processorInitialPassword = processorInitialPassword;
	}

	public String getProcessorMobileNum() {
		return processorMobileNum;
	}

	public void setProcessorMobileNum(String processorMobileNum) {
		this.processorMobileNum = processorMobileNum;
	}

	public String getProcessorRank() {
		return processorRank;
	}

	public void setProcessorRank(String processorRank) {
		this.processorRank = processorRank;
	}

	public String getProcessorAddr() {
		return processorAddr;
	}

	public void setProcessorAddr(String processorAddr) {
		this.processorAddr = processorAddr;
	}

	public int getProcessorWorkerNum() {
		return processorWorkerNum;
	}

	public void setProcessorWorkerNum(int processorWorkerNum) {
		this.processorWorkerNum = processorWorkerNum;
	}

	public String getProcessorDistrict() {
		return processorDistrict;
	}

	public void setProcessorDistrict(String processorDistrict) {
		this.processorDistrict = processorDistrict;
	}

	public String getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}
	
	public Date getStartingDate() {
		return startingDate;
	}

	public void setStartingDate(Date startingDate) {
		this.startingDate = startingDate;
	}

	public String getProcessorComment() {
		return processorComment;
	}

	public void setProcessorComment(String processorComment) {
		this.processorComment = processorComment;
	}

	public Set<OutSource> getOutSources() {
		return outSources;
	}
	
	public void setOutSources(Set<OutSource> outSources) {
		this.outSources = outSources;
	}
	
	public void addOutSource(OutSource os){
		if(! this.outSources.contains(os)){
			this.outSources.add(os);
			os.setProcessor(this);
		}
	}

	public void removeOutSource(OutSource os){
		os.setProcessor(null);;
		this.outSources.remove(os);
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
			r.setProcessor(this);
		}
	}

	public void removeReceive(Receive r){
		r.setProcessor(null);;
		this.receives.remove(r);
	}


}
