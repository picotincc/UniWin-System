package productManage.service.system.impl;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.wy.RoleAuthorityDao;
import productManage.model.wy.RoleAuthority;
import productManage.service.system.RoleAuthorityService;
@Service
public class RoleAuthorityServiceImpl implements RoleAuthorityService{
	@Autowired
	private RoleAuthorityDao roleAuthorityDao;
	
	public RoleAuthorityDao getRoleAuthorityDao() {
		return roleAuthorityDao;
	}

	public void setRoleAuthorityDao(RoleAuthorityDao roleAuthorityDao) {
		this.roleAuthorityDao = roleAuthorityDao;
	}
	
	@Override
	public List<RoleAuthority> findAll() {
		return roleAuthorityDao.findAll();
	}

	@Override
	public void saveRoleAuthority(RoleAuthority roleAuthority) {
		roleAuthorityDao.saveRoleAuthority(roleAuthority);
	}

	@Override
	public void deleteRoleAuthority(String roleAuthorityId) {
		roleAuthorityDao.deleteRoleAuthority(roleAuthorityId);
	}

}
