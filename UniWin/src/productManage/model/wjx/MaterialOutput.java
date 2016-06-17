package productManage.model.wjx;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import productManage.model.User;
import productManage.model.lhj.Material;
import productManage.model.lhj.Materialapply;
import productManage.model.lhj.WareHouse;
/**
 * @author wjx
 * @date 创建时间2016-3-2
 */
@Entity
@Table(name="materialoutput")
public class MaterialOutput implements Serializable{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY) 
    private int materialOutputID;
    
    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
    @JoinColumn(name="warehouseid")
    private WareHouse warehouse;
    
    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
    @JoinColumn(name="materialCode")
    private Material material;
    
    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
    @JoinColumn(name="userId",nullable=true)//由于暂时没有用户登录，因此暂时可以为空以方便插入
    private User user;
    
    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
    @JoinColumn(name="materialApplyID")
    private Materialapply materialApply;
    
    @Column
    private Date materialOutputDate;
    @Column
    private int materialOutputVol;
    @Column
    private String materialOutputComment;
    
    public MaterialOutput(int materialOutputID, WareHouse warehouse,
			Material material, User user, Materialapply materialApply,
			Date materialOutputDate, int materialOutputVol,
			String materialOutputComment) {
		super();
		this.materialOutputID = materialOutputID;
		this.warehouse = warehouse;
		this.material = material;
		this.user = user;
		this.materialApply = materialApply;
		this.materialOutputDate = materialOutputDate;
		this.materialOutputVol = materialOutputVol;
		this.materialOutputComment = materialOutputComment;
	}
	public MaterialOutput(){
    	
    }
    public int getMaterialOutputID() {
        return materialOutputID;
    }
    public void setMaterialOutputID(int materialOutputID) {
        this.materialOutputID = materialOutputID;
    }
    public WareHouse getWarehouse() {
        return warehouse;
    }
    public void setWarehouse(WareHouse warehouse) {
        this.warehouse = warehouse;
    }
    public Material getMaterial() {
        return material;
    }
    public void setMaterial(Material material) {
        this.material = material;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Date getMaterialOutputDate() {
        return materialOutputDate;
    }
    public void setMaterialOutputDate(Date materialOutputDate) {
        this.materialOutputDate = materialOutputDate;
    }
    public int getMaterialOutputVol() {
        return materialOutputVol;
    }
    public void setMaterialOutputVol(int materialOutputVol) {
        this.materialOutputVol = materialOutputVol;
    }
    public String getMaterialOutputComment() {
        return materialOutputComment;
    }
    public void setMaterialOutputComment(String materialOutputComment) {
        this.materialOutputComment = materialOutputComment;
    }
    
	public Materialapply getMaterialApply() {
		return materialApply;
	}
	public void setMaterialApply(Materialapply materialApply) {
		this.materialApply = materialApply;
	}
	@Override
	public String toString() {
		return "MaterialOutput [materialOutputID=" + materialOutputID
				+ ", warehouse=" + warehouse + ", material=" + material
				+ ", user=" + user + ", materialApply=" + materialApply
				+ ", materialOutputDate=" + materialOutputDate
				+ ", materialOutputVol=" + materialOutputVol
				+ ", materialOutputComment=" + materialOutputComment + "]";
	}
    
    
}
