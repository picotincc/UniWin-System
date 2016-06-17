package productManage.model.tms;
/**
 * @author tms
 * @date 创建时间2016-02-27
 */
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="specificTechnique")
//具体工艺表
public class SpecificTechnique {
	public SpecificTechnique(int specificTechID, int techID,
			String specificTechPartName, String specificTechnique) {
		super();
		this.specificTechID = specificTechID;
		this.techID = techID;
		this.specificTechPartName = specificTechPartName;
		this.specificTechnique = specificTechnique;
	}

	public SpecificTechnique() {
		// TODO Auto-generated constructor stub
	}
	@Id
	private int specificTechID;
	public int getSpecificTechID(){
		return specificTechID;
	}
	public void setSpecificTechID(int SpecifictechID){
		this.specificTechID = SpecifictechID;
	}
	
	//款式工艺单id
	private int techID;
	//部位名称
	private String specificTechPartName;
	//具体工艺
	private String specificTechnique;
	
	public int getTechID() {
		return techID;
	}
	public void setTechID(int techID) {
		this.techID = techID;
	}
	public String getSpecificTechPartName() {
		return specificTechPartName;
	}
	public void setSpecificTechPartName(String specificTechPartName) {
		this.specificTechPartName = specificTechPartName;
	}
	public String getSpecificTechnique() {
		return specificTechnique;
	}
	public void setSpecificTechnique(String specificTechnique) {
		this.specificTechnique = specificTechnique;
	}

	
}
