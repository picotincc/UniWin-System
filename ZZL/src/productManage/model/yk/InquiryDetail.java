package productManage.model.yk;
/**
 * @author tms
 * @date 创建时间2016-02-27
 */
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="inquirydetail")
//询价单其他信息表
public class InquiryDetail {
	public InquiryDetail(){
		super();
	}

	public InquiryDetail(int inquiryDetailID, Inquiry inquiry,
			float inquiryPrintCost, int inquiryTime, float inquirySampleCost,
			float inquiryProcessCost, int inquiryDetailCycle,
			int inquirySampleCycle, String inquiryShellComment,
			String inquiryAccComment) {
		super();
		this.inquiryDetailID     = inquiryDetailID;
		this.inquiry             = inquiry;
		this.inquiryPrintCost    = inquiryPrintCost;
		this.inquiryTime         = inquiryTime;
		this.inquirySampleCost   = inquirySampleCost;
		this.inquiryProcessCost  = inquiryProcessCost;
		this.inquiryDetailCycle  = inquiryDetailCycle;
		this.inquirySampleCycle  = inquirySampleCycle;
		this.inquiryShellComment = inquiryShellComment;
		this.inquiryAccComment   = inquiryAccComment;
	}


	@Id
	private int inquiryDetailID;
	public int getInquiryDetailID(){
		return inquiryDetailID;
	}
	public void setInquiryDetailID(int inquiryDetailID){
		this.inquiryDetailID = inquiryDetailID;
	}
	//询价单
	@OneToOne(targetEntity=Inquiry.class)
	@JoinColumn(name="inquiryID",referencedColumnName="inquiryID",unique=true)
	private Inquiry inquiry;
	//印染费
	private float inquiryPrintCost;
	//天数
	private int inquiryTime;
	//开版费
	private float inquirySampleCost;
	//加工费
	private float inquiryProcessCost;
	//周期
	private int inquiryDetailCycle;
	//样衣周期
	private int inquirySampleCycle;
	//面料备注
	private String inquiryShellComment;
	//辅料备注
	private String inquiryAccComment;
	
	
	public Inquiry getInquiry() {
		return inquiry;
	}
	
	public void setInquiry(Inquiry inquiry) {
		this.inquiry = inquiry;
	}
	
	public int getInquiryTime() {
		return inquiryTime;
	}
	public void setInquiryTime(int inquiryTime) {
		this.inquiryTime = inquiryTime;
	}
	
	public float getInquiryPrintCost() {
		return inquiryPrintCost;
	}
	public void setInquiryPrintCost(float inquiryPrintCost) {
		this.inquiryPrintCost = inquiryPrintCost;
	}
	
	public float getInquirySampleCost() {
		return inquirySampleCost;
	}
	public void setInquirySampleCost(float inquirySampleCost) {
		this.inquirySampleCost = inquirySampleCost;
	}
	
	public float getInquiryProcessCost() {
		return inquiryProcessCost;
	}
	public void setInquiryProcessCost(float inquiryProcessCost) {
		this.inquiryProcessCost = inquiryProcessCost;
	}
	
	public int getInquiryDetailCycle() {
		return inquiryDetailCycle;
	}
	public void setInquiryDetailCycle(int inquiryDetailCycle) {
		this.inquiryDetailCycle = inquiryDetailCycle;
	}
	
	public int getInquirySampleCycle() {
		return inquirySampleCycle;
	}
	public void setInquirySampleCycle(int inquirySampleCycle) {
		this.inquirySampleCycle = inquirySampleCycle;
	}
	
	public String getInquiryShellComment() {
		return inquiryShellComment;
	}
	public void setInquiryShellComment(String inquiryShellComment) {
		this.inquiryShellComment = inquiryShellComment;
	}
	
	public String getInquiryAccComment() {
		return inquiryAccComment;
	}
	public void setInquiryAccComment(String inquiryAccComment) {
		this.inquiryAccComment = inquiryAccComment;
	}

}
