package productManage.model.lhj;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name="supply")

public class Supply {

	@Id
	private int supplyId;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="vendorId")  //外键
	private Vendor vendor;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="materialCode")  //外键
	private Material material;
	
	public Supply(){}
	
	public Supply(Vendor vendor,Material material){
		this.vendor = vendor;
		this.material = material;
	}
	
	public int getSupplyId() {
		return supplyId;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public Material getMaterial() {
		return material;
	}

	public void setSupplyId(int supplyId) {
		this.supplyId = supplyId;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}
	
}
