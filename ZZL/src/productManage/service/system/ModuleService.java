package productManage.service.system;

import java.util.List;

import productManage.model.wy.Module;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

public interface ModuleService {
	public List<Module> findAll();//获取所有模组
	
	public void update(Module module);//更改模组
	
	public List<String> getAllHighModuleName();
	
	public List<String> getMiddleByHigh(String highModuleName);
	
	public List<Module> getLowByMiddleHigh(String middleModuleName,String highModuleName);
	
	public Module getModuleById(String id);
}
