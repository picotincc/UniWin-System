package productManage.model.whq;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author WHQ
 * @date 创建时间2016-3-8
 * 样衣出入库明细表
 */

@Entity
@Table(name="samplestoragedetail")
public class SampleStorageDetail {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int sampleStorageDetailID;   //主键ID
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
	@JoinColumn(name = "sampleID")
	private Sample sample;   //样衣表ID
	
	@Column
	private String sampleOPComment;		//操作备注
	
	@Column
	private String sampleOPType;			//操作类型	
	
//	@Column 
//	private String sampleTime;		//进出时间
	
	@Column
	private Timestamp sampleOPTime;
	
	public SampleStorageDetail(){
		
	}
	public SampleStorageDetail(int sampleStorageDetailID, Sample sample,
			String sampleOPComment, String sampleOPType, Timestamp sampleOPTime) {
		super();
		this.sampleStorageDetailID = sampleStorageDetailID;
		this.sample = sample;
		this.sampleOPComment = sampleOPComment;
		this.sampleOPType = sampleOPType;
//		this.sampleTime = sampleTime;
		this.sampleOPTime = sampleOPTime;
	}

	public int getSampleStorageDetailID() {
		return sampleStorageDetailID;
	}

	public void setSampleStorageDetailID(int sampleStorageDetailID) {
		this.sampleStorageDetailID = sampleStorageDetailID;
	}

	
	public Sample getSample() {
        return sample;
    }

    public void setSample(Sample sample) {
        this.sample = sample;
    }

    public String getSampleOPComment() {
		return sampleOPComment;
	}

	public void setSampleOPComment(String sampleOPComment) {
		this.sampleOPComment = sampleOPComment;
	}

	public String getSampleOPType() {
		return sampleOPType;
	}

	public void setSampleOPType(String sampleOPType) {
		this.sampleOPType = sampleOPType;
	}

	public String getSampleOPTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String result = sdf.format(sampleOPTime);
		return result;
	}
	public void setSampleOPTime(Timestamp sampleOPTime) {
		this.sampleOPTime = sampleOPTime;
	}
	
	
}
