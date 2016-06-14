package productManage.model.yk;
/**
 * @author yukuai
 * @date 创建时间2016-02-27
 */

import java.sql.Date;
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

import productManage.model.User;
import productManage.model.tms.Design;
import productManage.model.yrd.Customer;
import productManage.model.zky.Production;

@Entity
@Table(name="orders")                                //客户订单表

public class Orders {
	@Id                                              //客户订单编号
	private int orderID;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = false)
	@JoinColumn(name="orderMakerId")                 //制单人ID
	private User orderMaker;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = false)
	@JoinColumn(name="customerID")                   //客户                      
	private Customer customer;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional =true)
	@JoinColumn(name="chargeId")                     //订单负责人
	private User charge;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},optional = true)
	@JoinColumn(name = "productionID")               //生产单
	private Production production;                   
	
	@OneToOne(targetEntity=Inquiry.class)
	@JoinColumn(name="inquiryID",referencedColumnName="inquiryID",unique=true)
	private Inquiry inquiry;                         //询价单
	
	@OneToOne(targetEntity=SampleOrders.class)
	@JoinColumn(name="sampleID",referencedColumnName="sampleOrderID",unique=true)
	private SampleOrders sampleOrders;               //样衣单
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = false)
	@JoinColumn(name = "designID")              
	private Design design;                           //款号
	
	@Column(name="orderCode")                        //客户订单编码
	private String orderCode;
	
	@Column(name="orderDesignatedTime")              //负责人指定日期
	private String orderDesignatedTime;
	
	@Column(name="orderDate")                        //下单日期
	private String orderDate;
	
	@Column(name="orderFinishDate")                  //要求货期
	private Date orderFinishDate;
	
	@Column(name="orderRefURL")                      //参考网址
	private String orderRefURL;
	
	@Column(name="orderSampleYardage")               //样板码数
	private String orderSampleYardage;
	
	@Column(name="orderSewnInLabelReq")              //水洗标要求
	private String orderSewnInLabelReq;
	
	@Column(name="orderTechReq")                     //工艺制作要求
	private String orderTechReq;
	
	@Column(name="orderComment")                     //其它备注
	private String orderComment;
	
	@Column(name="orderPriority")                    //订单优先级
	private String orderPriority;
	
	@Column(name="orderSource")                      //来源
	private String orderSource;
	
	@Column(name="orderDesignIsNew")                 //是否新款
	private int orderDesignIsNew;
	
	@Column(name="orderContractNum")                 //合同号
	private String orderContractNum;
	
	@Column(name="orderProcessType")                 //加工分类
	private String orderProcessType;
	
	@Column(name="orderType")                        //订单类型
	private String orderType;
	
	@Column(name="orderSpecialTech")                 //特殊工艺
	private String orderSpecialTech;
	
	@Column(name="orderShellIngredient")             //面料成分
	private String orderShellIngredient;
	
	@Column(name="orderChecked")                     //是否审核通过
	private int orderChecked;
	
	@Column(name="distributeMethod")				//配送方式
	private String distributeMethod;
	
	@OneToMany(mappedBy="order",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();    //客户订单颜色尺码信息
	
	@OneToMany(mappedBy="order",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<OrderMaterialDetail> orderMaterialDetails = new HashSet<OrderMaterialDetail>();   //客户订单物料信息 
	
	public Orders(){
		super();
	}

	public Orders(int orderID, User orderMaker, Customer customer, User charge,
			Production production, Inquiry inquiry, SampleOrders sampleOrders,
			Design design, String orderCode, String orderDesignatedTime,
			String orderDate, Date orderFinishDate, String orderRefURL,
			String orderSampleYardage, String orderSewnInLabelReq,
			String orderTechReq, String orderComment, String orderPriority,
			String orderSource, int orderDesignIsNew, String orderContractNum,
			String orderProcessType, String orderType, String orderSpecialTech,
			String orderShellIngredient, int orderChecked,
			Set<OrderDetail> orderDetails,
			Set<OrderMaterialDetail> orderMaterialDetails) {
		super();
		this.orderID = orderID;
		this.orderMaker = orderMaker;
		this.customer = customer;
		this.charge = charge;
		this.production = production;
		this.inquiry = inquiry;
		this.sampleOrders = sampleOrders;
		this.design = design;
		this.orderCode = orderCode;
		this.orderDesignatedTime = orderDesignatedTime;
		this.orderDate = orderDate;
		this.orderFinishDate = orderFinishDate;
		this.orderRefURL = orderRefURL;
		this.orderSampleYardage = orderSampleYardage;
		this.orderSewnInLabelReq = orderSewnInLabelReq;
		this.orderTechReq = orderTechReq;
		this.orderComment = orderComment;
		this.orderPriority = orderPriority;
		this.orderSource = orderSource;
		this.orderDesignIsNew = orderDesignIsNew;
		this.orderContractNum = orderContractNum;
		this.orderProcessType = orderProcessType;
		this.orderType = orderType;
		this.orderSpecialTech = orderSpecialTech;
		this.orderShellIngredient = orderShellIngredient;
		this.orderChecked = orderChecked;
		this.orderDetails = orderDetails;
		this.orderMaterialDetails = orderMaterialDetails;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public User getCharge() {
		return charge;
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

	public int getOrderDesignIsNew() {
		return orderDesignIsNew;
	}

	public void setOrderDesignIsNew(int orderDesignIsNew) {
		this.orderDesignIsNew = orderDesignIsNew;
	}
	
	public Inquiry getInquiry() {
		return inquiry;
	}

	public void setInquiry(Inquiry inquiry) {
		this.inquiry = inquiry;
	}

	public SampleOrders getSampleOrders() {
		return sampleOrders;
	}

	public void setSampleOrders(SampleOrders sampleOrders) {
		this.sampleOrders = sampleOrders;
	}

	public int getOrderID(){
		return orderID;
	}
	
	public User getOrderMaker(){
		return orderMaker;
	}
	
	public User getChargeId(){
		return charge;
	}
	
	public String getOrderCode(){
		return orderCode;
	}
	
	public String getOrderRefURL(){
		return orderRefURL;
	}
	
	public String getOrderSampleYardage(){
		return orderSampleYardage;
	}
	
	public String getOrderSewnInLabelReq(){
		return orderSewnInLabelReq;
	}
	
	public String getOrderTechReq(){
		return orderTechReq;
	}
	
	public String getOrderComment(){
		return orderComment;
	}
	
	public String getOrderPriority(){
		return orderPriority;
	}
	
	public String getOrderSource(){
		return orderSource;
	}
	
	public String getOrderContractNum(){
		return orderContractNum;
	}
	
	public String getOrderProcessType(){
		return orderProcessType;
	}
	
	public String getOrderType(){
		return orderType;
	}
	
	public String getOrderSpecialTech(){
		return orderSpecialTech;
	}
	
	public String getOrderShellIngredient(){
		return orderShellIngredient;
	}
	
	
	public void setOrderID(int orderID){
		this.orderID = orderID;
	}
	
	public void setOrderMaker(User orderMaker){
		this.orderMaker = orderMaker;
	}
	
	public void setCharge(User charge){
		this.charge = charge;
	}
	
	public void setOrderCode(String orderCode){
		this.orderCode = orderCode;
	}
	
	
	public void setOrderRefURL(String orderRefURL){
		this.orderRefURL = orderRefURL;
	}
	
	public void setOrderSampleYardage(String orderSampleYardage){
		this.orderSampleYardage = orderSampleYardage;
	}
	
	public void setOrderSewnInLabelReq(String orderSewnInLabelReq){
		this.orderSewnInLabelReq = orderSewnInLabelReq;
	}
	
	public void setOrderTechReq(String orderTechReq){
		this.orderTechReq = orderTechReq;
	}
	
	public void setOrderComment(String orderComment){
		this.orderComment = orderComment;
	}
	
	public void setOrderPriority(String orderPriority){
		this.orderPriority = orderPriority;
	}
	
	public void setOrderSource(String orderSource){
		this.orderSource = orderSource;
	}
	
	
	
	public void setOrderContractNum(String orderContractNum){
		this.orderContractNum = orderContractNum;
	}
	
	public void setOrderProcessType(String orderProcessType){
		this.orderProcessType = orderProcessType;
	}
	
	public void setOrderType(String orderType){
		this.orderType = orderType;
	}
	
	public void setOrderSpecialTech(String orderSpecialTech){
		this.orderSpecialTech = orderSpecialTech;
	}
	
	public void setOrderShellIngredient(String orderShellIngredient){
		this.orderShellIngredient = orderShellIngredient;
	}
	
	public int getOrderChecked() {
		return orderChecked;
	}

	public void setOrderChecked(int orderChecked) {
		this.orderChecked = orderChecked;
	}

	public String getOrderDesignatedTime() {
		return orderDesignatedTime.substring(0, 19);
	}

	public void setOrderDesignatedTime(String orderDesignatedTime) {
		this.orderDesignatedTime = orderDesignatedTime;
	}

	public String getOrderDate() {
		return orderDate.substring(0, 19);
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public Date getOrderFinishDate() {
		return orderFinishDate;
	}

	public void setOrderFinishDate(Date orderFinishDate) {
		this.orderFinishDate = orderFinishDate;
	}

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Set<OrderMaterialDetail> getOrderMaterialDetails() {
		return orderMaterialDetails;
	}

	public void setOrderMaterialDetails(
			Set<OrderMaterialDetail> orderMaterialDetails) {
		this.orderMaterialDetails = orderMaterialDetails;
	}

	public String getDistributeMethod() {
		return distributeMethod;
	}

	public void setDistributeMethod(String distributeMethod) {
		this.distributeMethod = distributeMethod;
	}
	
	
}
