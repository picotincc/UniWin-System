package productManage.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import productManage.model.cs.OutSource;
import productManage.model.cs.Receive;
import productManage.model.lhj.Materialapply;
import productManage.model.szl.Supplement;
import productManage.model.tms.Technique;
import productManage.model.tyc.Purchase;
import productManage.model.wcy.Qc;
import productManage.model.wjx.MaterialInput;
import productManage.model.wjx.MaterialOutput;
import productManage.model.yk.Orders;
import productManage.model.zky.Tailor;

/**
 * @author wangye
 * @date 创建时间2016-02-29
 */

@Entity
@Table(name="user")

public class User implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	private int userId;
	
	private int departmentID;
	
	private String userAccount;
	
	private String userName;
	
	private String userPassword;
	
	private String userAddr;
	
	private String userMobileNum;
	
	private String userEMail;
	
	private String userWeChatNum;//微信号
	
	private String userComName;
	
	private String userComment;//备注
	
	
	/**
	 * 负责制版的裁剪单集合
	 */
	@OneToMany(mappedBy="tailormodelmaker",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<Tailor> modelMadeTailors=new HashSet<Tailor>();
	/**
	 * 负责裁剪的裁剪单集合
	 */
	@OneToMany(mappedBy="tailor",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<Tailor> tailedTailors=new HashSet<Tailor>();
	/**
	 * 入库单的集合
	 */
	@OneToMany(mappedBy="user",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    private Set<MaterialInput> materialInputs=new HashSet<MaterialInput>();
	
	/**
     * 出库单的集合
     */
    @OneToMany(mappedBy="user",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    private Set<MaterialOutput> materialOutputs=new HashSet<MaterialOutput>();
	
    /**
     * 物料申请单的集合 
     */
    @OneToMany(mappedBy="user",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    private Set<Materialapply> materialapplys=new HashSet<Materialapply>();
    /**
     * 质检单的集合 
     */
    @OneToMany(mappedBy="user",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    private Set<Qc> qcs=new HashSet<Qc>();
    
    /**
     * (订单负责人)客户订单的集合 
     */
    @OneToMany(mappedBy="charge",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    private Set<Orders> ordersCharge=new HashSet<Orders>();
    
    /**
     * (订单负责人)客户订单的集合 
     */
    @OneToMany(mappedBy="orderMaker",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    private Set<Orders> ordersMaker=new HashSet<Orders>();
    
  //生产单采购单多对一  tyc
  	@OneToMany(mappedBy="user",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
  	private Set<Purchase> purchase=new HashSet<Purchase>();


    /**
     * 外发单的集合 --by cs
     */
    @OneToMany(mappedBy="user",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    private Set<OutSource> outsources=new HashSet<OutSource>();
    
    /**
     * 收货单的集合 --by cs
     */
    @OneToMany(mappedBy="user",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    private Set<Receive> receives=new HashSet<Receive>();
    
	/**
	 * 款式工艺表的集合 --by tms
	 */
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private Set<Technique> techniques = new HashSet<Technique>();
    
	/**
	 * 补料单的 集合--by szl
	 */
	 @OneToMany(mappedBy="user",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	 private Set<Supplement> supplements = new HashSet<Supplement>();
	
	public User(){}
	
	public User(int userId, int departmentID, String userAccount,
			String userName, String userPassword, String userAddr,
			String userMobileNum, String userEMail, String userWeChatNum,
			String userComName, String userComment,
			Set<Tailor> modelMadeTailors, Set<Tailor> tailedTailors,
			Set<MaterialInput> materialInputs,
			Set<MaterialOutput> materialOutputs,
			Set<Materialapply> materialapplys, Set<Qc> qcs,
			Set<Orders> ordersCharge, Set<Orders> ordersMaker,
			Set<Purchase> purchase, Set<OutSource> outsources,
			Set<Receive> receives, Set<Technique> techniques,
			Set<Supplement> supplements) {
		super();
		this.userId = userId;
		this.departmentID = departmentID;
		this.userAccount = userAccount;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userAddr = userAddr;
		this.userMobileNum = userMobileNum;
		this.userEMail = userEMail;
		this.userWeChatNum = userWeChatNum;
		this.userComName = userComName;
		this.userComment = userComment;
		this.modelMadeTailors = modelMadeTailors;
		this.tailedTailors = tailedTailors;
		this.materialInputs = materialInputs;
		this.materialOutputs = materialOutputs;
		this.materialapplys = materialapplys;
		this.qcs = qcs;
		this.ordersCharge = ordersCharge;
		this.ordersMaker = ordersMaker;
		this.purchase = purchase;
		this.outsources = outsources;
		this.receives = receives;
		this.techniques = techniques;
		this.supplements = supplements;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getUserMobileNum() {
		return userMobileNum;
	}

	public void setUserMobileNum(String userMobileNum) {
		this.userMobileNum = userMobileNum;
	}

	public String getUserEMail() {
		return userEMail;
	}

	public void setUserEMail(String userEMail) {
		this.userEMail = userEMail;
	}

	public String getUserWeChatNum() {
		return userWeChatNum;
	}

	public void setUserWeChatNum(String userWeChatNum) {
		this.userWeChatNum = userWeChatNum;
	}

	public String getUserComName() {
		return userComName;
	}

	public void setUserComName(String userComName) {
		this.userComName = userComName;
	}

	public String getUserComment() {
		return userComment;
	}

	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}

	public int getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(int departmentID) {
		this.departmentID = departmentID;
	}
	/**
	 * 
	 * @return 负责制版的裁剪单集合
	 */
	public Set<Tailor> getModelMadeTailors() {
		return modelMadeTailors;
	}

	public void setModelMadeTailors(Set<Tailor> modelMadeTailors) {
		this.modelMadeTailors = modelMadeTailors;
	}
	/**
	 * 
	 * @return 负责裁剪的裁剪单集合
	 */
	public Set<Tailor> getTailedTailors() {
		return tailedTailors;
	}

	public void setTailedTailors(Set<Tailor> tailedTailors) {
		this.tailedTailors = tailedTailors;
	}

    public Set<MaterialInput> getMaterialInputs() {
        return materialInputs;
    }

    public void setMaterialInputs(Set<MaterialInput> materialInputs) {
        this.materialInputs = materialInputs;
    }

    public Set<MaterialOutput> getMaterialOutputs() {
        return materialOutputs;
    }

    public void setMaterialOutputs(Set<MaterialOutput> materialOutputs) {
        this.materialOutputs = materialOutputs;
    }
	
    //物料申请单集合-LHJ
	public Set<Materialapply> getMaterialapplys() {
		return materialapplys;
	}

	public void setMaterialapplys(Set<Materialapply> materialapplys) {
		this.materialapplys = materialapplys;
	}
	
	/**
	 * 
	 * @return 质检单集合
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
	 * @return (负责人的)客户订单
	 */

	public Set<Orders> getOrdersCharge() {
		return ordersCharge;
	}
	
	public void setOrdersCharge(Set<Orders> ordersCharge) {
		this.ordersCharge = ordersCharge;
	}
	
	/**
	 * 
	 * @return (制单人的)客户订单
	 */
	
	public Set<Orders> getOrdersMaker() {
		return ordersMaker;
	}
	
	public void setOrdersMaker(Set<Orders> ordersMaker) {
		this.ordersMaker = ordersMaker;
	}
	
	/** 
	 * @return 外发单 cs
	 */
	public Set<OutSource> getOutsources() {
		return outsources;
	}
	
	public void setOutsources(Set<OutSource> outsources) {
		this.outsources = outsources;
	}
	
	/** 
	 * @return 收货单 cs
	 */
	public Set<Receive> getReceives() {
		return receives;
	}
	
	public void setReceives(Set<Receive> receives) {
		this.receives = receives;
	}
	
	/** 
	 * @return 款式工艺单 tms
	 */
    public Set<Technique> getTechniques() {
		return techniques;
	}
	public void setTechniques(Set<Technique> techniques) {
		this.techniques = techniques;
	}
	public Set<Supplement> getSupplements() {
		return supplements;
	}
	public void setSupplements(Set<Supplement> supplements) {
		this.supplements = supplements;
	}
	
}
