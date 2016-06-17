package productManage.dao.yrd.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.yrd.PhaseConditionDao;
import productManage.model.yrd.PhaseCondition;
import productManage.model.yrd.TechniqueCondition;

/**
 * @author yrd
 * @date 创建时间2016-02-28
 */

@Repository
public class PhaseConditionDaoImpl implements PhaseConditionDao {
	
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<PhaseCondition> findPhaseCondtion(String phaseName,Date date){
		Session session = baseDao.getNewSession();	
		String hql = "from productManage.Model.PhaseCondition as p where p.phaseConditionDate='"+date+"'"
				+ "and p.phaseName='"+phaseName+"'";
		Query query = session.createQuery(hql);
		List<PhaseCondition> list = query.list();
		return list;
	}
	
	@Override
	public List<PhaseCondition> getPhaseConditionByYear(String year,
			String phase){
		Session session = baseDao.getSession();
		String hql = "select p from PhaseCondition as p where p.phaseName = '"+phase+"' and p.phaseConditionDate like '"+year+"%'";
		Query query = session.createQuery(hql);
		List<PhaseCondition> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}		
	}
	
	@Override
	public List<PhaseCondition> getPhaseConditionByMonth(String year,
			String month, String phase){
		Session session = baseDao.getSession();
		String hql = "select p from PhaseCondition as p where p.phaseName = '"+phase+"' and p.phasesConditionDate like '"+year+"-"+month+"%'";
		Query query = session.createQuery(hql);
		List<PhaseCondition> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}		
	}
	
	@Override
	public void add(PhaseCondition phaseCondition){
		baseDao.save(phaseCondition);
	}
}
