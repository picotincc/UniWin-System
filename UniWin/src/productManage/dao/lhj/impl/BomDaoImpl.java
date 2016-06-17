package productManage.dao.lhj.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.lhj.BomDao;
import productManage.model.lhj.Bom;
import productManage.model.lhj.Material;
import productManage.model.tms.Design;

@Repository
public class BomDaoImpl implements BomDao{

	@Autowired
	private BaseDao basedao;
	
	@Override
	public void addBom(Bom bom) {
		// TODO Auto-generated method stub
		basedao.save(bom);
	}

	@Override
	public void deleteBom(Material m,Design d) {
		// TODO Auto-generated method stub
		String hql = "delete from Bom b where b.design.designID = '"+d.getDesignID()+"'and b.material.materialCode='"+m.getMaterialCode()+"'";
		Session session = basedao.getSession();
		Transaction trans=session.beginTransaction();
		Query queryupdate=session.createQuery(hql);
		int ret=queryupdate.executeUpdate();
		trans.commit();
	}

}
