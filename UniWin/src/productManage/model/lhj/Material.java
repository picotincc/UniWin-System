package productManage.model.lhj;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.Transient;

import productManage.model.tms.Design;
import productManage.model.wjx.MaterialInput;
import productManage.model.wjx.MaterialOutput;
import productManage.model.wjx.Store;

/**
 * 物料表
 * @author WHQ
 * @date 2016-03-02
 */

@Entity
@Table(name="material")
public class Material implements Serializable{
    
    private String materialCode;      //物料编号
    private String materialName;    //物料名称
    private String materialType;        //物料类型
    private String colorCode;           //色号
    private String colorDescription;    //颜色说明
    private String materialIngredient;      //物料成分
    private float unitPrice;        //单价
    private String unit;        //单位
    private float width;        //门幅
    private float outputVol;        //出量
    private Date modificationDate;      //修改时间
    
    /**
     * 物料的详细类型 --by szl
     */
    private String shellAccessoryType;
    
    /**
     * 入库单的集合
     */
    private Set<MaterialInput> materialInputs=new HashSet<MaterialInput>();
    
    /**
     * 出库单的集合
     */
    private Set<MaterialOutput> materialOutputs=new HashSet<MaterialOutput>();
    
    /**
     * 物料仓库对应表的集合
     */
    private Set<Store> stores=new HashSet<Store>();
    
    /**
     * 款式物料对应表集合:LHJ
     */
    
//    @JoinTable(name="bom",joinColumns={@JoinColumn(name="materialCode", referencedColumnName="materialCode")},inverseJoinColumns={@JoinColumn(name="designID", referencedColumnName="designID")})
    private Set<Bom> boms=new HashSet<Bom>();
    
    /**
     * 供应（商物料对应）表:LHJ
     */
    private Set<Supply> supplys=new HashSet<Supply>();
    
    /**
     * MaterialApply集合
     */
    private Set<Materialapply> materialApplys = new HashSet<Materialapply>();

    
    /**
     * 临时变量：用于计算出该物料的所有申请出仓总数
     * by wjx
     */
    @Transient
    private float applySum;
    
	@Id
    public String getMaterialCode() {
        return materialCode;
    }
    public void setMaterialCode(String materialCode) {
        this.materialCode = materialCode;
    }
    public String getMaterialName() {
        return materialName;
    }
    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }
    public String getMaterialType() {
        return materialType;
    }
    public void setMaterialType(String materialType) {
        this.materialType = materialType;
    }
    public String getColorCode() {
        return colorCode;
    }
    public void setColorCode(String colorCode) {
        this.colorCode = colorCode;
    }
    public String getColorDescription() {
        return colorDescription;
    }
    public void setColorDescription(String colorDescription) {
        this.colorDescription = colorDescription;
    }
    public String getMaterialIngredient() {
        return materialIngredient;
    }
    public void setMaterialIngredient(String materialIngredient) {
        this.materialIngredient = materialIngredient;
    }
    public float getUnitPrice() {
        return unitPrice;
    }
    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }
    public String getUnit() {
        return unit;
    }
    public void setUnit(String unit) {
        this.unit = unit;
    }
    public float getWidth() {
        return width;
    }
    public void setWidth(float width) {
        this.width = width;
    }
    public float getOutputVol() {
        return outputVol;
    }
    public void setOutputVol(float outputVol) {
        this.outputVol = outputVol;
    }
    public Date getModificationDate() {
        return modificationDate;
    }
    public void setModificationDate(Date modificationDate) {
        this.modificationDate = modificationDate;
    }
    
    public Material() {
    }
    public Material(String materialCode, String materialName,
            String materialType, String colorCode, String colorDescription,
            String materialIngredient, float unitPrice, String unit,
            float width, float outputVol, Date modificationDate) {
        super();
        this.materialCode = materialCode;
        this.materialName = materialName;
        this.materialType = materialType;
        this.colorCode = colorCode;
        this.colorDescription = colorDescription;
        this.materialIngredient = materialIngredient;
        this.unitPrice = unitPrice;
        this.unit = unit;
        this.width = width;
        this.outputVol = outputVol;
        this.modificationDate = modificationDate;
    }
    
	@OneToMany(mappedBy="material",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    public Set<MaterialInput> getMaterialInputs() {
        return materialInputs;
    }
    public void setMaterialInputs(Set<MaterialInput> materialInputs) {
        this.materialInputs = materialInputs;
    }
    
    @OneToMany(targetEntity=MaterialOutput.class,mappedBy="material",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    public Set<MaterialOutput> getMaterialOutputs() {
        return materialOutputs;
    }
    public void setMaterialOutputs(Set<MaterialOutput> materialOutputs) {
        this.materialOutputs = materialOutputs;
    }
    
    @OneToMany(targetEntity=Store.class,mappedBy="material")    
    public Set<Store> getStores() {
        return stores;
    }
    public void setStores(Set<Store> stores) {
        this.stores = stores;
    }
    
	
    @OneToMany(mappedBy="material",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)    
	public Set<Supply> getSupplys() {
		return supplys;
	}
	public void setSupplys(Set<Supply> supplys) {
		this.supplys = supplys;
	}
	
	@OneToMany(mappedBy="material",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	public Set<Bom> getBoms() {
		return boms;
	}
	public void setBoms(Set<Bom> boms) {
		this.boms = boms;
	}
	@OneToMany(mappedBy="material",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
	public Set<Materialapply> getMaterialApplys() {
		return materialApplys;
	}
	public void setMaterialApplys(Set<Materialapply> materialApplys) {
		this.materialApplys = materialApplys;
	}
	public float getApplySum() {
		float sum = 0;
		for(Materialapply al:materialApplys){
			sum+=al.getMaterialApplyVol();
		}
		return sum;
	}
	public void setApplySum(float applySum) {
		this.applySum = applySum;
	}
	public String getShellAccessoryType() {
		return shellAccessoryType;
	}
	public void setShellAccessoryType(String shellAccessoryType) {
		this.shellAccessoryType = shellAccessoryType;
	}
}
