package productManage.model.tms;
/**
 * @author tms
 * @date 创建时间2016-02-27
 */
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import productManage.model.User;
import productManage.model.cs.Processor;
import productManage.model.yrd.Customer;


@Entity
@Table(name="technique")
//款式工艺单
public class Technique {
	public Technique(){
		
	}
	public Technique(int techid, User user, Design design, Processor processor,
			String techCode, Date techDate, String technique,
			String techShellType, String techSampleSize, int techModelFinish,
			String techJointSize, String techLineDistance,
			String techPressingReq, String techComment) {
		super();
		this.techid = techid;
		this.user = user;
		this.design = design;
		this.processor = processor;
		this.techCode = techCode;
		this.techDate = techDate;
		this.technique = technique;
		this.techShellType = techShellType;
		this.techSampleSize = techSampleSize;
		this.techModelFinish = techModelFinish;
		this.techJointSize = techJointSize;
		this.techLineDistance = techLineDistance;
		this.techPressingReq = techPressingReq;
		this.techComment = techComment;
	}


	@Id
	private int techid;

	public int getTechid() {
		return techid;
	}
	public void setTechid(int techid) {
		this.techid = techid;
	}


	//负责人id
	@ManyToOne(cascade=CascadeType.ALL,optional=false)
	@JoinColumn(name="userID")
	private User user;
	//款式id
	@OneToOne(targetEntity=Design.class)
	@JoinColumn(name="designID",referencedColumnName="designID",unique=true)
	private Design design;
	//加工方id
	@ManyToOne(cascade=CascadeType.ALL,optional=false)
	@JoinColumn(name="processorID")
	private Processor processor;
	//工艺单编码
	private String techCode;
	//制单日期
	private Date techDate;
	//工艺技术
	private String technique;
	//面料分类
	private String techShellType;
	//样板尺寸
	private String techSampleSize;
	//制版完成
	private int techModelFinish;
	//作缝大小
	private String techJointSize;
	//线距
	private String techLineDistance;
	//整烫要求
	private String techPressingReq;
	//备注
	private String techComment;


	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public Processor getProcessor() {
		return processor;
	}
	public void setProcessor(Processor processor) {
		this.processor = processor;
	}
	public Design getDesign() {
		return design;
	}
	public void setDesign(Design design) {
		this.design = design;
	}

	public String getTechCode() {
		return techCode;
	}
	public void setTechCode(String techCode) {
		this.techCode = techCode;
	}
	public Date getTechDate() {
		return techDate;
	}
	public void setTechDate(Date techDate) {
		this.techDate = techDate;
	}
	public String getTechnique() {
		return technique;
	}
	public void setTechnique(String technique) {
		this.technique = technique;
	}
	public String getTechShellType() {
		return techShellType;
	}
	public void setTechShellType(String techShellType) {
		this.techShellType = techShellType;
	}
	public String getTechSampleSize() {
		return techSampleSize;
	}
	public void setTechSampleSize(String techSampleSize) {
		this.techSampleSize = techSampleSize;
	}
	public int getTechModelFinish() {
		return techModelFinish;
	}
	public void setTechModelFinish(int techModelFinish) {
		this.techModelFinish = techModelFinish;
	}
	public String getTechJointSize() {
		return techJointSize;
	}
	public void setTechJointSize(String techJointSize) {
		this.techJointSize = techJointSize;
	}
	public String getTechLineDistance() {
		return techLineDistance;
	}
	public void setTechLineDistance(String techLineDistance) {
		this.techLineDistance = techLineDistance;
	}
	public String getTechPressingReq() {
		return techPressingReq;
	}
	public void setTechPressingReq(String techPressingReq) {
		this.techPressingReq = techPressingReq;
	}
	public String getTechComment() {
		return techComment;
	}
	public void setTechComment(String techComment) {
		this.techComment = techComment;
	}
	
	
}
