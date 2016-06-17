package productManage.dao.wy;

import java.util.List;

import productManage.model.wy.Module;

/**
 * @author wangye
 * @date 创建时间2016-03-01
 */

public interface ModuleDao {
	public List<Module> findAll();//获取所有模组
	
	public void update(Module module);//更改模组
	
	public Module findById(String id);
}
