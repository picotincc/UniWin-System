package productManage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.TestDao;
import productManage.model.User;
import productManage.service.TestService;
@Service
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestDao testDao;

	@Override
	public boolean testRegister(User user) {
		boolean tag = testDao.save(user);
		if(tag){
			return true;
		}
		return false;
	}
	

}
