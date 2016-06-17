package productManage.model.szl;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import productManage.model.lhj.Supply;
import productManage.model.wjx.MaterialInput;

/**
 * 补料物料表
 * @author SZL
 * @date 2016-03-05
 */

@Entity
@Table(name="supplementMaterial")
public class SupplementMaterial implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@ManyToOne(targetEntity=Supplement.class)
	@JoinColumn(name="supplementID")
	@Id
	private Supplement supplement;
	
	@ManyToOne(targetEntity=Supply.class)
	@JoinColumn(name="supplyID")
	@Id	
	private Supply supply;
	
	private String materialSpecification; //规格
	
	private int materialVol; //数量
	
	private String supUsage; //补充用途
	
	/**
	 * 出库单的集合
	 */
	@OneToMany(mappedBy="supplementMaterial",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)
    private Set<MaterialInput> materialInputs=new HashSet<MaterialInput>();
	

    
	    public String getMaterialSpecification(){
	    	return materialSpecification;
	    }
	    
	    public void setMaterialSpecification(String materialSpecification){
	    	this.materialSpecification=materialSpecification;
	    }
	    
	    public String getSupUsage(){
	    	return supUsage;
	    }
	    
	    public void setSupUsage(String supUsage){
	    	this.supUsage=supUsage;
	    }

		public int getMaterialVol() {
			return materialVol;
		}

		public void setMaterialVol(int materialVol) {
			this.materialVol = materialVol;
		}

		public Supplement getSupplement() {
			return supplement;
		}

		public void setSupplement(Supplement supplement) {
			this.supplement = supplement;
		}

		public Supply getSupply() {
			return supply;
		}

		public void setSupply(Supply supply) {
			this.supply = supply;
		}

		public Set<MaterialInput> getMaterialInputs() {
			return materialInputs;
		}

		public void setMaterialInputs(Set<MaterialInput> materialInputs) {
			this.materialInputs = materialInputs;
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime
					* result
					+ ((materialInputs == null) ? 0 : materialInputs.hashCode());
			result = prime
					* result
					+ ((materialSpecification == null) ? 0
							: materialSpecification.hashCode());
			result = prime * result + materialVol;
			result = prime * result
					+ ((supUsage == null) ? 0 : supUsage.hashCode());
			result = prime * result
					+ ((supplement == null) ? 0 : supplement.hashCode());
			result = prime * result
					+ ((supply == null) ? 0 : supply.hashCode());
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
			SupplementMaterial other = (SupplementMaterial) obj;
			if (materialInputs == null) {
				if (other.materialInputs != null)
					return false;
			} else if (!materialInputs.equals(other.materialInputs))
				return false;
			if (materialSpecification == null) {
				if (other.materialSpecification != null)
					return false;
			} else if (!materialSpecification
					.equals(other.materialSpecification))
				return false;
			if (materialVol != other.materialVol)
				return false;
			if (supUsage == null) {
				if (other.supUsage != null)
					return false;
			} else if (!supUsage.equals(other.supUsage))
				return false;
			if (supplement == null) {
				if (other.supplement != null)
					return false;
			} else if (!supplement.equals(other.supplement))
				return false;
			if (supply == null) {
				if (other.supply != null)
					return false;
			} else if (!supply.equals(other.supply))
				return false;
			return true;
		}
}
