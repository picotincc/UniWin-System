package productManage.service.system.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.action.system.RoleVO;
import productManage.action.system.UserVO;
import productManage.dao.BaseDao;
import productManage.dao.wy.RoleAuthorityDao;
import productManage.dao.wy.UserDao;
import productManage.model.User;
import productManage.model.wy.Authority;
import productManage.model.wy.Role;
import productManage.model.wy.RoleAuthority;
import productManage.service.PageService;
import productManage.service.system.DepartmentService;
import productManage.service.system.UserService;
import productManage.vo.PageBean;
import productManage.vo.system.ChargeConstants;
import productManage.vo.system.UserConstants;
import productManage.vo.technique.TechniqueConstants;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	@Autowired
	private PageService pageService;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setuserDetailDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

	@Override
	public void save(User user) {
		userDao.save(user);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public void delete(String userId) {
		userDao.delete(userId);
	}

	@Override
	public List<User> getUserByName(String name) {
		// TODO Auto-generated method stub
		return userDao.getUserByName(name);
	}

	@Override
	public User getUserByAccount(String account) {
		// TODO Auto-generated method stub
		return userDao.getUserByAccount(account);
	}

	@Override
	public User findById(String id) {
		// TODO Auto-generated method stub
		return userDao.findByID(id);
	}

	@Override
	public void delete(User user) {
		userDao.delete(user);
	}

	@Override
	public PageBean getChargeByPage(int pageSize,int page,Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql = "select distinct user from User user,UserRole ur,Role r where ur.roleID=r.roleID and user.userId=ur.userId and r.roleName='NEW客户订单管理负责人'";
		String userName = (String) params.get(ChargeConstants.SEARCH_CHARGE_PARAMS[0]);
		if (!userName.isEmpty()) {
			hql += " where user.userName like '%"+userName+"%'";
		}
		return pageService.queryForPage(hql, pageSize, page);
	}

	@Override
	public PageBean getUserVOByPage(int pageSize, int page) {
		String password = "no";
		String hql="select user from User user where user.userPassword != ''";
		PageBean pb =  pageService.queryForPage(hql, pageSize, page);
		return pb;
	}
	
	public PageBean searchUserByPage(String hql,int pageSize, int page) {
		PageBean pb =  pageService.queryForPage(hql, pageSize, page);
		return pb;
	}

	@Override
	public PageBean searchUserByPage(int pageSize, int page,
			Map<String, Object> params) {
		String hql="select user from User user";
		String userAccount = (String)params.get(UserConstants.SEARCH_USER_PARAMS[0]);
		String searchedUserName = (String)params.get(UserConstants.SEARCH_USER_PARAMS[1]);
		
		if(!(userAccount == null || userAccount.equals("")) && !(searchedUserName == null || searchedUserName.equals(""))){
			hql+=" where ";
			hql+="user.userAccount='"+userAccount+"'"+" and user.userName='"+searchedUserName+"'";
		}
		else if(!(userAccount == null || userAccount.equals(""))){
			hql+=" where ";
			hql+="user.userAccount like '%"+userAccount+"%'";
		}
		else if(!(searchedUserName == null || searchedUserName.equals(""))){
			hql+=" where ";
			hql+="user.userName like '%"+searchedUserName+"%'";
		}
		
		PageBean pageBean = pageService.queryForPage(hql, pageSize, page);
		return pageBean;
	}

	@Override
	public void deleteMyUser(String myUserId) {
		userDao.deleteMyUser(myUserId);
	}

	@Override
	public boolean login(String account, String password) {
		// TODO Auto-generated method stub
		List<User> userList = userDao.findAll();
		for(User u:userList){
			//System.out.println(u.getUserAccount()+" "+u.getUserPassword());
			if (u.getUserAccount().equals(account)&&u.getUserPassword().equals(password)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public List<Authority> myAuthorities(String account) {
		// TODO Auto-generated method stub
		return userDao.myAuthorities(account);
	}

}
