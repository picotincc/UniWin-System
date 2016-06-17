package productManage.model.zky;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import productManage.model.User;
import productManage.model.yk.OrderDetail;

/**
 * 裁剪单
 * 
 * @author 克崽兽EX
 * 
 */
@Entity
@Table(name = "tailor")
public class Tailor implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	private int tailorID;

	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional = true)
	@JoinColumn(name = "tailorModelMakerID")
	private User tailormodelmaker;

	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional = false)
	@JoinColumn(name = "productionID")
	private Production production;

	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST,
			CascadeType.REFRESH }, optional = true)
	@JoinColumn(name = "tailorTailID")
	private User tailor;

	@Column(name = "actualTailorXS")
	private int actualTailorXS;

	@Column(name = "actualTailorS")
	private int actualTailorS;

	@Column(name = "actualTailorM")
	private int actualTailorM;

	@Column(name = "actualTailorL")
	private int actualTailorL;

	@Column(name = "actualTailorXL")
	private int actualTailorXL;

	@Column(name = "actualTailorXXL")
	private int actualTailorXXL;

	@Transient
	private int tailorActualVol;

	@Column(name = "tailorStartingTime")
	private Timestamp tailorStartingTime;

	@Column(name = "tailorEndTime")
	private Timestamp tailorEndTime;

	@OneToOne(targetEntity = OrderDetail.class,optional = true)
	@JoinColumn(name = "orderDetailID", referencedColumnName = "orderDetailID" )
	private OrderDetail orderDetail;

	public Tailor() {
	}

	public Tailor(int tailorID, User tailormodelmaker, Production production, User tailor, Timestamp tailorStartingTime,
			Timestamp tailorEndTime) {
		super();
		this.tailorID = tailorID;
		this.tailormodelmaker = tailormodelmaker;
		this.production = production;
		this.tailor = tailor;
		this.tailorStartingTime = tailorStartingTime;
		this.tailorEndTime = tailorEndTime;
	}

	/**
	 * 
	 * @return 裁剪单ID
	 */
	public int getTailorID() {
		return tailorID;
	}

	public void setTailorID(int tailorID) {
		this.tailorID = tailorID;
	}

	/**
	 * 
	 * @return 实际剪裁数量
	 */
	public int getTailorActualVol() {
		return this.getActualTailorL() + this.getActualTailorXL() + this.getActualTailorM() + this.getActualTailorXXL()
				+ this.getActualTailorXS() + this.getActualTailorS();
	}

	/**
	 * 
	 * @return 开始时间
	 */
	public Timestamp getTailorStartingTime() {
		return tailorStartingTime;
	}

	public void setTailorStartingTime(Timestamp tailorStartingTime) {
		this.tailorStartingTime = tailorStartingTime;
	}

	/**
	 * 
	 * @return 生产单
	 */
	public Production getProduction() {
		return production;
	}

	public void setProduction(Production production) {
		this.production = production;
	}

	/**
	 * 
	 * @return 负责排版员工
	 */
	public User getTailormodelmaker() {
		return tailormodelmaker;
	}

	public void setTailormodelmaker(User tailormodelmaker) {
		this.tailormodelmaker = tailormodelmaker;
	}

	/**
	 * 
	 * @return 负责裁剪员工
	 */
	public User getTailor() {
		return tailor;
	}

	public void setTailor(User tailor) {
		this.tailor = tailor;
	}

	public Timestamp getTailorEndTime() {
		return tailorEndTime;
	}

	public void setTailorEndTime(Timestamp tailorEndTime) {
		this.tailorEndTime = tailorEndTime;
	}

	public int getActualTailorXS() {
		return actualTailorXS;
	}

	public void setActualTailorXS(int actualTailorXS) {
		if (actualTailorXS >= 0)
			this.actualTailorXS = actualTailorXS;
	}

	public int getActualTailorS() {
		return actualTailorS;
	}

	public void setActualTailorS(int actualTailorS) {
		if (actualTailorS >= 0)
			this.actualTailorS = actualTailorS;
	}

	public int getActualTailorM() {
		return actualTailorM;
	}

	public void setActualTailorM(int actualTailorM) {
		if (actualTailorM >= 0)
			this.actualTailorM = actualTailorM;
	}

	public int getActualTailorL() {
		return actualTailorL;
	}

	public void setActualTailorL(int actualTailorL) {
		if (actualTailorL >= 0)
			this.actualTailorL = actualTailorL;
	}

	public int getActualTailorXL() {
		return actualTailorXL;
	}

	public void setActualTailorXL(int actualTailorXL) {
		if (actualTailorXL >= 0)
			this.actualTailorXL = actualTailorXL;
	}

	public int getActualTailorXXL() {
		return actualTailorXXL;
	}

	public void setActualTailorXXL(int actualTailorXXL) {
		if (actualTailorXXL >= 0)
			this.actualTailorXXL = actualTailorXXL;
	}

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

}
