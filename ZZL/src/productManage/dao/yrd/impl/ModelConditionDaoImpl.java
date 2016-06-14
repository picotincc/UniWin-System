package productManage.dao.yrd.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.yrd.ModelConditionDao;
import productManage.model.yrd.ModelCondition;
import productManage.model.yrd.TechniqueCondition;


/**
 * @author yrd
 * @date 创建时间2016-02-28
 */

@Repository
public class ModelConditionDaoImpl implements ModelConditionDao {
	
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<ModelCondition> findModelCondtion(Date date){
		Session session = baseDao.getNewSession();	
		String hql = "from productManage.Model.ModelCondition as m where m.modelConditionDate='"+date+"'";
		Query query = session.createQuery(hql);
		List<ModelCondition> list = query.list();
		return list;
	}
	
	@Override
	public List<ModelCondition> getModelConditionByYear(String year){
		Session session = baseDao.getSession();
		String hql = "select m from ModelCondition as m where m.modelConditionDate like '"+year+"%'";
		Query query = session.createQuery(hql);
		List<ModelCondition> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}			
	}
	
	@Override
	public List<ModelCondition> getModelConditionByMonth(String year,String month){
		Session session = baseDao.getSession();
		String hql = "select m from ModelCondition as m where m.modelConditionDate like '"+year+"-"+month+"%'";
		Query query = session.createQuery(hql);
		List<ModelCondition> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}			
	}
	
	@Override
	public void add(ModelCondition modelCondition){
		baseDao.save(modelCondition);
	}

}
