package productManage.dao.tms.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.tms.DesignDAO;
import productManage.model.tms.Design;
@Repository
public class DesignDAOImpl implements DesignDAO {
	@Autowired
	private BaseDao basedao;
	@Override
	public List<Design> findAll() {
		// TODO Auto-generated method stub
		return basedao.getAllList(Design.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Design> findByDate(Date date) {
		// TODO Auto-generated method stub
		String hql = "from Design d where d.designPutawayDate='"+date+"'";
		Session session = basedao.getSession();
		return session.createQuery(hql).list();
	}

	@Override
	public Design findByCode(String Code) {
		// TODO Auto-generated method stub
		String hql = "from Design d  where d.designCode='"+Code+"'";
		System.out.println(hql);
		Session session = basedao.getSession();
		List<Design> results = session.createQuery(hql).list();
		return results.size()>=1?results.get(0):null;
	}
	
	@Override
	public Design findById(String id) {
		// TODO Auto-generated method stub
		String hql = "from Design d  where d.designID='"+id+"'";
		System.out.println(hql);
		Session session = basedao.getSession();
		List<Design> results = session.createQuery(hql).list();
		return results.size()>=1?results.get(0):null;
	}
	
	@Override
	public List<Design> findByKey(String key) {
		// TODO Auto-generated method stub
		if(key.equals("")){
			return null;
		}
		else{
			String hql = "from Design d  where d.designCode like'%"+key+"%'";
			System.out.println(hql);
			Session session = basedao.getSession();
			List<Design> results = session.createQuery(hql).list();
			return results.size()>=1?results:null;
		}
	}

	@Override
	public void addDesign(Design design) {
		// TODO Auto-generated method stub
		basedao.save(design);
	}
	
	@Override
	public void quitDesign(String designId){
		String hql = "delete from Design d where d.designID = '"+designId+"'";
		Session session = basedao.getSession();
		Transaction trans=session.beginTransaction();
		Query queryupdate=session.createQuery(hql);
		int ret=queryupdate.executeUpdate();
		trans.commit();
	}

}
