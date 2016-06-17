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
import productManage.dao.wy.DepartmentDao;
import productManage.model.wy.Department;
@Repository
public class DepartmentDaoImpl implements DepartmentDao{
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<Department> findAll() {
		return baseDao.getAllList(Department.class); 
	}

	@Override
	public void save(Department department) {
		baseDao.save(department);
	}

	@Override
	public void update(Department department) {
		baseDao.update(department);
	}

	@Override
	public Department findByID(String id) {
		String hql = "from Department d  where d.departmentID='"+id+"'";
		Session session = baseDao.getSession();
		return (Department) session.createQuery(hql).list().get(0);
	}

	@Override
	public void delete(String id) {
		baseDao.delete(Department.class, id);
	}
	
}
