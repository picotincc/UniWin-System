package productManage.dao.lhj.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.lhj.MaterialapplyDao;
import productManage.model.lhj.Materialapply;
@Repository
public class MaterialapplyDaoImpl implements MaterialapplyDao{

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public Materialapply getMaterialApplyByCode(String materialApplyCode) {
		Session session = baseDao.getNewSession();
		String hql = "select m from Materialapply as m where m.materialApplyCode = '"+materialApplyCode+"'";
		System.out.println(hql);
		List<Materialapply> results = session.createQuery(hql).list();
		System.out.println(results);
		session.close(); 
		return results.size()>=1?results.get(0):null;
	}
    
}
