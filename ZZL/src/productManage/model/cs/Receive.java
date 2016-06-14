package productManage.model.cs;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import productManage.model.User;

@Entity
@Table(name="receive")

public class Receive {
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	private int receiveID;
	
	private Date receiveDate;
	
	private String receiveType;
	
	/**
     * 外发负责人外键关联
     */
	@ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
	@JoinColumn(name="userId")
	private User user;
	
	/**
     * 加工方外键关联
     */
	@ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
	@JoinColumn(name="processorID")
	private Processor processor;
	
	/**
     * 外发单外键关联
     */
	@ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
	@JoinColumn(name="outsourceID")
	private OutSource r_outsource;
	
	/**
     * 收货单详细信息的集合
     */
	@OneToMany(mappedBy="receive", cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, fetch=FetchType.EAGER)
	@OrderBy(value="receiveDetailID")
	private Set<ReceiveDetail> receiveDetails = new HashSet<ReceiveDetail>();

	public int getReceiveID() {
		return receiveID;
	}

	public void setReceiveID(int receiveID) {
		this.receiveID = receiveID;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getReceiveType() {
		return receiveType;
	}

	public void setReceiveType(String receiveType) {
		this.receiveType = receiveType;
	}
	
	public Processor getProcessor() {
		return processor;
	}
	
	public void setProcessor(Processor processor) {
		this.processor = processor;
	}

	public Set<ReceiveDetail> getReceiveDetails() {
		return receiveDetails;
	}	

	public OutSource getR_outsource() {
		return r_outsource;
	}

	public void setR_outsource(OutSource r_outsource) {
		this.r_outsource = r_outsource;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setReceiveDetails(Set<ReceiveDetail> receiveDetails) {
		this.receiveDetails = receiveDetails;
	}
	
	public void addReceiveDetail(ReceiveDetail rd){
		if(! this.receiveDetails.contains(rd)){
			this.receiveDetails.add(rd);
			rd.setReceive(this);
		}
	}

	public void removeReceiveDetail(ReceiveDetail rd){
		rd.setReceive(null);;
		this.receiveDetails.remove(rd);
	}
	
	

}
