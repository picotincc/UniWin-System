package productManage.model.yk;
/**
 * @author yukuai
 * @date 创建时间2016-02-27
 */
import java.text.DecimalFormat;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import productManage.model.lhj.Material;
import productManage.model.tms.Design;

@Entity
@Table(name="inquiryMaterial")                        //询价单面辅料信息表

public class InquiryMaterial {

	@Id                                       //编号
	private int inquiryMaterialID;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = false)
	@JoinColumn(name = "inquiryID")              
	private Inquiry inquiry;                  //询价单编号
	
	@OneToOne(targetEntity=Material.class)
	@JoinColumn(name="materialCode",referencedColumnName="materialCode",unique=true)
	private Material material;                //物料编码
	
	@Column(name="inquiryMaterialUnitVol")    //单件用量
	private int inquiryMaterialUnitVol;
	
	@Transient
	private float InTotalUnit;                //单价合计（元/件）
 	
	public InquiryMaterial(){
		super();
	}

	public InquiryMaterial(int inquiryMaterialID, Inquiry inquiry,
			Material material, int inquiryMaterialUnitVol, float inTotalUnit) {
		super();
		this.inquiryMaterialID = inquiryMaterialID;
		this.inquiry = inquiry;
		this.material = material;
		this.inquiryMaterialUnitVol = inquiryMaterialUnitVol;
		InTotalUnit = inTotalUnit;
	}
	public InquiryMaterial(int inquiryMaterialID, Inquiry inquiry,
			Material material, int inquiryMaterialUnitVol) {
		super();
		this.inquiryMaterialID = inquiryMaterialID;
		this.inquiry = inquiry;
		this.material = material;
		this.inquiryMaterialUnitVol = inquiryMaterialUnitVol;
	}
	public Inquiry getInquiry() {
		return inquiry;
	}
	
	public void setInquiry(Inquiry inquiry) {
		this.inquiry = inquiry;
	}
	
	public int getID(){
		return inquiryMaterialID;
	}
	
	public int getInquiryMaterialUnitVol(){
		return inquiryMaterialUnitVol;
	}
	
	public void setInquiryMaterialUnitVol(int inquiryMaterialUnitVol){
		this.inquiryMaterialUnitVol = inquiryMaterialUnitVol;
	}

	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}


	public float getInTotalUnit() {
		return ((int)(inquiryMaterialUnitVol*material.getUnitPrice())*100)/100;
	}

	public void setInTotalUnit(float InTotalUnit) {
		this.InTotalUnit = InTotalUnit;
	}
	
}
