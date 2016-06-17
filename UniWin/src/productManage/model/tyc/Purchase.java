package productManage.model.tyc;


import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import productManage.model.User;
import productManage.model.lhj.Vendor;
import productManage.model.wjx.MaterialInput;
import productManage.model.zky.Production;


@Entity
@Table(name="purchase")

public class Purchase {
	
	@Id
	private int purchaseID;//采购单ID
	
	@ManyToMany(targetEntity = Vendor.class, fetch = FetchType.EAGER)  
	@JoinTable(name = "purchasevendor",inverseJoinColumns = @JoinColumn(name = "vendorId",referencedColumnName="vendorId"),joinColumns = @JoinColumn(name = "purchaseID"))  
	private Set<Vendor> vendors = new HashSet<Vendor>();
	
	@ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
	@JoinColumn(name="userId")
	private User user;//负责人，多对一
	
	public Set<Vendor> getVendors() {
		return vendors;
	}

	public void setVendors(Set<Vendor> vendors) {
		this.vendors = vendors;
	}

	@ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
	@JoinColumn(name="productionID")
	private Production production;//生产单，多对一
	
	@OneToMany(mappedBy="purchase",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    private Set<MaterialInput> materialInputs=new HashSet<MaterialInput>();
	
	public Production getProduction() {
		return production;
	}

	public void setProduction(Production production) {
		this.production = production;
	}

	private String purchaseCode;//采购单编号
	
	private Date ETA;//预计到达时间
	
	private Date ScheduledPurchaseDate;//计划采购时间
	
	private Date purDocumentedDate;//制单日期
	
	private String purchaseComment;//备注
	
	private String purchaseState;//采购状态
	
	private String purchaseType;//采购单类型
	
	private Timestamp financeCheckTime;//财务对账时间
	
	private Timestamp materialCheckTime;//物料核对时间
	
	private Timestamp materialExamineTime;//用料审核时间
	
	private Timestamp warehouseExamineTime;//库存审核时间
	
	private Timestamp phoneOrderTime;//电话订购时间
	
	private Timestamp faxTime;//传码单时间
	
	public Timestamp getFinanceCheckTime() {
		return financeCheckTime;
	}

	public void setFinanceCheckTime(Timestamp financeCheckTime) {
		this.financeCheckTime = financeCheckTime;
	}

	public Timestamp getMaterialCheckTime() {
		return materialCheckTime;
	}

	public void setMaterialCheckTime(Timestamp materialCheckTime) {
		this.materialCheckTime = materialCheckTime;
	}

	public Timestamp getMaterialExamineTime() {
		return materialExamineTime;
	}

	public void setMaterialExamineTime(Timestamp materialExamineTime) {
		this.materialExamineTime = materialExamineTime;
	}

	public Timestamp getWarehouseExamineTime() {
		return warehouseExamineTime;
	}

	public void setWarehouseExamineTime(Timestamp warehouseExamineTime) {
		this.warehouseExamineTime = warehouseExamineTime;
	}

	public Timestamp getPhoneOrderTime() {
		return phoneOrderTime;
	}

	public void setPhoneOrderTime(Timestamp phoneOrderTime) {
		this.phoneOrderTime = phoneOrderTime;
	}

	public Timestamp getFaxTime() {
		return faxTime;
	}

	public void setFaxTime(Timestamp faxTime) {
		this.faxTime = faxTime;
	}

	

	public int getPurchaseID() {
		return purchaseID;
	}

	public void setPurchaseID(int purchaseID) {
		this.purchaseID = purchaseID;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPurchaseCode() {
		return purchaseCode;
	}

	public void setPurchaseCode(String purchaseCode) {
		this.purchaseCode = purchaseCode;
	}

	public Date getETA() {
		return ETA;
	}

	public void setETA(Date eTA) {
		ETA = eTA;
	}

	public Date getScheduledPurchaseDate() {
		return ScheduledPurchaseDate;
	}

	public void setScheduledPurchaseDate(Date scheduledPurchaseDate) {
		ScheduledPurchaseDate = scheduledPurchaseDate;
	}

	public Date getPurDocumentedDate() {
		return purDocumentedDate;
	}

	public void setPurDocumentedDate(Date purDocumentedDate) {
		this.purDocumentedDate = purDocumentedDate;
	}

	public String getPurchaseComment() {
		return purchaseComment;
	}

	public void setPurchaseComment(String purchaseComment) {
		this.purchaseComment = purchaseComment;
	}

	public String getPurchaseState() {
		return purchaseState;
	}

	public void setPurchaseState(String purchaseState) {
		this.purchaseState = purchaseState;
	}

    public Set<MaterialInput> getMaterialInputs() {
        return materialInputs;
    }

    public void setMaterialInputs(Set<MaterialInput> materialInputs) {
        this.materialInputs = materialInputs;
    }

	public String getPurchaseType() {
		return purchaseType;
	}

	public void setPurchaseType(String purchaseType) {
		this.purchaseType = purchaseType;
	}
	
	
}
