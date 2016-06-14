package productManage.action.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.model.wy.Module;
import productManage.service.system.DepartmentService;
import productManage.service.system.ModuleService;

public class UpdateModuleAction extends BaseAction{
	@Autowired
	private ModuleService moduleService;
	private Module currentUpdateModule;
	
	public ModuleService getModuleService() {
		return moduleService;
	}

	public void setModuleService(ModuleService moduleService) {
		this.moduleService = moduleService;
	}
	
	public String update(){
		if (request.getSession().getAttribute("account")!=null){
			int moduleID = Integer.parseInt(request.getParameter("moduleID"));
			String middleModuleName = request.getParameter("middleModuleName");
			String highModuleName = request.getParameter("highModuleName");
			String lowModuleName = request.getParameter("lowModuleName");
			int moduleNum = Integer.parseInt(request.getParameter("moduleNum"));
			String moduleRoute = request.getParameter("moduleRoute");
			String moduleOwnCode = request.getParameter("moduleOwnCode");
			boolean moduleEnabled = Boolean.parseBoolean(request.getParameter("moduleEnabled"));
			String moduleSpecification = request.getParameter("moduleSpecification");
			
			Module module = new Module();
			module.setModuleID(moduleID);
			module.setMiddleModuleName(middleModuleName);
			module.setHighModuleName(highModuleName);
			module.setLowModuleName(lowModuleName);
			module.setModuleNum(moduleNum);
			module.setModuleRoute(moduleRoute);
			module.setModuleOwnCode(moduleOwnCode);
			module.setModuleEnabled(moduleEnabled);
			module.setModuleSpecification(moduleSpecification);
			
			moduleService.update(module);
			
			// 用于返回json串
			currentUpdateModule = module;
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
	
	public Object getData() {  
        return currentUpdateModule;
    }
}
