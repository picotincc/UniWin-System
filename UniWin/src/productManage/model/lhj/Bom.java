package productManage.model.lhj;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import productManage.model.tms.Design;
import productManage.model.wjx.Store;

@Entity
@Table(name="bom")
public class Bom implements Serializable{

	@ManyToOne(targetEntity=Design.class)
    @JoinColumn(name = "designID")
    @Id
	private Design design;
	
	@ManyToOne(targetEntity=Material.class)
    @JoinColumn(name = "materialCode")
    @Id
	private Material material;
	private float volPerDesign;
	private String materialPosition;
	
	
	public Bom(){
		
	}
	public Bom(Design design,Material material,float volPerDesign,String materialPosition){
		this.design = design;
		this.material = material;
		this.volPerDesign = volPerDesign;
		this.materialPosition = materialPosition;
	}

	public float getVolPerDesign() {
		return volPerDesign;
	}

	public String getMaterialPosition() {
		return materialPosition;
	}

	public Design getDesign() {
		return design;
	}

	public Material getMaterial() {
		return material;
	}

	public void setDesign(Design design) {
		this.design = design;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}
	
	public void setVolPerDesign(float volPerDesign) {
		this.volPerDesign = volPerDesign;
	}

	public void setMaterialPosition(String materialPosition) {
		this.materialPosition = materialPosition;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((material == null) ? 0 : material.hashCode());
		result = prime * result
				+ ((design == null) ? 0 : design.hashCode());
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
		Bom other = (Bom) obj;
		if (material == null) {
			if (other.material != null)
				return false;
		} else if (!material.equals(other.material))
			return false;
		if (design == null) {
			if (other.design != null)
				return false;
		} else if (!design.equals(other.design))
			return false;
		return true;
	}
	
}
