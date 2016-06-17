package productManage.model.wcy;



import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import productManage.model.User;
import productManage.model.zky.Production;

/**
 * 质检单
 * @author 王晨宇
 */
@Entity
@Table(name="qc")
public class Qc {
    
	
	@Id
	private int QCID; 
	@ManyToOne(cascade=CascadeType.ALL,optional=true)
	@JoinColumn(name="userId")
	private User user;
	
	//private int userId;
	//private int productionID;
	@ManyToOne(cascade=CascadeType.ALL,optional=true)
	@JoinColumn(name="productionID")
	private Production production;
	private String QCComment;
	private String QCStages;
	private String QCDesignateTime;
	private String QCState;
	private String QCResult;
	private String QCCode;
	
	
	public int getQCID() {
		return QCID;
	}
	public void setQCID(int qCID) {
		this.QCID = qCID;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Production getProduction() {
		return production;
	}
	public void setProduction(Production production) {
		this.production = production;
	}
	public String getQCComment() {
		return QCComment;
	}
	
	public void setQCComment(String qCComment) {
		this.QCComment = qCComment;
	}
	public String getQCStages() {
		return QCStages;
	}
	public void setQCStages(String qCStages) {
		this.QCStages = qCStages;
	}
	public String getQCDesignateTime() {
		return QCDesignateTime;
	}
	public String getQCCode() {
		return QCCode;
	}
	public void setQCCode(String qCCode) {
		QCCode = qCCode;
	}
	public void setQCDesignateTime(String qCDesignateTime) {
		this.QCDesignateTime = qCDesignateTime;
	}
	public String getQCState() {
		return QCState;
	}
	public void setQCState(String qCState) {
		this.QCState = qCState;
	}
	public String getQCResult() {
		return QCResult;
	}
	public void setQCResult(String qCResult) {
		this.QCResult = qCResult;
	}
	
	
	
}
