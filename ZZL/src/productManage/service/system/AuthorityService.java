package productManage.service.system;

import java.util.List;

import productManage.model.wy.Authority;
import productManage.model.wy.Module;

/**
 * @author yukuai
 * @date 创建时间2016-04-08
 */
public interface AuthorityService {
	public List<Authority> findAll();//获取所有的权限
	public void updateAuthority(Authority authority);//更改权限
	public List<String> getAllHighAuthoName();//获取所有的高层权限
	public List<String> getMiddleByHigh(String highAuthoName);//获取所有的中层权限
	public List<Authority> getLowByMiddleHigh(String middleAuthoName,String highAuthoName);//获取所有的底层权限
	public Authority getAuthorityById(String authorityID);//通过ID获取权限
	public List<String> getRoleHighAuthoName(int roleID);//获取该角色的所有高层权限
	public List<String> getRoleMiddleByHigh(int roleID,String highAuthoName);//获取该角色的所有中层权限
	public List<Authority> getRoleLowByMiddleHigh(int roleID,String middleAuthoName,String highAuthoName);//获取该角色的所有底层权限
	public List<String> high(List<Authority> authoList);//不同的高层权限
	public List<Authority> highMiddle(List<Authority> authoList);//不同的高中层权限
	/*
	 * 保存角色的修改后的权限
	 */
	public void saveRoleAuthority(int roleID,String[]ras);
	public void updateAuthorityState(String nodeID);//分解nodeID得到高中低层的name检索authority并更新
}

