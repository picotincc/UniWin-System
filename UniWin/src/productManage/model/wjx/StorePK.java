package productManage.model.wjx;

import java.io.Serializable;

import javax.persistence.Embeddable;

import productManage.model.lhj.Material;
import productManage.model.lhj.WareHouse;

@Embeddable
public class StorePK implements Serializable{
    private WareHouse warehouse;
    
    private Material material;
    
    public StorePK(){
        
    }

    public StorePK(WareHouse warehouse, Material material) {
        super();
        this.warehouse = warehouse;
        this.material = material;
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
        StorePK other = (StorePK) obj;
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
