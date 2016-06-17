package productManage.service.conditionSheets;

import java.util.List;

import productManage.model.yrd.ModelCondition;

public interface ModelConditionService {

	public List<ModelCondition> getModelConditionByYear(String date);
	
	public List<ModelCondition> getModelConditionByMonth(String year,String month);
	
	public void addModelCondition(ModelCondition modelCondition);
	

}
