package productManage.model.zky;

import java.io.Serializable;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import productManage.model.cs.OutSource;
import productManage.model.szl.Supplement;
import productManage.model.tyc.Purchase;
import productManage.model.wcy.Qc;
import productManage.model.yk.Orders;

/**
 * 生产单表
 * @author 克崽兽EX 
 */
@Entity
@Table(name = "production")
public class Production implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	private int productionID;

	@Column(name = "productionCode")
	private String productionCode;

	@Column(name = "productionState")
	private String productionState;

	@Column(name = "productionProgress")
	private String productionProgress;
	
	@OneToMany(mappedBy="production",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<Tailor> tailors=new HashSet<Tailor>();
	@OneToMany(mappedBy="production",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<OutSource> outsources=new HashSet<OutSource>();
	@OneToMany(mappedBy="production",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<Orders> orders=new HashSet<Orders>();
	@OneToMany(mappedBy="production",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<Qc> qcs=new HashSet<Qc>();
	//生产单采购单多对一  tyc
	@OneToMany(mappedBy="production",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<Purchase> purchase=new HashSet<Purchase>();
//	//补料单 szl
//	@OneToMany(mappedBy="production",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
//	private Set<Supplement> supplements=new HashSet<Supplement>();
	
	@Column(name = "pOutsourceTime")
	private Timestamp pOutsourceTime;
	
	@Column(name = "pPartReceiveTime")
	private Timestamp pPartReceiveTime;
	
	@Column(name = "pReceiveTime")
	private Timestamp pReceiveTime;
	
	@Column(name = "pQCTime")
	private Timestamp pQCTime;
	
	@Column(name = "pFinishQCTime")
	private Timestamp pFinishQCTime;
	
	@Column(name = "pProcessTime")
	private Timestamp pProcessTime;
	/**
	*	进度时间
	*/
	@Transient
	private Timestamp progressTime;

	public Production() {
	}


	public Production(int productionID, String productionCode, String productionState, String productionProgress,
			Set<Tailor> tailors, Set<OutSource> outsources, Set<Orders> orders, Set<Qc> qcs, Set<Purchase> purchase,
			Timestamp pOutsourceTime, Timestamp pPartReceiveTime, Timestamp pReceiveTime, Timestamp pQCTime,
			Timestamp pFinishQCTime, Timestamp pProcessTime) {
		super();
		this.productionID = productionID;
		this.productionCode = productionCode;
		this.productionState = productionState;
		this.productionProgress = productionProgress;
		this.tailors = tailors;
		this.outsources = outsources;
		this.orders = orders;
		this.qcs = qcs;
		this.purchase = purchase;
		this.pOutsourceTime = pOutsourceTime;
		this.pPartReceiveTime = pPartReceiveTime;
		this.pReceiveTime = pReceiveTime;
		this.pQCTime = pQCTime;
		this.pFinishQCTime = pFinishQCTime;
		this.pProcessTime = pProcessTime;
	}









	/**
	 * 
	 * @return 生产单ID
	 */
	public int getProductionID() {
		return productionID;
	}

	public void setProductionID(int productionID) {
		this.productionID = productionID;
	}

	/**
	 * 
	 * @return 生产单编码
	 */
	public String getProductionCode() {
		return productionCode;
	}

	public void setProductionCode(String productionCode) {
		this.productionCode = productionCode;
	}

	/**
	 * 
	 * @return 排单状态
	 */
	public String getProductionState() {
		return productionState;
	}

	public void setProductionState(String productionState) {
		this.productionState = productionState;
	}

	/**
	 * 
	 * @return 进度
	 */
	public String getProductionProgress() {
		return productionProgress;
	}

	public void setProductionProgress(String productionProgress) {
		this.productionProgress = productionProgress;
	}
	/**
	 * 
	 * @return 裁剪单列表
	 */
	public Set<Tailor> getTailors() {
		return tailors;
	}

	public void setTailors(Set<Tailor> tailors) {
		this.tailors = tailors;
	}
	/**
	 * 注意：按照现阶段设计，订单仍与生产单位1对1关系
	 * @return 订单列表
	 */
	public Set<Orders> getOrders() {
		return orders;
	}

	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
	/**
	 * 
	 * @return 外发单列表
	 */
	public Set<OutSource> getOutsources() {
		return outsources;
	}

	public void setOutsources(Set<OutSource> outsources) {
		this.outsources = outsources;
	}
	/**
	 * 
	 * @return QC质检单列表
	 */
	public Set<Qc> getQcs() {
		return qcs;
	}

	public void setQcs(Set<Qc> qcs) {
		this.qcs = qcs;
	}
	/**
	 * 
	 * @return 采购单 tyc
	 */
	public Set<Purchase> getPurchase() {
		return purchase;
	}

	public void setPurchase(Set<Purchase> purchase) {
		this.purchase = purchase;
	}
	/**
	 * 
	 * @return 进度之外发时间
	 */
	public Timestamp getpOutsourceTime() {
		return pOutsourceTime;
	}

	public void setpOutsourceTime(Timestamp pOutsourceTime) {
		this.pOutsourceTime = pOutsourceTime;
	}
	/**
	 * 
	 * @return 进度之部分收货时间
	 */
	public Timestamp getpPartReceiveTime() {
		return pPartReceiveTime;
	}

	public void setpPartReceiveTime(Timestamp pPartReceiveTime) {
		this.pPartReceiveTime = pPartReceiveTime;
	}
	/**
	 * 
	 * @return 进度之收货时间
	 */
	public Timestamp getpReceiveTime() {
		return pReceiveTime;
	}

	public void setpReceiveTime(Timestamp pReceiveTime) {
		this.pReceiveTime = pReceiveTime;
	}
	/**
	 * 
	 * @return 进度之待质检时间
	 */
	public Timestamp getpQCTime() {
		return pQCTime;
	}

	public void setpQCTime(Timestamp pQCTime) {
		this.pQCTime = pQCTime;
	}
	/**
	 * 
	 * @return 进度之完成质检时间
	 */
	public Timestamp getpFinishQCTime() {
		return pFinishQCTime;
	}

	public void setpFinishQCTime(Timestamp pFinishQCTime) {
		this.pFinishQCTime = pFinishQCTime;
	}

	/**
	 * 
	 * @return 进度之裁剪/工艺开始时间
	 */
	public Timestamp getpProcessTime() {
		return pProcessTime;
	}


	public void setpProcessTime(Timestamp pProcessTime) {
		this.pProcessTime = pProcessTime;
	}


	public Timestamp getProgressTime() {
		Double ost=pOutsourceTime==null?0.0:pOutsourceTime.getTime();
		Double prt=pPartReceiveTime==null?0.0:pPartReceiveTime.getTime();
		Double rt=pReceiveTime==null?0.0:pReceiveTime.getTime();
		Double qct=pQCTime==null?0.0:pQCTime.getTime();
		Double fqct=pFinishQCTime==null?0.0:pFinishQCTime.getTime();
		Double pt=pProcessTime==null?0.0:pProcessTime.getTime();
		long source=(long) Math.max(Math.max(Math.max(Math.max(Math.max(ost, prt),rt),qct),fqct),pt);
		return new Timestamp(source);
	}

//
//	public Set<Supplement> getSupplements() {
//		return supplements;
//	}
//
//
//	public void setSupplements(Set<Supplement> supplements) {
//		this.supplements = supplements;
//	}
//	
	
}
