package productManage.service.technique;
/**
 * @author TMS
 * @date 2016-2-29
 */


import java.util.List;

import productManage.model.tms.SpecificTechnique;
import productManage.model.tms.Technique;
import productManage.model.tms.TechniqueInventory;

public interface TechniqueService {
	
	public List<Technique> getAll();
	/*
	public Technique getByID(String id);
	public List<Technique> getByDate(Date date);
	*/
	public void save(Technique technique);
	public void save(SpecificTechnique specificTechnique);
	public void save(TechniqueInventory techniqueInventory);
}
