package productManage.dao.wjx.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.wjx.MaterialInputDao;
import productManage.model.wjx.MaterialInput;
@Repository
public class MaterialInputDaoImpl implements MaterialInputDao{

    @Autowired
    private BaseDao baseDao;
    @Override
    public MaterialInput addMaterialInput(MaterialInput materialinput) {
		Session session = baseDao.getNewSession();
		Transaction tx = session.beginTransaction();
		session.save(materialinput);
		tx.commit();
		session.close();
		return materialinput;
    }

    @Override
    public List<MaterialInput> getAllList() {
        return baseDao.getAllList(MaterialInput.class);
    }

    @Override
    public List<MaterialInput> getMaterialInputByDate(Date date) {
        String hql="select m from MaterialInput as m where m.materialInputDate=:date";
        return baseDao.getSession().createQuery(hql).setDate("date", date).list();
    }

}
