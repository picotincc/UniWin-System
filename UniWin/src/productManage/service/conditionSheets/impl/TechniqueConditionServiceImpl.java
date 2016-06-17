package productManage.service.conditionSheets.impl;

import java.util.List;

import org.apache.naming.java.javaURLContextFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.yrd.TechniqueConditionDao;
import productManage.model.yrd.TechniqueCondition;
import productManage.service.conditionSheets.TechniqueConditionService;

@Service
public class TechniqueConditionServiceImpl implements TechniqueConditionService{
	
	@Autowired
	private TechniqueConditionDao techniqueConditionDao;
	
	@Override
	public List<TechniqueCondition> getTechniqueConditionByYear(String year){		
		return techniqueConditionDao.getTechniqueConditionByYear(year);
	}
	
	@Override
	public List<TechniqueCondition> getTechniqueConditionByMonth(String year,String month){		
		return techniqueConditionDao.getTechniqueConditionByMonth(year,month);
	}
	
	@Override
	public void addTechniqueCondition(TechniqueCondition techniqueCondition){
		techniqueConditionDao.add(techniqueCondition);
	}
	
}
