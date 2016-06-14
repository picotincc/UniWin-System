package productManage.model.wjx;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import productManage.model.lhj.Material;
import productManage.model.lhj.WareHouse;

/**
 * @author wjx
 * @date 创建时间2016-3-2
 */
@Entity
@Table(name="store")
//@IdClass(StorePK.class)
public class Store implements Serializable{
    
    @ManyToOne(targetEntity=WareHouse.class)
    @JoinColumn(name = "warehouseid")
    @Id
    private WareHouse warehouse;

    @ManyToOne(targetEntity=Material.class)
    @JoinColumn(name = "materialCode")
    @Id
    private Material material;
    
    private float remainVol;
    private float frozenVol;
    
//    /**
//     * 临时变量：用于记录某商品响应某出库单某仓库的实际出库总量
//     */
//    @Transient
//    private float actualOutVol;
    
    
    public Store(WareHouse warehouse, Material material, float remainVol,
			float frozenVol) {
		super();
		this.warehouse = warehouse;
		this.material = material;
		this.remainVol = remainVol;
		this.frozenVol = frozenVol;
	}
	public Store(){
        
    }
    public float getRemainVol() {
        return remainVol;
    }
    public void setRemainVol(float remainVol) {
        this.remainVol = remainVol;
    }
    public float getFrozenVol() {
        return frozenVol;
    }
    public void setFrozenVol(float frozenVol) {
        this.frozenVol = frozenVol;
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
    
//	public float getActualOutVol() {
//		Set<MaterialOutput> outputs = material.getMaterialOutputs();
//		Iterator<MaterialOutput> it = outputs.iterator();
//		MaterialOutput temp;
//		float sum = 0;
//		while(it.hasNext()){
//			temp = it.next();
//			if(temp.getWarehouse().getWarehouseid() == this.warehouse.getWarehouseid()){
//				sum+=temp.getMaterialOutputVol();
//			}
//		}
//		return sum;
//	}
//	public void setActualOutVol(float actualOutVol) {
//		this.actualOutVol = actualOutVol;
//	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((material == null) ? 0 : material.hashCode());
		result = prime * result
				+ ((warehouse == null) ? 0 : warehouse.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Store other = (Store) obj;
		if (material == null) {
			if (other.material != null)
				return false;
		} else if (!material.equals(other.material))
			return false;
		if (warehouse == null) {
			if (other.warehouse != null)
				return false;
		} else if (!warehouse.equals(other.warehouse))
			return false;
		return true;
	}
    
}
