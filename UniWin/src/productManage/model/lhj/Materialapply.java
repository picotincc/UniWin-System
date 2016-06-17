package productManage.model.lhj;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import productManage.model.User;
import productManage.model.wjx.MaterialOutput;

@Entity
@Table (name="materialapply")

public class Materialapply implements Serializable{

	@Id
	private int materialApplyID;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
	@JoinColumn(name="materialCode")
	private Material material;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "userId")
	private User user;
	
	private String materialApplyCode;
	
	private float materialApplyVol;
	
	private Date matrialApplyDate;
	
	private String applyComment;
	
	/*
	 * 一对多关系：和MaterialOutput相关联
	 */
	@OneToMany(targetEntity=MaterialOutput.class,mappedBy="materialApply",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	private Set<MaterialOutput> materialOutputs = new HashSet<MaterialOutput>();
	
	public int getMaterialApplyID() {
		return materialApplyID;
	}


	public User getUser() {
		return user;
	}

	public String getMaterialApplyCode() {
		return materialApplyCode;
	}

	public float getMaterialApplyVol() {
		return materialApplyVol;
	}

	public Date getMatrialApplyDate() {
		return matrialApplyDate;
	}

	public String getApplyComment() {
		return applyComment;
	}

	public void setMaterialApplyID(int materialApplyID) {
		this.materialApplyID = materialApplyID;
	}


	public void setUser(User user) {
		this.user = user;
	}

	public void setMaterialApplyCode(String materialApplyCode) {
		this.materialApplyCode = materialApplyCode;
	}

	public void setMaterialApplyVol(float materialApplyVol) {
		this.materialApplyVol = materialApplyVol;
	}

	public void setMatrialApplyDate(Date matrialApplyDate) {
		this.matrialApplyDate = matrialApplyDate;
	}

	public void setApplyComment(String applyComment) {
		this.applyComment = applyComment;
	}


	public Material getMaterial() {
		return material;
	}


	public void setMaterial(Material material) {
		this.material = material;
	}


	public Set<MaterialOutput> getMaterialOutputs() {
		return materialOutputs;
	}


	public void setMaterialOutputs(Set<MaterialOutput> materialOutputs) {
		this.materialOutputs = materialOutputs;
	}
	

	
}
