package productManage.dao.yrd;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import productManage.model.yrd.ModelCondition;

/**
 * @author yrd
 * @date 创建时间2016-02-28
 */ 

@Repository
public interface ModelConditionDao {

	public List<ModelCondition> findModelCondtion(Date date);
	
	public List<ModelCondition> getModelConditionByYear(String year);

	public List<ModelCondition> getModelConditionByMonth(String year,String month);
	
	public void add(ModelCondition modelCondition);
	
}
