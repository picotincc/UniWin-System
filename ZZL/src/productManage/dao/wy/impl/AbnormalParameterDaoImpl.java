package productManage.dao.wy.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.wy.AbnormalParameterDao;
import productManage.model.wy.AbnormalParameter;
import productManage.model.wy.Department;

/**
 * @author wangye
 * @date 创建时间2016-03-01
 */
@Repository
public class AbnormalParameterDaoImpl implements AbnormalParameterDao{
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<AbnormalParameter> findAll() {
		return baseDao.getAllList(AbnormalParameter.class);
	}

	@Override
	public void save(AbnormalParameter abnormalParameter) {
		baseDao.save(abnormalParameter);
	}

	@Override
	public void update(AbnormalParameter abnormalParameter) {
		baseDao.update(abnormalParameter);
	}

	@Override
	public AbnormalParameter findByID(String id) {
		// TODO Auto-generated method stub
		String hql = "from AbnormalParameter ap  where ap.abnormalParameterID='"+id+"'";
		Session session = baseDao.getSession();
		return (AbnormalParameter) session.createQuery(hql).list().get(0);
	}

}
