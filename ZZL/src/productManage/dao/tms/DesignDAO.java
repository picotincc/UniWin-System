package productManage.dao.tms;

import java.util.Date;
import java.util.List;

import productManage.model.tms.Design;

public interface DesignDAO {
	public void addDesign(Design design);
	public void quitDesign(String designId);
	public List<Design> findAll();
	public List<Design> findByDate(Date date);
	public Design findByCode(String Code);
	public Design findById(String id);
	public List<Design> findByKey(String key);
}
