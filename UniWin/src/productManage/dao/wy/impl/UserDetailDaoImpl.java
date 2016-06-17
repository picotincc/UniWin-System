package productManage.dao.wy.impl;

/**
 * @author wangye
 * @date 创建时间2016-03-01
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.wy.UserDetailDao;
import productManage.model.User;
@Repository
public class UserDetailDaoImpl implements UserDetailDao{
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<User> findAll() {
		return baseDao.getAllList(User.class);
	}

	@Override
	public void save(User userDetail) {
		baseDao.save(userDetail);
	}

	@Override
	public void update(User userDetail) {
		baseDao.update(userDetail);
	}

	@Override
	public void delete(String userDetail) {
		baseDao.delete(User.class, userDetail);
	}

}
