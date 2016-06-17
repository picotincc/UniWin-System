package productManage.dao.wy;

/**
 * @author wangye
 * @date 创建时间2016-02-29
 */

import java.util.List;

import productManage.model.wy.Authority;
import productManage.model.wy.Module;

//功能16-权限分配-权限读取
public interface AuthorityDao {
	public void update(Authority authority);
	public List<Authority> findAll();//读取权限表中的所有记录
	public Authority findById(String id);
	/*
	 * 通过权限去获取aithorityID
	 */
	public int getIDByAuthority(String highAuthoName,String middleAuthoName,String lowAuthoName);
}
