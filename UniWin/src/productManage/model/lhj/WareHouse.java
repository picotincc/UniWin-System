package productManage.model.lhj;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import productManage.model.wjx.MaterialInput;
import productManage.model.wjx.MaterialOutput;
import productManage.model.wjx.Store;

@Entity
@Table (name="warehouse")

public class WareHouse implements Serializable{
	
	@Id
	private int warehouseid;
	
	private String location;
	
	private int maxCapacity;
	
	/**
	 * 入库单的集合
	 */
	@OneToMany(mappedBy="warehouse",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    private Set<MaterialInput> materialInputs=new HashSet<MaterialInput>();
	
	/**
	 * 出库单的集合
	 */
	@OneToMany(mappedBy="warehouse",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    private Set<MaterialOutput> materialOnputs=new HashSet<MaterialOutput>();
	
	/**
     * 仓库物料对应表的集合
     */
    @OneToMany(mappedBy="warehouse",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    private Set<Store> stores=new HashSet<Store>();
    
    /**
     * 非持久化变量：用于保存可用库存数
     */
    @Transient
    private float remain;
    
	public int getWarehouseid() {
		return warehouseid;
	}

	public String getLocation() {
		return location;
	}

	public int getMaxCapacity() {
		return maxCapacity;
	}

	public void setWarehouseid(int warehouseid) {
		this.warehouseid = warehouseid;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setMaxCapacity(int maxCapacity) {
		this.maxCapacity = maxCapacity;
	}

    public Set<MaterialInput> getMaterialInputs() {
        return materialInputs;
    }

    public void setMaterialInputs(Set<MaterialInput> materialInputs) {
        this.materialInputs = materialInputs;
    }

    public Set<MaterialOutput> getMaterialOnputs() {
        return materialOnputs;
    }

    public void setMaterialOnputs(Set<MaterialOutput> materialOnputs) {
        this.materialOnputs = materialOnputs;
    }

    public Set<Store> getStores() {
        return stores;
    }

    public void setStores(Set<Store> stores) {
        this.stores = stores;
    }

	public float getRemain() {
		float sum = 0;
		Iterator<Store> it = stores.iterator();
		while(it.hasNext()){
			sum+=it.next().getRemainVol();
		}
		return this.maxCapacity - sum;
	}

	public void setRemain(float remain) {
		this.remain = remain;
	}

	public WareHouse(int warehouseid, String location, int maxCapacity,
			Set<MaterialInput> materialInputs,
			Set<MaterialOutput> materialOnputs, Set<Store> stores, float remain) {
		super();
		this.warehouseid = warehouseid;
		this.location = location;
		this.maxCapacity = maxCapacity;
		this.materialInputs = materialInputs;
		this.materialOnputs = materialOnputs;
		this.stores = stores;
		this.remain = remain;
	}
	
	public WareHouse(){
		
	}
    
}
