package productManage.service.system;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

import java.util.List;

import productManage.model.wy.Department;
import productManage.vo.PageBean;

public interface DepartmentService {
	public List<Department> findAll();//获取所有部门信息
	
	public void save(Department department);//保存一个部门信息
	
	public void update(Department department);//修改部门信息
	
	public Department findByID(String id);//通过部门id查找部门
	
	public PageBean getDepartmentByPage(int pageSize,int page);
	
	public void delete(String id);
}
