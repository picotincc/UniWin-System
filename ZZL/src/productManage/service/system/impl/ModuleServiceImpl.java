package productManage.service.system.impl;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.wy.ModuleDao;
import productManage.model.User;
import productManage.model.wy.Module;
import productManage.service.system.ModuleService;
@Service
public class ModuleServiceImpl implements ModuleService{
	@Autowired
	private ModuleDao moduleDao;
	
	public ModuleDao getModuleDao() {
		return moduleDao;
	}

	public void setModuleDao(ModuleDao moduleDao) {
		this.moduleDao = moduleDao;
	}
	
	@Override
	public List<Module> findAll() {
		return moduleDao.findAll();
	}

	@Override
	public void update(Module module) {
		moduleDao.update(module);
	}

	@Override
	public List<String> getAllHighModuleName() {
		List<Module> moduleList = moduleDao.findAll();
		List<String> highModuleNameList = new ArrayList<String>();
		
		for(int i = 0;i < moduleList.size();i++){
			String highModuleNameItem = moduleList.get(i).getHighModuleName();
			if(!highModuleNameList.contains(highModuleNameItem)){
				highModuleNameList.add(highModuleNameItem);
			}
		}
		
		return highModuleNameList;
	}

	@Override
	public List<String> getMiddleByHigh(String highModuleName) {
		List<Module> moduleList = moduleDao.findAll();
		List<String> middleNameList = new ArrayList<String>();
		
		for(int i = 0;i < moduleList.size();i++){
			if(moduleList.get(i).getHighModuleName().equals(highModuleName)){
				String middleModuleName = moduleList.get(i).getMiddleModuleName();
				if(!middleNameList.contains(middleModuleName)){
					middleNameList.add(middleModuleName);
				}
			}
		}
		return middleNameList;
	}

	@Override
	public List<Module> getLowByMiddleHigh(String middleModuleName,
			String highModuleName) {
		List<Module> moduleList = moduleDao.findAll();
		List<Module> lowModuleNameList = new ArrayList<Module>();
		
		for(int i = 0;i < moduleList.size();i++){
			Module itemModule = moduleList.get(i);
			String itemHighModuleName = itemModule.getHighModuleName();
			String itemMiddleModuleName = itemModule.getMiddleModuleName();
			
			if(itemHighModuleName.equals(highModuleName) && itemMiddleModuleName.equals(middleModuleName)){
				lowModuleNameList.add(itemModule);
			}
		}
		return lowModuleNameList;
	}

	@Override
	public Module getModuleById(String id) {
		return moduleDao.findById(id);
	}


}
