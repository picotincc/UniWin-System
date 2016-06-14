package productManage.service.system;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import productManage.model.User;
import productManage.model.wy.Authority;
import productManage.vo.PageBean;

public interface UserService {
	public List<User> findAll();//读取所有用户
	
	public void save(User user);//保存一条用户信息
	
	public void update(User user);//更改一条用户信息
	
	public void delete(String user);//删除一个用户
	
	public List<User> getUserByName(String name);
	
	public User getUserByAccount(String account);
	
	public User findById(String id);
	
	public void delete(User user);
	
	public PageBean getChargeByPage(int pageSize,int page,Map<String, Object> params);//获取所有的订单负责人分页返回

	public PageBean getUserVOByPage(int pageSize,int page);
	
	public PageBean searchUserByPage(String hql,int pageSize, int page);
	
	public PageBean searchUserByPage(int pageSize, int page,Map<String, Object> params);
	
	public void deleteMyUser(String myUserId);
	
	public boolean login(String account,String password);//登录验证
	
	public List<Authority> myAuthorities(String account);//某用户的权限
}
