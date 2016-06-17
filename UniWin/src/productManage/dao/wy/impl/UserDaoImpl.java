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
import productManage.dao.wy.UserDao;
import productManage.model.User;
import productManage.model.wy.Authority;
import productManage.model.wy.MyUser;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<User> findAll() {
		return baseDao.getAllList(User.class);
	}

	@Override
	public void save(User user) {
		baseDao.save(user);
	}

	@Override
	public void update(User user) {
		baseDao.update(user);
	}

	@Override
	public void delete(String userId) {
			Session session = baseDao.getNewSession();
			int id = Integer.parseInt(userId);
			Object obj = session.get(User.class, id);
			session.delete(obj);
			session.flush();
			session.clear();
			session.close();
	}

	@Override
	public List<User> getUserByName(String name) {
		String hql="from User p where p.userName = '"+name+"'";
		Session session=baseDao.getSession();
		List list= session.createQuery(hql).list();
		System.out.println(hql);
		//session.clear();
		return list;
	}

	@Override
	public User getUserByAccount(String account) {
		String hql="from User p where p.userAccount = '"+account+"'";
		Session session=baseDao.getSession();
		List list= session.createQuery(hql).list();
		User user=null;
		user = (User) list.get(0);
		session.clear();
		return user;
	}

	@Override
	public User findByID(String id) {
		String hql="from User p where p.userId = '"+id+"'";
		Session session=baseDao.getSession();
		List list= session.createQuery(hql).list();
		User user=null;
		session.clear();
		if(list!=null&&list.size()!=0)
			user=(User) list.get(0);
		return user;
	}
	
	@Override
	public User findByID(int id) {
		// TODO Auto-generated method stub
		return (User) baseDao.load(User.class, id);
	}


	@Override
	public void delete(User user) {
		baseDao.delete(user);
	}

	@Override
	public void deleteMyUser(String myUserId) {
		Session session = baseDao.getNewSession();
		int id = Integer.parseInt(myUserId);
		Object obj = session.get(MyUser.class, id);
		session.delete(obj);
		session.flush();
		session.clear();
		session.close();
		
	}

	@Override
	public List<Authority> myAuthorities(String account) {
		// TODO Auto-generated method stub
		String hql = "select distinct a from User u,UserRole ur,RoleAuthority r,Authority a where u.userId=ur.userId and ur.roleID=r.roleID and r.authorityID=a.authorityID and u.userAccount='"+account+"'";
		Session session=baseDao.getSession();
		return session.createQuery(hql).list();
	}

}
