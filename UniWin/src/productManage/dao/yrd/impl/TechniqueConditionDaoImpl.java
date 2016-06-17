package productManage.dao.yrd.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.yrd.TechniqueConditionDao;
import productManage.model.yrd.TechniqueCondition;

/**
 * @author yrd
 * @date 创建时间2016-02-28
 */

@Repository
public class TechniqueConditionDaoImpl implements TechniqueConditionDao {
	
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<TechniqueCondition> findTechniqueCondtion(Date date){
		Session session = baseDao.getNewSession();	
		String hql = "from productManage.Model.TechniqueCondition as t where t.TechniqueConditionDate='"+date+"'";
		Query query = session.createQuery(hql);
		List<TechniqueCondition> list = query.list();
		return list;
	}
	
	@Override
	public List<TechniqueCondition> getTechniqueConditionByYear(String year){
		Session session = baseDao.getSession();
		String hql = "select distinct t from TechniqueCondition as t where t.techConditionDate like '"+year+"%'";
		Query query = session.createQuery(hql);
		List<TechniqueCondition> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}		
	}
	
	@Override
	public List<TechniqueCondition> getTechniqueConditionByMonth(String year,String month){
		Session session = baseDao.getSession();
		String hql = "select t from TechniqueCondition as t where t.techConditionDate like '"+year+"-"+month+"%'";
		Query query = session.createQuery(hql);
		List<TechniqueCondition> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}	
	}
	
	@Override
	public void add(TechniqueCondition techniqueCondition){
		baseDao.save(techniqueCondition);
	}

}
