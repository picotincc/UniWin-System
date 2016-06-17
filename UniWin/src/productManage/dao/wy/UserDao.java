package productManage.dao.wy;

/**
 * @author wangye
 * @date 创建时间2016-03-01
 */

import java.util.List;

import productManage.model.User;
import productManage.model.wy.Authority;
import productManage.model.wy.MyUser;

public interface UserDao {
	public List<User> findAll();//读取所有用户
	
	public void save(User userDetail);//保存一条用户信息
	
	public void update(User userDetail);//更改一条用户信息
	
	public void delete(String userDetail);//删除一个用户
	
	public List<User> getUserByName(String name);
	
	public User getUserByAccount(String account);
	
	public User findByID(String id);
	
	public User findByID(int id);
	
	public void delete(User user);
	
	public void deleteMyUser(String myUserId);
	
	public List<Authority> myAuthorities(String account);
}
