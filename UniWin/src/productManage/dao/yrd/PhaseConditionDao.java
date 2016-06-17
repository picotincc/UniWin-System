package productManage.dao.yrd;

import java.util.Date;
import java.util.List;

import productManage.model.yrd.PhaseCondition;

/**
 * @author yrd
 * @date 创建时间2016-02-28
 */

public interface PhaseConditionDao {

	public List<PhaseCondition> findPhaseCondtion(String phaseName,Date date);

	public List<PhaseCondition> getPhaseConditionByYear(String year,
			String phase);

	public List<PhaseCondition> getPhaseConditionByMonth(String year,
			String month, String phase);
	
	public void add(PhaseCondition phaseCondition);	
}
