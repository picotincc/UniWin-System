package productManage.service.system.impl;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.wy.RoleDao;
import productManage.model.wy.Role;
import productManage.service.PageService;
import productManage.service.system.RoleService;
import productManage.vo.PageBean;
@Service
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private PageService pageService;
	
	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public List<Role> findAll() {
		return roleDao.findAll();
	}

	@Override
	public void saveRole(Role role) {
		roleDao.saveRole(role);
	}

	@Override
	public void update(Role role) {
		roleDao.update(role);
	}

	@Override
	public Role findById(String id) {
		return roleDao.findById(id);
	}

	@Override
	public PageBean getRoleByPage(int pageSize, int page) {
		String hql="select role from Role role";
		return pageService.queryForPage(hql, pageSize, page);
	}

}
