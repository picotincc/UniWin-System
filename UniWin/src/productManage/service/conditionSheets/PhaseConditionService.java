package productManage.service.conditionSheets;

import java.util.List;

import productManage.model.yrd.PhaseCondition;

public interface PhaseConditionService {

	public List<PhaseCondition> getPhaseConditionByYear(String date, String phase);

	public List<PhaseCondition> getPhaseConditionByMonth(String year,
			String month, String phase);
	
	public void addPhaseCondition(PhaseCondition phaseCondition);
	
}
