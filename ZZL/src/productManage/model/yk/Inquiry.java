package productManage.model.yk;
/**
 * @author yukuai
 * @date 创建时间2016-02-27
 */
import java.util.HashSet;
import java.util.Iterator;
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
import javax.persistence.Transient;

import productManage.model.tms.Design;

@Entity
@Table(name="inquiry")                       //询价单表

public class Inquiry {

	@Id                                     //询价单编号
	private int inquiryID;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = false)
	@JoinColumn(name = "designID")          //款号
	private Design design;
	
	@Column(name="inquiryCode")             //询价单编码
	private String inquiryCode;
	
	@Column(name="inquiryMaterialSample")   //样衣（来样报价/）
	private String inquiryMaterialSample;
	
	@Column(name="inquiryTotal")            //合计件数
	private int inquiryTotal;
	
	@Column(name="inquiryProcessCycle")     //加工周期
	private int inquiryProcessCycle;
	   
	@Column(name="inquiryUnitPrice")        //单件成本
	private float inquiryUnitPrice;
	
	@Column(name="shellOKTime")             //面料OK时间
	private String shellOKTime;            
	
	@Column(name="accOKTime")               //辅料OK时间
	private String accOKTime;
	
	@Column(name="flowerOKTime")            //花型OK时间
	private String flowerOKTime;
	
	@Column(name="modelOKTime")             //版型OK时间
	private String modelOKTime;
	
	@Column(name="processOKTime")           //加工OK时间
	private String processOKTime;
	
	@Transient                              //进度
	private String inquiryProgress;
	
	@Transient                              //进度时间
	private String inquiryProgressDate;
	
	@OneToOne(targetEntity=Orders.class,mappedBy="inquiry")
	private Orders order;                   //客户订单
	
	@OneToOne(targetEntity=InquiryDetail.class,mappedBy="inquiry")
	private InquiryDetail inquiryDetail;    //询价单其它信息
	
	@OneToMany(mappedBy="inquiry",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<InquiryMaterial> inquiryMaterials=new HashSet<InquiryMaterial>();
	
	@Transient
	private float unitCost;                //询价单单件成本
	
	@Transient
	private float totalCost;               //订单合计成本
	
	public Inquiry(){
		super();
	}
	
	public Inquiry(int inquiryID, Design design, String inquiryCode,
			String inquiryMaterialSample, int inquiryTotal,
			int inquiryProcessCycle, float inquiryUnitPrice,
			String shellOKTime, String accOKTime, String flowerOKTime,
			String modelOKTime, String processOKTime, String inquiryProgress,
			String inquiryProgressDate, Orders order,
			InquiryDetail inquiryDetail, Set<InquiryMaterial> inquiryMaterials,
			float unitCost, float totalCost) {
		super();
		this.inquiryID = inquiryID;
		this.design = design;
		this.inquiryCode = inquiryCode;
		this.inquiryMaterialSample = inquiryMaterialSample;
		this.inquiryTotal = inquiryTotal;
		this.inquiryProcessCycle = inquiryProcessCycle;
		this.inquiryUnitPrice = inquiryUnitPrice;
		this.shellOKTime = shellOKTime;
		this.accOKTime = accOKTime;
		this.flowerOKTime = flowerOKTime;
		this.modelOKTime = modelOKTime;
		this.processOKTime = processOKTime;
		this.inquiryProgress = inquiryProgress;
		this.inquiryProgressDate = inquiryProgressDate;
		this.order = order;
		this.inquiryDetail = inquiryDetail;
		this.inquiryMaterials = inquiryMaterials;
		this.unitCost = unitCost;
		this.totalCost = totalCost;
	}

	public int getInquiryID(){
		return inquiryID;
	}

	public String getInquiryCode(){
		return inquiryCode;
	}
	
	public String getInquiryMaterialSample(){
		return inquiryMaterialSample;
	}
	
	public int getInquiryTotal(){
		return inquiryTotal;
	}
	
	public int getInquiryProcessCycle(){
		return inquiryProcessCycle;
	}
	
	public float getInquiryUnitPrice(){
		return inquiryUnitPrice;
	}
	
	public void setInquiryCode(String inquiryCode){
		this.inquiryCode = inquiryCode;
	}
	
	public void setInquiryMaterialSample(String inquiryMaterialSample){
		this.inquiryMaterialSample = inquiryMaterialSample;
	}
	
	public void setInquiryTotal(int inquiryTotal){
		this.inquiryTotal = inquiryTotal;
	}
	
	public void setInquiryProcessCycle(int inquiryProcessCycle){
		this.inquiryProcessCycle = inquiryProcessCycle;
	}
	
	public void setInquiryUnitPrice(float inquiryUnitPrice){
		this.inquiryUnitPrice = inquiryUnitPrice;
	}
	
	public String getShellOKTime() {
		return shellOKTime.substring(0, 19);
	}

	public void setShellOKTime(String shellOKTime) {
		this.shellOKTime = shellOKTime;
	}

	public String getAccOKTime() {
		return accOKTime.substring(0, 19);
	}

	public void setAccOKTime(String accOKTime) {
		this.accOKTime = accOKTime;
	}

	public String getFlowerOKTime() {
		return flowerOKTime.substring(0, 19);
	}

	public void setFlowerOKTime(String flowerOKTime) {
		this.flowerOKTime = flowerOKTime;
	}

	public String getModelOKTime() {
		return modelOKTime.substring(0, 19);
	}

	public void setModelOKTime(String modelOKTime) {
		this.modelOKTime = modelOKTime;
	}

	public String getProcessOKTime() {
		return processOKTime.substring(0, 19);
	}

	public void setProcessOKTime(String processOKTime) {
		this.processOKTime = processOKTime;
	}

	public Design getDesign() {
		return design;
	}

	public void setDesign(Design design) {
		this.design = design;
	}

	public Orders getOrder() {
		return order;
	}
	
	public void setOrder(Orders order) {
		this.order = order;
	}
	
	public InquiryDetail getInquiryDetail() {
		return inquiryDetail;
	}
	
	public void setInquiryDetail(InquiryDetail inquiryDetail) {
		this.inquiryDetail = inquiryDetail;
	}
	
	public Set<InquiryMaterial> getInquiryMaterials() {
		return inquiryMaterials;
	}
	
	public void setInquiryMaterials(Set<InquiryMaterial> inquiryMaterials) {
		this.inquiryMaterials = inquiryMaterials;
	}
	
	public float getUnitCost() {
		unitCost = (float) 0.0;
		Iterator iterator = inquiryMaterials.iterator();
		while(iterator.hasNext()){
			InquiryMaterial im = (InquiryMaterial) iterator.next();
			unitCost += im.getInTotalUnit();
		}
		unitCost += inquiryDetail.getInquiryPrintCost()+inquiryDetail.getInquirySampleCost()+inquiryDetail.getInquiryProcessCost();
		return unitCost;
	}

	public void setUnitCost(float unitCost) {
		this.unitCost = unitCost;
	}
	
	public float getTotalCost() {
		return unitCost*inquiryTotal;
	}

	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}

	public String getInquiryProgress() {
		//System.out.println(shellOKTime+" a="+accOKTime+" f="+flowerOKTime+" m="+modelOKTime+" p="+processOKTime);
		if (shellOKTime==null) {
			inquiryProgress =  "无";
		}
		if(shellOKTime!=null&&accOKTime==null){
			inquiryProgress = "面料OK";
		}
		if(shellOKTime!=null&&accOKTime!=null&&flowerOKTime==null){
			inquiryProgress = "辅料OK";
		}
		if(shellOKTime!=null&&accOKTime!=null&&flowerOKTime!=null&&modelOKTime==null){
			inquiryProgress = "花型OK";
		}
		if(shellOKTime!=null&&accOKTime!=null&&flowerOKTime!=null&&modelOKTime!=null&&processOKTime==null){
			inquiryProgress = "版型OK";
		}
		if(shellOKTime!=null&&accOKTime!=null&&flowerOKTime!=null&&modelOKTime!=null&&processOKTime!=null){
			inquiryProgress = "加工OK";
		}
		return inquiryProgress;
	}

	public void setInquiryProgress(String inquiryProgress) {
		this.inquiryProgress = inquiryProgress;
	}

	public String getInquiryProgressDate() {
		if (shellOKTime==null) {
			inquiryProgressDate =  "";
		}
		if(shellOKTime!=null&&accOKTime==null){
			inquiryProgressDate = shellOKTime.substring(0, 19);
		}
		if(shellOKTime!=null&&accOKTime!=null&&flowerOKTime==null){
			inquiryProgressDate = accOKTime.substring(0, 19);
		}
		if(shellOKTime!=null&&accOKTime!=null&&flowerOKTime!=null&&modelOKTime==null){
			inquiryProgressDate = flowerOKTime.substring(0, 19);
		}
		if(shellOKTime!=null&&accOKTime!=null&&flowerOKTime!=null&&modelOKTime!=null&&processOKTime==null){
			inquiryProgressDate = modelOKTime.substring(0, 19);
		}
		if(shellOKTime!=null&&accOKTime!=null&&flowerOKTime!=null&&modelOKTime!=null&&processOKTime!=null){
			inquiryProgressDate = processOKTime.substring(0, 19);
		}
		return inquiryProgressDate;
	}

	public void setInquiryProgressDate(String inquiryProgressDate) {
		this.inquiryProgressDate = inquiryProgressDate;
	}
	

}
