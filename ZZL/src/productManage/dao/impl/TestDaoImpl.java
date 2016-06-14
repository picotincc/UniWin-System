package productManage.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.TestDao;
import productManage.model.User;
@Repository
public class TestDaoImpl implements TestDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public boolean save(User user) {
		baseDao.save(user);
		return true;
	}

}
