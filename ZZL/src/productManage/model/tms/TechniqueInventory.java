package productManage.model.tms;
/**
 * @author tms
 * @date 创建时间2016-02-27
 */
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="techniqueInventory")
//工艺清单
public class TechniqueInventory {
	public TechniqueInventory(){
		
	}
	public TechniqueInventory(int techInventoryID, int techid,
			String techInPartName, String techInMCode, float techInTolerance) {
		super();
		this.techInventoryID = techInventoryID;
		this.techid = techid;
		this.techInPartName = techInPartName;
		this.techInMCode = techInMCode;
		this.techInTolerance = techInTolerance;
	}


	@Id
	private int techInventoryID;
	public int getTechInventoryID() {
		return techInventoryID;
	}

	public void setTechInventoryID(int techInventoryID) {
		this.techInventoryID = techInventoryID;
	}
	
	//款式工艺单id
	private int techid;
	//部位名称
	private String techInPartName;
	//M码
	private String techInMCode;
	//公差
	private float techInTolerance;
	
	public int getTechid() {
		return techid;
	}

	public void setTechid(int techid) {
		this.techid = techid;
	}

	public String getTechInPartName() {
		return techInPartName;
	}

	public void setTechInPartName(String techInPartName) {
		this.techInPartName = techInPartName;
	}

	public String getTechInMCode() {
		return techInMCode;
	}

	public void setTechInMCode(String techInMCode) {
		this.techInMCode = techInMCode;
	}

	public float getTechInTolerance() {
		return techInTolerance;
	}

	public void setTechInTolerance(float techInTolerance) {
		this.techInTolerance = techInTolerance;
	}

	
}
