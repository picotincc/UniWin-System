package productManage.model.yk;
/**
 * @author yukuai
 * @date 创建时间2016-02-27
 */

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="sampleprocedure")                           //样衣单工序表

public class SampleProcedure {
	@Id                                                  //编号
	private int sampleProcedureID;
	
	@OneToOne(targetEntity=SampleOrders.class)
	@JoinColumn(name="sampleOrderID",referencedColumnName="sampleOrderID",unique=true)
	private SampleOrders sampleOrders;                   //样衣单
	
	@Column(name="sampleProModelTime")                   //待制版时间
	private String sampleProModelTime;
	
	@Column(name="sampleProMakeTime")                    //待制作样衣时间
	private String sampleProMakeTime;
	
	@Column(name="sampleProConfirmTime")                 //待确认样衣时间
	private String sampleProConfirmTime;
	
	@Column(name="sampleProGradingTime")                 //待放码时间
	private String sampleProGradingTime;
	
	@Column(name="sampleProExamineTime")                 //待审版时间
	private String sampleProExamineTime;
	
	@Column(name="sampleProFinishTime")                  //完结时间
	private String sampleProFinishTime;
	
	@javax.persistence.Transient
	private String sampleOrderProgress;                  //样衣单进度
	
	@javax.persistence.Transient
	private String sampleOrderProgressDate;              //样衣单最近进度时间
	
	public SampleProcedure(){
		super();
	}
	
	public SampleProcedure(int sampleProcedureID, SampleOrders sampleOrders,
			String sampleProModelTime, String sampleProMakeTime,
			String sampleProConfirmTime, String sampleProGradingTime,
			String sampleProExamineTime, String sampleProFinishTime,
			String sampleOrderProgress, String sampleOrderProgressDate) {
		super();
		this.sampleProcedureID = sampleProcedureID;
		this.sampleOrders = sampleOrders;
		this.sampleProModelTime = sampleProModelTime;
		this.sampleProMakeTime = sampleProMakeTime;
		this.sampleProConfirmTime = sampleProConfirmTime;
		this.sampleProGradingTime = sampleProGradingTime;
		this.sampleProExamineTime = sampleProExamineTime;
		this.sampleProFinishTime = sampleProFinishTime;
		this.sampleOrderProgress = sampleOrderProgress;
		this.sampleOrderProgressDate = sampleOrderProgressDate;
	}

	public String getSampleOrderProgress() {
		if (sampleProModelTime==null) {
			return "无";
		}else {
			if (sampleProMakeTime==null) {
				return "待制版";
			}else{
				if (sampleProConfirmTime==null) {
					return "待制作样衣";
				}else{
					if (sampleProGradingTime==null) {
						return "待确认样衣";
					}else {
						if (sampleProExamineTime==null) {
							return "待放码";
						}else {
							if (sampleProFinishTime==null) {
								return "待审版";
							}else {
								return "完结";
							}
						}
					}
				}
			}
		}
	}

	public void setSampleOrderProgress(String sampleOrderProgress) {
		this.sampleOrderProgress = sampleOrderProgress;
	}

	public String getSampleOrderProgressDate() {
		if (sampleProModelTime==null) {
			return "无";
		}else {
			if (sampleProMakeTime==null) {
				return sampleProModelTime.substring(0, 19);
			}else{
				if (sampleProConfirmTime==null) {
					return sampleProMakeTime.substring(0, 19);
				}else{
					if (sampleProGradingTime==null) {
						return sampleProConfirmTime.substring(0, 19);
					}else {
						if (sampleProExamineTime==null) {
							return sampleProGradingTime.substring(0, 19);
						}else {
							if (sampleProFinishTime==null) {
								return sampleProExamineTime.substring(0, 19);
							}else {
								return sampleProFinishTime.substring(0, 19);
							}
						}
					}
				}
			}
		}
	}

	public void setSampleOrderProgressDate(String sampleOrderProgressDate) {
		this.sampleOrderProgressDate = sampleOrderProgressDate;
	}

	public int getSampleProcedureID(){
		return sampleProcedureID;
	}
	
	public SampleOrders getSampleOrders() {
		return sampleOrders;
	}

	public void setSampleOrders(SampleOrders sampleOrders) {
		this.sampleOrders = sampleOrders;
	}

	public String getSampleProModelTime() {
		return sampleProModelTime.substring(0, 19);
	}

	public void setSampleProModelTime(String sampleProModelTime) {
		this.sampleProModelTime = sampleProModelTime;
	}

	public String getSampleProMakeTime() {
		return sampleProMakeTime.substring(0, 19);
	}

	public void setSampleProMakeTime(String sampleProMakeTime) {
		this.sampleProMakeTime = sampleProMakeTime;
	}

	public String getSampleProConfirmTime() {
		return sampleProConfirmTime.substring(0, 19);
	}

	public void setSampleProConfirmTime(String sampleProConfirmTime) {
		this.sampleProConfirmTime = sampleProConfirmTime;
	}

	public String getSampleProGradingTime() {
		return sampleProGradingTime.substring(0, 19);
	}

	public void setSampleProGradingTime(String sampleProGradingTime) {
		this.sampleProGradingTime = sampleProGradingTime;
	}

	public String getSampleProExamineTime() {
		return sampleProExamineTime.substring(0, 19);
	}

	public void setSampleProExamineTime(String sampleProExamineTime) {
		this.sampleProExamineTime = sampleProExamineTime;
	}

	public String getSampleProFinishTime() {
		return sampleProFinishTime.substring(0, 19);
	}

	public void setSampleProFinishTime(String sampleProFinishTime) {
		this.sampleProFinishTime = sampleProFinishTime;
	}
	
//	public static String timeTransform(String timeString){
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		return df.format(timeString);
//	}
	
}
