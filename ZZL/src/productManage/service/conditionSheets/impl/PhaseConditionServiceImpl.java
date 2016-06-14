package productManage.service.conditionSheets.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.yrd.PhaseConditionDao;
import productManage.model.yrd.PhaseCondition;
import productManage.service.conditionSheets.PhaseConditionService;

@Service
public class PhaseConditionServiceImpl implements PhaseConditionService {

	@Autowired
	private PhaseConditionDao phaseConditionDao;
	
	@Override
	public List<PhaseCondition> getPhaseConditionByYear(String year, String phase){
		return phaseConditionDao.getPhaseConditionByYear(year,phase);
	}
	
	@Override
	public List<PhaseCondition> getPhaseConditionByMonth(String year,String month, String phase){
		return phaseConditionDao.getPhaseConditionByMonth(year,month,phase);
	}
	
	@Override
	public void addPhaseCondition(PhaseCondition phaseCondition){
		phaseConditionDao.add(phaseCondition);
	}
	
}
