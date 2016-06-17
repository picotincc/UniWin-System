package productManage.dao.wy.impl;

/**
 * @author wangye
 * @date 创建时间2016-03-01
 */

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.wy.UserRoleDao;
import productManage.model.wy.Role;
import productManage.model.wy.UserRole;
@Repository
public class UserRoleDaoImpl implements UserRoleDao{
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<UserRole> findAll() {
		return baseDao.getAllList(UserRole.class);
	}
	
	@Override
	public void save(UserRole userRole) {
		baseDao.save(userRole);
	}

	@Override
	public List<UserRole> findByUserId(int userId) {
		Session session = baseDao.getNewSession();
		String hql = "from UserRole as p where p.userId = " + userId;
		return session.createQuery(hql).list();
	}

	@Override
	public void delete(String userRoleId) {
		Session session = baseDao.getNewSession();
		String hql = "from UserRole as p where p.userRoleID = " + userRoleId;
		UserRole userRole = (UserRole)session.createQuery(hql).list().get(0);
		
		baseDao.delete(userRole);
	}

	@Override
	public void delete(String userId, String roleID) {
		Session session = baseDao.getNewSession();
		String hql = "from UserRole as p where p.userId = " + userId + " and p.roleID = " + roleID;
		UserRole userRole = (UserRole)session.createQuery(hql).list().get(0);
		
		baseDao.delete(userRole);
	}


	
}
