package productManage.dao.wjx.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.wjx.MaterialOutputDao;
import productManage.model.wjx.MaterialOutput;

@Repository
public class MaterialOutputDaoImpl implements MaterialOutputDao {
	@Autowired
	private BaseDao baseDao;

	@Override
	public MaterialOutput addMaterialOutput(MaterialOutput materialoutput) {
		Session session = baseDao.getNewSession();
		Transaction tx = session.beginTransaction();
		session.save(materialoutput);
		tx.commit();
		session.close();
		return materialoutput;
	}

	@Override
	public List<MaterialOutput> getMaterialOutputList(Date date) {
		String hql = "select m from MaterialOutput as m where m.materialOutputDate=:date";
		return baseDao.getSession().createQuery(hql).setDate("date", date)
				.list();
	}

	@Override
	public List<MaterialOutput> getMaterialOutputList(String materialApplyCode,
			String materialCode, int warehouseId) {
		String hql = "select m from MaterialOutput as m where m.materialApply.materialApplyCode = '"
				+ materialApplyCode + "' and m.material.materialCode = '"+materialCode+"' and m.warehouse.warehouseid ="+warehouseId;
		return baseDao.getSession().createQuery(hql).list();
	}

}
