package productManage.dao.wy;

/**
 * @author wangye
 * @date 创建时间2016-02-29
 */

import java.util.List;

import productManage.model.wy.Role;

//功能16-权限分配-角色管理
public interface RoleDao {
	public List<Role> findAll();//获取所有角色的信息
	
	public void saveRole(Role role);//保存角色信息
	
	public void update(Role role);//修改角色信息
	
	public Role findById(String id);
}
