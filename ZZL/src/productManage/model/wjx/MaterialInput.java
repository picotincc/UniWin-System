package productManage.model.wjx;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import productManage.model.User;
import productManage.model.lhj.Material;
import productManage.model.lhj.WareHouse;
import productManage.model.szl.SupplementMaterial;
import productManage.model.tyc.Purchase;

/**
 * @author wjx
 * @date 创建时间2016-3-2
 */
@Entity
@Table(name="materialinput")
public class MaterialInput {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY) 
    private int materialInputID;
    
    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "warehouseid")
    private WareHouse warehouse;
    
    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "materialCode")
    private Material material;
    
    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "userId")
    private User user;
    
    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
    @JoinColumn(name = "purchaseID")
    private Purchase purchase;//采购单
    
    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = true)
    @JoinColumns({
    @JoinColumn(name = "supplement"),
    @JoinColumn(name = "material")  
    })
    private SupplementMaterial supplementMaterial;//补料物料表
    
    @Column
    private Date materialInputDate;
    @Column
    private int materialInputVol;
    @Column
    private String materialInputComment;
    
    
    public MaterialInput(int materialInputID, WareHouse warehouse,
            Material materialCode, User user, Purchase purchase,
            SupplementMaterial supplement, Date materialInputDate, int materialInputVol,
            String materialInputComment) {
        super();
        this.materialInputID = materialInputID;
        this.warehouse = warehouse;
        this.material = materialCode;
        this.user = user;
        this.purchase = purchase;
        this.supplementMaterial = supplement;
        this.materialInputDate = materialInputDate;
        this.materialInputVol = materialInputVol;
        this.materialInputComment = materialInputComment;
    }
    public MaterialInput(){
    	
    }
    public int getMaterialInputID() {
        return materialInputID;
    }
    public void setMaterialInputID(int materialInputID) {
        this.materialInputID = materialInputID;
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
    
    public Purchase getPurchase() {
        return purchase;
    }
    public void setPurchase(Purchase purchase) {
        this.purchase = purchase;
    }
    
    public SupplementMaterial getSupplementMaterial() {
        return supplementMaterial;
    }
    public void setSupplementMaterial(SupplementMaterial supplementMaterial) {
        this.supplementMaterial = supplementMaterial;
    }
    public Date getMaterialInputDate() {
        return materialInputDate;
    }
    public void setMaterialInputDate(Date materialInputDate) {
        this.materialInputDate = materialInputDate;
    }
    public int getMaterialInputVol() {
        return materialInputVol;
    }
    public void setMaterialInputVol(int materialInputVol) {
        this.materialInputVol = materialInputVol;
    }
    public String getMaterialInputComment() {
        return materialInputComment;
    }
    public void setMaterialInputComment(String materialInputComment) {
        this.materialInputComment = materialInputComment;
    }
    public Material getMaterialCode() {
        return material;
    }
    public void setMaterialCode(Material materialCode) {
        this.material = materialCode;
    }
    
    
}
