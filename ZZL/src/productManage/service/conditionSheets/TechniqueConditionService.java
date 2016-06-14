package productManage.service.conditionSheets;

import java.util.List;

import productManage.model.yrd.TechniqueCondition;

public interface TechniqueConditionService {
	
	public List<TechniqueCondition> getTechniqueConditionByYear(String year);
	
	public List<TechniqueCondition> getTechniqueConditionByMonth(String year,String month);
	
	public void addTechniqueCondition(TechniqueCondition techniqueCondition);

}
