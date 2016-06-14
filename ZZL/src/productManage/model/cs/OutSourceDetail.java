package productManage.model.cs;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="outsourcedetail")

public class OutSourceDetail {
	
	@Id
	private int outsourceDetailID;
	
	private String outsourceColor;
	
	private int outsourceXS;
	
	private int outsourceS;
	
	private int outsourceM;
	
	private int outsourceL;
	
	private int outsourceXL;
	
	private int outsourceXXL;
	
	private int outsourceTotal;
	
	/**
     * 外发单外键关联
     */
	@ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
	@JoinColumn(name="outsourceID")
	private OutSource outsource;
	

	public int getOutsourceDetailID() {
		return outsourceDetailID;
	}

	public void setOutsourceDetailID(int outsourceDetailID) {
		this.outsourceDetailID = outsourceDetailID;
	}

	public String getOutsourceColor() {
		return outsourceColor;
	}

	public void setOutsourceColor(String outsourceColor) {
		this.outsourceColor = outsourceColor;
	}

	public int getOutsourceXS() {
		return outsourceXS;
	}

	public void setOutsourceXS(int outsourceXS) {
		this.outsourceXS = outsourceXS;
	}

	public int getOutsourceS() {
		return outsourceS;
	}

	public void setOutsourceS(int outsourceS) {
		this.outsourceS = outsourceS;
	}

	public int getOutsourceM() {
		return outsourceM;
	}

	public void setOutsourceM(int outsourceM) {
		this.outsourceM = outsourceM;
	}

	public int getOutsourceL() {
		return outsourceL;
	}

	public void setOutsourceL(int outsourceL) {
		this.outsourceL = outsourceL;
	}

	public int getOutsourceXL() {
		return outsourceXL;
	}

	public void setOutsourceXL(int outsourceXL) {
		this.outsourceXL = outsourceXL;
	}

	public int getOutsourceXXL() {
		return outsourceXXL;
	}

	public void setOutsourceXXL(int outsourceXXL) {
		this.outsourceXXL = outsourceXXL;
	}
	
	

	public int getOutsourceTotal() {
		return outsourceTotal;
	}

	public void setOutsourceTotal(int outsourceTotal) {
		this.outsourceTotal = outsourceTotal;
	}

	public OutSource getOutsource() {
		return outsource;
	}

	public void setOutsource(OutSource outsource) {
		this.outsource = outsource;
	}
	
	
	

}
