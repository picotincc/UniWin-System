package productManage.dao.wy.impl;

/**
 * @author wangye
 * @date 创建时间2016-02-29
 */

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.wy.RoleDao;
import productManage.model.User;
import productManage.model.wy.Role;
import productManage.model.yk.Inquiry;
@Repository
public class RoleDaoImpl implements RoleDao{
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<Role> findAll() {
		return baseDao.getAllList(Role.class);
	}

	@Override
	public void saveRole(Role role) {
		baseDao.save(role);
	}

	@Override
	public void update(Role role) {
		baseDao.update(role);
	}

	@Override
	public Role findById(String id) {
		String hql="from Role p where p.roleID = '"+id+"'";
		Session session=baseDao.getSession();
		List list= session.createQuery(hql).list();
		Role role=null;
		session.clear();
		if(list!=null&&list.size()!=0)
			role=(Role) list.get(0);
		return role;
	}



}
