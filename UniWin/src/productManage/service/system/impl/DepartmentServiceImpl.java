package productManage.service.system.impl;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.wy.DepartmentDao;
import productManage.model.wy.Department;
import productManage.service.PageService;
import productManage.service.system.DepartmentService;
import productManage.vo.PageBean;

@Service
public class DepartmentServiceImpl implements DepartmentService{
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private PageService pageService;
	
	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	@Override
	public List<Department> findAll() {
		return departmentDao.findAll();
	}

	@Override
	public void save(Department department) {
		departmentDao.save(department);
	}

	@Override
	public void update(Department department) {
		departmentDao.update(department);
	}

	@Override
	public Department findByID(String id) {
		return departmentDao.findByID(id);
	}

	@Override
	public PageBean getDepartmentByPage(int pageSize, int page) {
		String hql="select department from Department department";
		return pageService.queryForPage(hql, pageSize, page);
	}

	@Override
	public void delete(String id) {
		departmentDao.delete(id);
	}

}
