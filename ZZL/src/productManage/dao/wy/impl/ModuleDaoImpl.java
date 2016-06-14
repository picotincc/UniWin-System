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
import productManage.dao.wy.ModuleDao;
import productManage.model.wy.Department;
import productManage.model.wy.Module;
@Repository
public class ModuleDaoImpl implements ModuleDao{
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<Module> findAll() {
		return baseDao.getAllList(Module.class);
	}

	@Override
	public void update(Module module) {
		baseDao.update(module);
	}

	@Override
	public Module findById(String id) {
		String hql = "from Module d  where d.moduleID='"+id+"'";
		Session session = baseDao.getSession();
		return (Module) session.createQuery(hql).list().get(0);
	}

}
