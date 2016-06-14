package productManage.model.whq;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import productManage.model.tms.Design;
import productManage.model.yk.Orders;


/**
 * @author WHQ
 * @date 创建时间2016-3-8
 * 样衣表
 */

@Entity
@Table(name="sample")
public class Sample {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int sampleID;  //样衣ID
	
	 @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
	 @JoinColumn(name = "designID")
	private Design design;  	//款号
	 
	 @Column
	 private String samplePlace;		//入库位置
	 
	 @Column
	 private String sampleState;		//样衣状态

	 @OneToMany(mappedBy="sample",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	 private Set<SampleStorageDetail> sample_details=new HashSet<SampleStorageDetail>();
	 
	public Sample(int sampleID, Design design, String samplePlace,
			String sampleState) {
		super();
		this.sampleID = sampleID;
		this.design = design;
		this.samplePlace = samplePlace;
		this.sampleState = sampleState;
	}
	
	public Sample(){}
		
	public int getSampleID() {
		return sampleID;
	}

	public void setSampleID(int sampleID) {
		this.sampleID = sampleID;
	}

	

	public Design getDesign() {
        return design;
    }

    public void setDesign(Design design) {
        this.design = design;
    }

    public String getSamplePlace() {
		return samplePlace;
	}

	public void setSamplePlace(String samplePlace) {
		this.samplePlace = samplePlace;
	}

	public String getSampleState() {
		return sampleState;
	}

	public void setSampleState(String sampleState) {
		this.sampleState = sampleState;
	}

	public Set<SampleStorageDetail> getSample_details() {
		return sample_details;
	}

	public void setSample_details(Set<SampleStorageDetail> sample_details) {
		this.sample_details = sample_details;
	}
	 
}
