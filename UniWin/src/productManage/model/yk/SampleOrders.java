package productManage.model.yk;
/**
 * @author yukuai
 * @date 创建时间2016-02-27
 */

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import productManage.model.User;
import productManage.model.tms.Design;

@Entity
@Table(name="sampleorder")                       //样衣单表

public class SampleOrders {
	@Id                                         //样衣单编号
	private int sampleOrderID;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = false)
	@JoinColumn(name = "designID")              //款号
	private Design design;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = false)
	@JoinColumn(name="userId")                  //制版人ID
	private User maker;
	
	@Column(name="sampleOrderCode")             //样衣单编码
	private String sampleOrderCode;
	
	@Column(name="sampleOrderSample")           //样衣（来样报价/？）
	private String sampleOrderSample;
	
	@Column(name="sampleOrderSource")           //来源
	private String sampleOrderSource;
	
	@Column(name="sampleOrderTime")             //下单时间
	private String sampleOrderTime;
	
	@Column(name="sampleOrderShellFabReq")      //面料要求
	private String sampleOrderShellFabReq;
	
	@Column(name="sampleOrderAccReq")           //辅料要求
	private String sampleOrderAccReq;
	
	@Column(name="sampleOrderTechReq")          //工艺要求
	private String sampleOrderTechReq;
	
	@Column(name="sampleOrderModOpinion")       //修改意见
	private String sampleOrderModOpinion;
	
	@Column(name="sampleOrderComment")          //其它备注
	private String sampleOrderComment;
	
	@OneToOne(targetEntity=Orders.class,mappedBy="sampleOrders")                         
	private Orders order;                       //客户订单
	
	@OneToOne(targetEntity=SampleProcedure.class,mappedBy="sampleOrders")
	private SampleProcedure sampleProcedure;    //样衣单工序时间
	
	public SampleOrders(){
		super();
	}
	
	public SampleOrders(int sampleOrderID, Design design, User maker,
			String sampleOrderCode, String sampleOrderSample,
			String sampleOrderSource, String sampleOrderTime,
			String sampleOrderShellFabReq, String sampleOrderAccReq,
			String sampleOrderTechReq, String sampleOrderModOpinion,
			String sampleOrderComment, Orders order,
			SampleProcedure sampleProcedure) {
		super();
		this.sampleOrderID = sampleOrderID;
		this.design = design;
		this.maker = maker;
		this.sampleOrderCode = sampleOrderCode;
		this.sampleOrderSample = sampleOrderSample;
		this.sampleOrderSource = sampleOrderSource;
		this.sampleOrderTime = sampleOrderTime;
		this.sampleOrderShellFabReq = sampleOrderShellFabReq;
		this.sampleOrderAccReq = sampleOrderAccReq;
		this.sampleOrderTechReq = sampleOrderTechReq;
		this.sampleOrderModOpinion = sampleOrderModOpinion;
		this.sampleOrderComment = sampleOrderComment;
		this.order = order;
		this.sampleProcedure = sampleProcedure;
	}

	public int getSampleOrderID(){
		return sampleOrderID;
	}
	
	public String getSampleOrderCode(){
		return sampleOrderCode;
	}
	
	public String getSampleOrderSample(){
		return sampleOrderSample;
	}
	
	public String getSampleOrderSource(){
		return sampleOrderSource;
	}
	
	public String getSampleOrderTime(){
		return sampleOrderTime.substring(0, 19);
	}
	
	public String getSampleOrderShellFabReq(){
		return sampleOrderShellFabReq;
	}
	
	public String getSampleOrderAccReq(){
		return sampleOrderAccReq;
	}
	
	public String getSampleOrderTechReq(){
		return sampleOrderTechReq;
	}
	
	public String getSampleOrderModOpinion(){
		return sampleOrderModOpinion;
	}
	
	public String getSampleOrderComment(){
		return sampleOrderComment;
	}
	
	public void setSampleOrderCode(String sampleOrderCode){
		this.sampleOrderCode = sampleOrderCode;
	}
	
	public void setSampleOrderSample(String sampleOrderSample){
		this.sampleOrderSample = sampleOrderSample;
	}
	
	public void setSampleOrderSource(String sampleOrderSource){
		this.sampleOrderSource = sampleOrderSource;
	}
	
	public void setSampleOrderTime(String sampleOrderTime){
		this.sampleOrderTime = sampleOrderTime;
	}
	
	public void setSampleOrderShellFabReq(String sampleOrderShellFabReq){
		this.sampleOrderShellFabReq = sampleOrderShellFabReq;
	}
	
	public void setSampleOrderAccReq(String sampleOrderAccReq){
		this.sampleOrderAccReq = sampleOrderAccReq;
	}
	
	public void setSampleOrderTechReq(String sampleOrderTechReq){
		this.sampleOrderTechReq = sampleOrderTechReq;
	}
	
	public void setSampleOrderModOpinion(String sampleOrderModOpinion){
		this.sampleOrderModOpinion = sampleOrderModOpinion;
	}
	
	public void setSampleOrderComment(String sampleOrderComment){
		this.sampleOrderComment = sampleOrderComment;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}
	
	public SampleProcedure getSampleProcedure() {
		return sampleProcedure;
	}
	
	public void setSampleProcedure(SampleProcedure sampleProcedure) {
		this.sampleProcedure = sampleProcedure;
	}

	public Design getDesign() {
		return design;
	}

	public void setDesign(Design design) {
		this.design = design;
	}

	public User getMaker() {
		return maker;
	}

	public void setMaker(User maker) {
		this.maker = maker;
	}
	
	
}
