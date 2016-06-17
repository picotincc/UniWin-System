package productManage.model.tms;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import productManage.model.cs.OutSource;
import productManage.model.lhj.Bom;
import productManage.model.whq.Sample;
import productManage.model.yk.Inquiry;
import productManage.model.yk.Orders;
import productManage.model.yk.SampleOrders;

/**
 * @author TMS
 * @date 2016-2-29
 */
@Entity
@Table(name="design")
public class Design {
	
	public Design() {
	}
	public Design(int designID, String designCode,
			String designName, String designPicURL, float designProcessPrice,
			String designTechProcedure, Date designPutawayDate,
			String designColorDescription, String designComment,
			String designsewninCode, String designMainLabelCode,
			String designHangTagCode, String designFlagShipURL,String designType) {
		super();
		this.designID = designID;
		this.designCode = designCode;
		this.designName = designName;
		this.designPicURL = designPicURL;
		this.designProcessPrice = designProcessPrice;
		this.designTechProcedure = designTechProcedure;
		this.designPutawayDate = designPutawayDate;
		this.designColorDescription = designColorDescription;
		this.designComment = designComment;
		this.designsewninCode = designsewninCode;
		this.designMainLabelCode = designMainLabelCode;
		this.designHangTagCode = designHangTagCode;
		this.designFlagShipURL = designFlagShipURL;
		this.designType = designType;
	}

	@Id
	private int designID;
	public int getDesignID() {
		return designID;
	}
	public void setDesignID(int designID) {
		this.designID = designID;
	}
	
	private String designCode;							//款号
	private String designName;							//款式名称
	private String designPicURL;						//图片
	private float designProcessPrice;					//外发价格
	private String designTechProcedure;					//工序
	private Date designPutawayDate;						//上架时间
	private String designColorDescription;				//颜色说明
	private String designComment;						//备注
	private String designsewninCode;					//水洗标编号
	private String designMainLabelCode;					//主标编号
	private String designHangTagCode;					//吊牌编号
	private String designFlagShipURL;					//旗舰地址
	private String designType;							//款式类型
	
	@OneToMany(mappedBy="design",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<Orders> orders=new HashSet<Orders>();
	
	@OneToMany(mappedBy="design",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<Sample> samples=new HashSet<Sample>();
	
	@OneToMany(mappedBy="design",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<SampleOrders> sampleOrders=new HashSet<SampleOrders>();
	
	@OneToMany(mappedBy="design",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<Inquiry> inquiry=new HashSet<Inquiry>();
	/**
	 * 设置双向关联 by:zky 
	 */
	@OneToOne(mappedBy="design")
	private Technique technique;

	public Set<Orders> getOrders() {
		return orders;
	}
	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}
	public Set<SampleOrders> getSampleOrders() {
		return sampleOrders;
	}
	public void setSampleOrders(Set<SampleOrders> sampleOrders) {
		this.sampleOrders = sampleOrders;
	}
	public Set<Inquiry> getInquiry() {
		return inquiry;
	}
	public void setInquiry(Set<Inquiry> inquiry) {
		this.inquiry = inquiry;
	}
	public String getDesignCode() {
		return designCode;
	}
	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}
	public String getDesignName() {
		return designName;
	}
	public void setDesignName(String designName) {
		this.designName = designName;
	}
	public String getDesignPicURL() {
		return designPicURL;
	}
	public void setDesignPicURL(String designPicURL) {
		this.designPicURL = designPicURL;
	}
	public float getDesignProcessPrice() {
		return designProcessPrice;
	}
	public void setDesignProcessPrice(float designProcessPrice) {
		this.designProcessPrice = designProcessPrice;
	}
	public String getDesignTechProcedure() {
		return designTechProcedure;
	}
	public void setDesignTechProcedure(String designTechProcedure) {
		this.designTechProcedure = designTechProcedure;
	}
	public Date getDesignPutawayDate() {
		return designPutawayDate;
	}
	public void setDesignPutawayDate(Date designPutawayDate) {
		this.designPutawayDate = designPutawayDate;
	}
	public String getDesignColorDescription() {
		return designColorDescription;
	}
	public void setDesignColorDescription(String designColorDescription) {
		this.designColorDescription = designColorDescription;
	}
	public String getDesignComment() {
		return designComment;
	}
	public void setDesignComment(String designComment) {
		this.designComment = designComment;
	}
	public String getDesignsewninCode() {
		return designsewninCode;
	}
	public void setDesignsewninCode(String designsewninCode) {
		this.designsewninCode = designsewninCode;
	}
	public String getDesignMainLabelCode() {
		return designMainLabelCode;
	}
	public void setDesignMainLabelCode(String designMainLabelCode) {
		this.designMainLabelCode = designMainLabelCode;
	}
	public String getDesignHangTagCode() {
		return designHangTagCode;
	}
	public void setDesignHangTagCode(String designHangTagCode) {
		this.designHangTagCode = designHangTagCode;
	}
	public String getDesignFlagShipURL() {
		return designFlagShipURL;
	}
	public void setDesignFlagShipURL(String designFlagShipURL) {
		this.designFlagShipURL = designFlagShipURL;
	}
	
	/**
	 * 款式物料对应 BOM BY:LHJ
	 */
	@OneToMany(mappedBy="design",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	private Set<Bom> boms=new HashSet<Bom>();
	
	/*
	 * 外发单对应outSource BY:CS
	 */
	@OneToMany(mappedBy="design")
	private Set<OutSource> outSources = new HashSet<OutSource>();
	
	
	public Set<Bom> getBoms() {
		return boms;
	}
	public void setBoms(Set<Bom> boms) {
		this.boms = boms;
	}
	public Set<OutSource> getOutSources() {
		return outSources;
	}
	public void setOutSources(Set<OutSource> outSources) {
		this.outSources = outSources;
	}
    public Set<Sample> getSamples() {
        return samples;
    }
    public void setSamples(Set<Sample> samples) {
        this.samples = samples;
    }
	public String getDesignType() {
		return designType;
	}
	public void setDesignType(String designType) {
		this.designType = designType;
	}
	public Technique getTechnique() {
		return technique;
	}
	public void setTechnique(Technique technique) {
		this.technique = technique;
	}
	
	
	
	
}
