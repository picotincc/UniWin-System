package productManage.model.cs;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="receivedetail")

public class ReceiveDetail {
	
	@Id
	private int receiveDetailID;
	
	private String receiveColor;
	
	private int receiveXS;
	
	private int receiveS;
	
	private int receiveM;
	
	private int receiveL;
	
	private int receiveXL;
	
	private int receiveXXL;
	
	private int receiveTotal;
	
	/**
     * 收货单外键关联
     */
	@ManyToOne(cascade={ CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional=false)
	@JoinColumn(name="receiveID")
	private Receive receive;

	public int getReceiveDetailID() {
		return receiveDetailID;
	}

	public void setReceiveDetailID(int receiveDetailID) {
		this.receiveDetailID = receiveDetailID;
	}

	public String getReceiveColor() {
		return receiveColor;
	}

	public void setReceiveColor(String receiveColor) {
		this.receiveColor = receiveColor;
	}

	public int getReceiveXS() {
		return receiveXS;
	}

	public void setReceiveXS(int receiveXS) {
		this.receiveXS = receiveXS;
	}

	public int getReceiveS() {
		return receiveS;
	}

	public void setReceiveS(int receiveS) {
		this.receiveS = receiveS;
	}

	public int getReceiveM() {
		return receiveM;
	}

	public void setReceiveM(int receiveM) {
		this.receiveM = receiveM;
	}

	public int getReceiveL() {
		return receiveL;
	}

	public void setReceiveL(int receiveL) {
		this.receiveL = receiveL;
	}

	public int getReceiveXL() {
		return receiveXL;
	}

	public void setReceiveXL(int receiveXL) {
		this.receiveXL = receiveXL;
	}

	public int getReceiveXXL() {
		return receiveXXL;
	}

	public void setReceiveXXL(int receiveXXL) {
		this.receiveXXL = receiveXXL;
	}

	public int getReceiveTotal() {
		return receiveTotal;
	}

	public void setReceiveTotal(int receiveTotal) {
		this.receiveTotal = receiveTotal;
	}

	public Receive getReceive() {
		return receive;
	}

	public void setReceive(Receive receive) {
		this.receive = receive;
	}
	
	

}
