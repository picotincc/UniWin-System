package productManage.action.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.model.User;
import productManage.model.wy.Authority;
import productManage.service.system.AuthorityService;
import productManage.service.system.UserService;

public class GetAuthorityAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private AuthorityService authorityService;
	@Autowired
	private UserService userService;
	
	private List<Object> authoList;
	private List<Object> roleAuthoList;
	private int roleID;
	private String authorityID;
	private String names;
	private String nodeID;
	
	public List<Object> getAuthoList() {
		return authoList;
	}

	public void setAuthoList(List<Object> authoList) {
		this.authoList = authoList;
	}

	public List<Object> getRoleAuthoList() {
		return roleAuthoList;
	}

	public void setRoleAuthoList(List<Object> roleAuthoList) {
		this.roleAuthoList = roleAuthoList;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}

	public String getAuthorityID() {
		return authorityID;
	}

	public void setAuthorityID(String authorityID) {
		this.authorityID = authorityID;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getNodeID() {
		return nodeID;
	}
	
	public void setNodeID(String nodeID) {
		this.nodeID = nodeID;
	}
	
	public String getAuthorityTree(){
		if (request.getSession().getAttribute("account")!=null){
			//依次取高层节点
			authoList = new ArrayList<Object>();
			List<String> highAuthoList = authorityService.getAllHighAuthoName();
			for (int i = 0; i < highAuthoList.size(); i++) {
				//依次取中层节点
				String highAuthoName = highAuthoList.get(i);
				List<Object> middleNodeList = new ArrayList<Object>();
				List<String> middleAuthoNameList = authorityService.getMiddleByHigh(highAuthoName);
				int middlecount = 0;//中层节点有多少是停止的
				int middleNullCount = 0;//中层节点有多少是null
				for(int j = 0;j < middleAuthoNameList.size();j++){
					//取底层节点
					String middleAuthoName = middleAuthoNameList.get(j);
					if (middleAuthoName=="启用"||middleAuthoName=="停止"){
						middleNullCount++;
						if (middleAuthoName=="停止")
							middlecount++;
						middleAuthoName = null;
						continue;
					}
					List<Object> lowNodeList = new ArrayList<Object>();
					List<Authority> lowAuthoList = authorityService.getLowByMiddleHigh(middleAuthoName, highAuthoName);
					int lowcount = 0;//底层节点有多少是停止的
					int lowNullCount = 0;//底层节点有多少是null
					for(int k = 0;k < lowAuthoList.size();k++){
						Authority lowAuthority = lowAuthoList.get(k);
						if (lowAuthority.getLowAuthName()==null){
							lowNullCount++;
							if (lowAuthority.getAuthorityEnabled()==0)
								lowcount++;
							continue;
						}
						Map<String, Object> lowNode = new HashMap<String, Object>();
						lowNode.put("id", highAuthoName.replace(" ", "")+"_"+middleAuthoName.replace(" ", "")+"_"+lowAuthority.getLowAuthName().replace(" ", ""));
						if (lowAuthority.getAuthorityEnabled()!=0) {
							lowNode.put("text", lowAuthority.getLowAuthName()+"[<a><font color='blue'>启用</font>]</a>");
						}else {
							lowcount++;
							lowNode.put("text", lowAuthority.getLowAuthName()+"[<a><font color='red'>停止</font></a>]");
						}
						lowNode.put("children", false);
						
						lowNodeList.add(lowNode);
					}
					
					Map<String, Object> middleNode = new HashMap<String, Object>();
					middleNode.put("id", highAuthoName.replace(" ", "")+"_"+middleAuthoName.replace(" ", ""));
					if (lowcount==lowAuthoList.size()) {
						middlecount++;
						middleNode.put("text", middleAuthoName+"[<font color='red'>停止</font>]");
					}else{
						middleNode.put("text", middleAuthoName+"[<font color='blue'>启用</font>]");
					}
					if (lowAuthoList.size()==lowNullCount) {
						middleNode.put("children", false);
					}else {
						middleNode.put("children", lowNodeList);
					}
					middleNodeList.add(middleNode);
				}
				
				Map<String, Object> highNode = new HashMap<String, Object>();
				highNode.put("id",  highAuthoName.replace(" ", ""));
				if (middlecount==middleAuthoNameList.size()) {
					highNode.put("text", highAuthoName+"[<font color='red'>停止</font>]");
				}else{
					highNode.put("text", highAuthoName+"[<font color='blue'>启用</font>]");
				}
				if (middleAuthoNameList.size()==middleNullCount) {
					highNode.put("children", false);
				}else{
					highNode.put("children", middleNodeList);
				}
				
				authoList.add(highNode);
			}
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
	public String getRoleAuthorityTree(){
		if (request.getSession().getAttribute("account")!=null){
			//依次取高层节点
			roleAuthoList = new ArrayList<Object>();
			List<String> highAuthoList = authorityService.getRoleHighAuthoName(roleID);
			for (int i = 0; i < highAuthoList.size(); i++) {
				//依次取中层节点
				String highAuthoName = highAuthoList.get(i);
				List<Object> middleNodeList = new ArrayList<Object>();
				List<String> middleAuthoNameList = authorityService.getRoleMiddleByHigh(roleID, highAuthoName);
				int middlecount = 0;//中层节点有多少是停止的
				int middleNullCount = 0;//中层节点有多少是null
				for(int j = 0;j < middleAuthoNameList.size();j++){
					//取底层节点
					String middleAuthoName = middleAuthoNameList.get(j);
					if (middleAuthoName=="启用"||middleAuthoName=="停止"){
						middleNullCount++;
						if (middleAuthoName=="停止")
							middlecount++;
						continue;
					}
					List<Object> lowNodeList = new ArrayList<Object>();
					List<Authority> lowAuthoList = authorityService.getRoleLowByMiddleHigh(roleID, middleAuthoName, highAuthoName);
					int lowcount = 0;//底层节点有多少是停止的
					int lowNullCount = 0;//底层节点有多少是null
					for(int k = 0;k < lowAuthoList.size();k++){
						Authority lowAuthority = lowAuthoList.get(k);
						if (lowAuthority.getLowAuthName()==null){
							lowNullCount++;
							if (lowAuthority.getAuthorityEnabled()==0)
								lowcount++;
							continue;
						}
						Map<String, Object> lowNode = new HashMap<String, Object>();
						lowNode.put("id", highAuthoName.replace(" ", "")+"_"+middleAuthoName.replace(" ", "")+"_"+lowAuthority.getLowAuthName().replace(" ", ""));
						if (lowAuthority.getAuthorityEnabled()!=0) {
							lowNode.put("text", lowAuthority.getLowAuthName()+"[<a><font color='blue'>启用</font>]</a>");
						}else {
							lowcount++;
							lowNode.put("text", lowAuthority.getLowAuthName()+"[<a><font color='red'>停止</font></a>]");
						}
						lowNode.put("children", false);
						
						lowNodeList.add(lowNode);
					}
					
					Map<String, Object> middleNode = new HashMap<String, Object>();
					middleNode.put("id", highAuthoName.replace(" ", "")+"_"+middleAuthoName.replace(" ", ""));
					if (lowcount==lowAuthoList.size()) {
						middlecount++;
						middleNode.put("text", middleAuthoName+"[<font color='red'>停止</font>]");
					}else{
						middleNode.put("text", middleAuthoName+"[<font color='blue'>启用</font>]");
					}
					if (lowAuthoList.size()==lowNullCount) {
						middleNode.put("children", false);
					}else {
						middleNode.put("children", lowNodeList);
					}
					middleNodeList.add(middleNode);
				}
				
				Map<String, Object> highNode = new HashMap<String, Object>();
				highNode.put("id",  highAuthoName.replace(" ", ""));
				if (middlecount==middleAuthoNameList.size()) {
					highNode.put("text", highAuthoName+"[<font color='red'>停止</font>]");
				}else{
					highNode.put("text", highAuthoName+"[<font color='blue'>启用</font>]");
				}
				if (middleAuthoNameList.size()==middleNullCount) {
					highNode.put("children", false);
				}else{
					highNode.put("children", middleNodeList);
				}
				
				roleAuthoList.add(highNode);
			}
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
	public String saveRoleAuthority(){
		if (request.getSession().getAttribute("account")!=null){
			String[]ras = names.split(",");
			if (roleID<1) {
				return ERROR;
			}
			authorityService.saveRoleAuthority(roleID, ras);
//			String account = (String) request.getSession().getAttribute("account");
//			List<Authority>authoList = userService.myAuthorities(account);
//			request.getSession().setAttribute("highAutho", authorityService.high(authoList));
//			request.getSession().setAttribute("highMiddleAutho", authorityService.highMiddle(authoList));
//			request.getSession().setAttribute("authorityList", authoList);
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
	public String updateAuthorityState(){
		//System.out.println(nodeID);
		if (request.getSession().getAttribute("account")!=null){
			authorityService.updateAuthorityState(nodeID);
			return SUCCESS;
		}else{
			return "failed";
		}
	}
}
