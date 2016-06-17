package productManage.action.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.model.wy.Module;
import productManage.service.system.ModuleService;

public class GetModuleAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private ModuleService moduleService;
	private List<Object> nodeList = new ArrayList<Object>();
	private Module detail = null;
	
	
	public ModuleService getModuleService() {
		return moduleService;
	}
	public void setModuleService(ModuleService moduleService) {
		this.moduleService = moduleService;
	}
	public Module getDetail() {
		return detail;
	}
	public void setDetail(Module detail) {
		this.detail = detail;
	}  
	
	public String show(){
		if (request.getSession().getAttribute("account")!=null){
			return SUCCESS;
		}
		else{
			return "failed";
		}
		
	}
	
	public String getModuleDetail(){
		if (request.getSession().getAttribute("account")!=null){
			String moduleID = request.getParameter("moduleID");
			detail = moduleService.getModuleById(moduleID);
			return SUCCESS;
		}
		else{
			return "failed";
		}
		
	}
	
	public String getModuleTree() {
		if (request.getSession().getAttribute("account")!=null){
			String fatherId = request.getParameter("id");
			System.out.println(fatherId);
			
			//依次取高层节点
			nodeList = new ArrayList<Object>();
			List<String> highModuleNameList = moduleService.getAllHighModuleName();
			for(int i = 0;i < highModuleNameList.size();i++){
				
				String highModuleName = highModuleNameList.get(i);
				
				Map<String, Object> highNode = new HashMap<String, Object>();
				highNode.put("id", "high" + highModuleName);
				highNode.put("text", highModuleName);
				
				//依次取中层节点
				List<Object> middleNodeList = new ArrayList<Object>();
				List<String> middleModuleNameList = moduleService.getMiddleByHigh(highModuleName);
				for(int j = 0;j < middleModuleNameList.size();j++){
					String middleModuleName = middleModuleNameList.get(j);
					
					Map<String, Object> middleNode = new HashMap<String, Object>();
					middleNode.put("id", "middle"+middleModuleName);
					middleNode.put("text", middleModuleName);
					
					List<Object> lowNodeList = new ArrayList<Object>();
					//取底层节点
					List<Module> lowModuleList = moduleService.getLowByMiddleHigh(middleModuleName, highModuleName);
					for(int k = 0;k < lowModuleList.size();k++){
						Module lowModule = lowModuleList.get(k);
						
						Map<String, Object> lowNode = new HashMap<String, Object>();
						
						lowNode.put("id", lowModule.getModuleID()+"");
						lowNode.put("text", lowModule.getLowModuleName());
						lowNode.put("children", false);
						
						lowNodeList.add(lowNode);
						
					}
					
					middleNode.put("children", lowNodeList);
					middleNodeList.add(middleNode);
				}
				highNode.put("children", middleNodeList);
				
				nodeList.add(highNode);
			}
			
//			Map<String, Object> node = new HashMap<String, Object>();
//			node.put("id", "1");
//			node.put("text", "1");
//			List<Object> children = new ArrayList<Object>();
//			
//			Map<String, Object> childNode1 = new HashMap<String, Object>();
//			childNode1.put("id", "1-1");
//			childNode1.put("text", "1-1");
//			childNode1.put("children", false);
//			
//			Map<String, Object> childNode2 = new HashMap<String, Object>();
//			childNode2.put("id", "1-2");
//			childNode2.put("text", "1-2");
//			childNode2.put("children", false);
//			
//			children.add(childNode1);
//			children.add(childNode2);
//			node.put("children", children);
//			
//			nodeList.add(node);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

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
			
			detail = new Module();
			detail.setModuleID(moduleID);
			detail.setMiddleModuleName(middleModuleName);
			detail.setHighModuleName(highModuleName);
			detail.setLowModuleName(lowModuleName);
			detail.setModuleNum(moduleNum);
			detail.setModuleRoute(moduleRoute);
			detail.setModuleOwnCode(moduleOwnCode);
			detail.setModuleEnabled(moduleEnabled);
			detail.setModuleSpecification(moduleSpecification);
			
			moduleService.update(detail);
			
			return SUCCESS;
		}
		else{
			return "failed";
		}

	}
	
	public List<Object> getData() {  
        return nodeList;
    }

}