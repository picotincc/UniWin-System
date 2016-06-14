package productManage.dao.yrd;

import java.util.Date;
import java.util.List;

import productManage.model.yrd.TechniqueCondition;

/**
 * @author yrd
 * @date 创建时间2016-02-28
 */

public interface TechniqueConditionDao {
	
	public List<TechniqueCondition> findTechniqueCondtion(Date date);
	
	public List<TechniqueCondition> getTechniqueConditionByYear(String year);

	public List<TechniqueCondition> getTechniqueConditionByMonth(String year,String month);
	
	public void add(TechniqueCondition techniqueCondition);

}
