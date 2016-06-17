package productManage.service.system;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

import java.util.List;

import productManage.model.User;

public interface UserDetailService {
	public List<User> findAll();//读取所有用户
	
	public void save(User userDetail);//保存一条用户信息
	
	public void update(User userDetail);//更改一条用户信息
	
	public void delete(String userDetail);//删除一个用户
}
