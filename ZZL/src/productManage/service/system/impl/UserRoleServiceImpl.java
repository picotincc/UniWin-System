package productManage.service.system.impl;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.wy.RoleDao;
import productManage.dao.wy.UserRoleDao;
import productManage.model.wy.Role;
import productManage.model.wy.UserRole;
import productManage.service.system.UserRoleService;
@Service
public class UserRoleServiceImpl implements UserRoleService{
	@Autowired
	private UserRoleDao userRoleDao;
	@Autowired
	private RoleDao roleDao;
	
	public UserRoleDao getUserRoleDao() {
		return userRoleDao;
	}

	public void setUserRoleDao(UserRoleDao userRoleDao) {
		this.userRoleDao = userRoleDao;
	}
	
	@Override
	public List<UserRole> findAll() {
		return userRoleDao.findAll();
	}
	
	@Override
	public void save(UserRole userRole) {
		userRoleDao.save(userRole);
	}

	@Override
	public List<UserRole> findByUserId(int userId) {
		return userRoleDao.findByUserId(userId);
	}

	@Override
	public void delete(String userRoleId) {
		userRoleDao.delete(userRoleId);
	}

	@Override
	public List<Role> findRoleOfUser(int userId) {
		List<UserRole> userRoleList = userRoleDao.findByUserId(userId);
		List<Role> roleList = new ArrayList<Role>();
		
		for(int i = 0;i < userRoleList.size();i++){
			String roleId = userRoleList.get(i).getRoleID()+"";
			Role role = roleDao.findById(roleId);
			roleList.add(role);
		}
		return roleList;
	}

	@Override
	public void delete(String userId, String roleID) {
		userRoleDao.delete(userId,roleID);
	}





}
