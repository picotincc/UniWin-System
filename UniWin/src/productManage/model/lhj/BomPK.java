package productManage.model.lhj;

import java.io.Serializable;

import javax.persistence.Embeddable;

import productManage.model.tms.Design;
import productManage.model.wjx.StorePK;

@Embeddable
public class BomPK implements Serializable{
	
	private Design Design;

	private Material material;
	
	public BomPK(){
		
	}
	
	public BomPK(Design Design,Material material){
		this.Design = Design;
		this.material = material;
	}
	
    
    public Design getDesign() {
		return Design;
	}

	public Material getMaterial() {
		return material;
	}

	public void setDesign(Design design) {
		Design = design;
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
                + ((Design == null) ? 0 : Design.hashCode());
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
        BomPK other = (BomPK) obj;
        if (material == null) {
            if (other.material != null)
                return false;
        } else if (!material.equals(other.material))
            return false;
        if (Design == null) {
            if (other.Design != null)
                return false;
        } else if (!Design.equals(other.Design))
            return false;
        return true;
    }
}
