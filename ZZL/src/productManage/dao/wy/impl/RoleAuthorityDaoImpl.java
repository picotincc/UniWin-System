package productManage.dao.wy.impl;

/**
 * @author wangye
 * @date 创建时间2016-03-01
 */

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.wy.RoleAuthorityDao;
import productManage.model.wy.Authority;
import productManage.model.wy.RoleAuthority;
@Repository
public class RoleAuthorityDaoImpl implements RoleAuthorityDao{
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<RoleAuthority> findAll() {
		return baseDao.getAllList(RoleAuthority.class);
	}

	@Override
	public void saveRoleAuthority(RoleAuthority roleAuthority) {
		baseDao.save(roleAuthority);
	}

	@Override
	public void deleteRoleAuthority(String roleAuthorityId) {
		baseDao.delete(RoleAuthority.class, roleAuthorityId);
	}

	@Override
	public List<Authority> findRoleAuthority(int roleID) {
		// TODO Auto-generated method stub
		String hql = "select a from RoleAuthority r,Authority a where r.authorityID=a.authorityID and r.roleID="+roleID;
		Session session = baseDao.getSession();
		return session.createQuery(hql).list();
	}

	@Override
	public void delete(RoleAuthority roleAuthority) {
		// TODO Auto-generated method stub
		baseDao.delete(roleAuthority);
	}

	@Override
	public void delete(List<RoleAuthority>roleAuthoList) {
		// TODO Auto-generated method stub
		Session session = baseDao.getSession();
		for (int i = 0; i < roleAuthoList.size(); i++) {
			session.delete(roleAuthoList.get(i));
		}
		session.flush();
		session.clear();
	}

	@Override
	public void save(List<RoleAuthority>newra) {
		// TODO Auto-generated method stub
		Session session = baseDao.getSession();
		for (int i = 0; i < newra.size(); i++) {
			session.save(newra.get(i));
			if (i%20==0) {
				session.flush();
				session.clear();
			}
		}
		session.flush();
		session.clear();
	}

	@Override
	public void save(String sql) {
		// TODO Auto-generated method stub
		Session session = baseDao.getSession();
		session.createSQLQuery(sql).executeUpdate();
	}

}
