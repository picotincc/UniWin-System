package productManage.service.system.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.wy.UserDetailDao;
import productManage.model.User;
import productManage.service.system.UserDetailService;
@Service
public class UserDetailServiceImpl implements UserDetailService{
	@Autowired
	private UserDetailDao userDetailDao;
	
	public UserDetailDao getUserDetailDao() {
		return userDetailDao;
	}

	public void setuserDetailDao(UserDetailDao userDetailDao) {
		this.userDetailDao = userDetailDao;
	}
	
	@Override
	public List<User> findAll() {
		return userDetailDao.findAll();
	}

	@Override
	public void save(User userDetail) {
		userDetailDao.save(userDetail);
	}

	@Override
	public void update(User userDetail) {
		userDetailDao.update(userDetail);
	}

	@Override
	public void delete(String userDetail) {
		userDetailDao.delete(userDetail);
	}

}
