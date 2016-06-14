package productManage.dao.cs.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.cs.OutSourceDao;
import productManage.model.User;
import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;

@Repository
public class OutSourceDaoImpl implements OutSourceDao{

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public void add(OutSource outsource) {
		baseDao.save(outsource);		
	}

	@Override
	public void update(OutSource outsource) {
		baseDao.update(outsource);		
	}

	@Override
	public void delete(OutSource outsource) {
		baseDao.delete(outsource);		
	}

	@Override
	public List<OutSource> getOutSourceByKey(String[] keys) {
		return null;
	}


	@Override
	public List<OutSource> getAllOutSource() {  
		// TODO Auto-generated method stub
		return baseDao.getAllList(OutSource.class);
	}

	@Override
	public List<OutSource> getOutSourceListByID(int outSourceID) {
		Session session = baseDao.getSession();	
		String hql = "from OutSource as d where d.outsourceID ='"+outSourceID+"'";
		Query query = session.createQuery(hql);
		List<OutSource> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}
	}

	@Override
	public OutSource getOutSourceByID(int outSourceID) {
		// TODO Auto-generated method stub
		return (OutSource)baseDao.load(OutSource.class, outSourceID);
	}

	@Override
	public List<OutSource> getOutSourceListByProductionID(int productionID) {
		//通过生产单id来获取外发单
		Session session = baseDao.getSession();
		String hql = "from OutSource as d where d.production.productionID ='"+productionID+"'";
		Query query = session.createQuery(hql);
		List<OutSource> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}
	}

	@Override
	public OutSource getOutSourceByCode(String code) {
		Session session = baseDao.getSession();
		String hql = "from OutSource as d where d.outsourceCode ='"+code+"'";
		Query query = session.createQuery(hql);
		List<OutSource> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list.get(0);
		}
	}
}
