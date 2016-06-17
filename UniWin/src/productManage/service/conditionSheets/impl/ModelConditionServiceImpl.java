package productManage.service.conditionSheets.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.yrd.ModelConditionDao;
import productManage.model.yrd.ModelCondition;
import productManage.model.yrd.TechniqueCondition;
import productManage.service.conditionSheets.ModelConditionService;

@Service
public class ModelConditionServiceImpl implements ModelConditionService {
	
	@Autowired
	private ModelConditionDao modelConditionDao;
	
    @Override
	public List<ModelCondition> getModelConditionByYear(String year){		
		return modelConditionDao.getModelConditionByYear(year);
	}
	
    @Override
	public List<ModelCondition> getModelConditionByMonth(String year,String month){		
		return modelConditionDao.getModelConditionByMonth(year,month);
	}
	
	@Override
	public void addModelCondition(ModelCondition modelCondition){
		modelConditionDao.add(modelCondition);
	}

}
