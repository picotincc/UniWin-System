package productManage.service.system;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

import java.util.List;

import productManage.model.wy.RoleAuthority;

public interface RoleAuthorityService {
	public List<RoleAuthority> findAll();//获取所有权限角色的映射关系
	
	public void saveRoleAuthority(RoleAuthority roleAuthority);//保存角色权限分配的信息
	
	public void deleteRoleAuthority(String roleAuthorityId);//删除一条角色权限分配信息
}
