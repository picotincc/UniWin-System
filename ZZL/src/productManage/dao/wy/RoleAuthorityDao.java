package productManage.dao.wy;

/**
 * @author wangye
 * @date 创建时间2016-03-01
 */

import java.util.List;

import productManage.model.wy.Authority;
import productManage.model.wy.Role;
import productManage.model.wy.RoleAuthority;

public interface RoleAuthorityDao {
	public List<RoleAuthority> findAll();//获取所有权限角色的映射关系
	
	public void saveRoleAuthority(RoleAuthority roleAuthority);//保存角色权限分配的信息
	
	public void deleteRoleAuthority(String roleAuthorityId);//删除一条角色权限分配信息
	
	public List<Authority> findRoleAuthority(int roleID);//获取该角色的权限列表
	
	public void delete(RoleAuthority roleAuthority);//删除一条角色权限分配信息
	
	public void delete(List<RoleAuthority>roleAuthoList);//批量删除角色权限
	
	public void save(List<RoleAuthority>newra);//批量插入角色权限
	
	public void save(String sql);//批量插入角色权限
}
