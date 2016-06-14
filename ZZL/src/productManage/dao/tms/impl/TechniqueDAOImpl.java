package productManage.dao.tms.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.tms.TechniqueDAO;
import productManage.model.tms.Technique;
@Repository
public class TechniqueDAOImpl implements TechniqueDAO{
	@Autowired
	private BaseDao baseDao;
	@Override
	//保存款式工艺
	public void save(Technique technique){
		baseDao.save(technique);
	}
	/*
	@Override
	//根据款式编码找到记录
	public Technique findByTechniqueID(String ID){
		return (Technique)baseDao.load(Technique.class, ID);
	}
	@Override
	//根据上架日期找到记录
	public List<Technique> findByDate(Date date){
		String hql = "from productManage.Model.Technique where techDate='"+date+"'";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}
	*/
	@Override
	//找到所有记录
	public List<Technique> findAll(){
		return baseDao.getAllList(Technique.class);
	}
	
	
}
