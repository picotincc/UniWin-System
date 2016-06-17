package productManage.action.productionSchedule;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.PageAction;
import productManage.action.system.DepartmentVO;
import productManage.action.system.UserVO;
import productManage.model.User;
import productManage.model.wy.Department;
import productManage.service.ListManage.TailorPhaseService;
import productManage.service.system.DepartmentService;
import productManage.vo.PageBean;
import productManage.vo.system.ChargeConstants;


@Controller
public class TailorManageAction  extends PageAction{
	@Autowired
	private TailorPhaseService tailorphaseservice;
	private String outsourceID;
	private String role;
	private String userId;
	private String userName;
	private String userJson;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserJson() {
		return userJson;
	}

	public void setUserJson(String userJson) {
		this.userJson = userJson;
	}

	public TailorPhaseService getTailorphaseservice() {
		return tailorphaseservice;
	}

	public void setTailorphaseservice(TailorPhaseService tailorphaseservice) {
		this.tailorphaseservice = tailorphaseservice;
	}



	public String showAllSourcesInTailor(){
		if (request.getSession().getAttribute("account")!=null) {
		this.pageBean = tailorphaseservice.getAllOutSourceInTailor(this.page, this.rowsPerPage);
		return "success";
		}
		else{
			return "failed";
		}
	}
	
	public String getAllChargeByPageAjax(){
		if (request.getSession().getAttribute("account")!=null) {
		try {
			this.rowsPerPage = 6;
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(ChargeConstants.SEARCH_CHARGE_PARAMS[0], this.userName);
			this.pageBean = tailorphaseservice.getChargeByPage(rowsPerPage, this.page,params);
			List<User> userList = pageBean.getList();
			JSONObject json = new JSONObject();
			json.put("allRow", pageBean.getAllRow());
			json.put("totalPage", pageBean.getTotalPage());
			json.put("currentPage", pageBean.getCurrentPage());
			JSONArray users = new JSONArray();
			json.put("users", users);
			for (int i = 0; i < userList.size(); i++) {
				User userX = userList.get(i);
				JSONObject user = new JSONObject();
				user.put("userId", userX.getUserId());
				user.put("userName", userX.getUserName());
				user.put("userMobileNum", userX.getUserMobileNum());
				user.put("userAddr", userX.getUserAddr());
				users.put(user);
			}
			setUserJson(json.toString());
			//System.out.println(userJson);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
		}
		else{
			return "failed";
		}
	}
	
	public String changeTailorState(){
		if (request.getSession().getAttribute("account")!=null) {
		String changeCode = request.getParameter("changeCode");
		String beginTime = request.getParameter("beginTime");
		if(null != beginTime && !"".equals(beginTime)){
			tailorphaseservice.endTailorPhase(Integer.parseInt(changeCode));
		}
		else{
			tailorphaseservice.beginTailorPhase(Integer.parseInt(changeCode));
		}
		this.pageBean = tailorphaseservice.getAllOutSourceInTailor(this.page,  this.rowsPerPage);
		return "success";
		}
		else{
			return "failed";
		}
	}
	
	public String inquireSourcesInTailor(){
		if (request.getSession().getAttribute("account")!=null) {
		String designCode = request.getParameter("designCode");
		String outsourceCode = request.getParameter("outsourceCode");
		String tailModel = request.getParameter("tailModel");           //排版
		String isInStore = request.getParameter("isInStore");           //面料进度
		String outSource_date = request.getParameter("outSource_date"); 
		String inquiryProgress = request.getParameter("inquiryProgress");  //状态
		String tailor = request.getParameter("tailor");                 //裁剪
		
		//生成sql语句
		StringBuffer hql = new StringBuffer();
		hql.append("select o from OutSource o,Production p where o.production.productionID = p.productionID and p.productionState ='裁剪'");
		
		if(null!=designCode && !"".equals(designCode)){
			hql.append(" and o.design.designCode like '%"+designCode+"%'");
		}
		
		if(null!=outSource_date && !"".equals(outSource_date)){
			hql.append(" and o.referenceOutDate <='"+outSource_date+"'");
		}
		
		
		if(null != outsourceCode && !"".equals(outsourceCode)){
			hql.append(" and o.outsourceCode like '%"+outsourceCode+"%'");
		}
		
		//tailModel isInStore inquiryProgress tailor
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("tailModel", tailModel);
		map.put("isInStore", isInStore);
		map.put("inquiryProgress", inquiryProgress);
		map.put("tailor", tailor);
		
		this.pageBean = tailorphaseservice.inquireOutSourceInTailor(hql.toString(), map,this.page, this.rowsPerPage);
		return "success";
		}
		else{
			return "failed";
		}
	}
	
	public String getOutsourceID() {
		return outsourceID;
	}

	public void setOutsourceID(String outsourceID) {
		this.outsourceID = outsourceID;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String tailorAppoint(){
		if (request.getSession().getAttribute("account")!=null) {
		int outsourceID = Integer.parseInt(this.outsourceID);
		int userID = Integer.parseInt(this.userId);
		boolean right = tailorphaseservice.tailorAppoint(outsourceID, userID, role);
		
		this.pageBean = tailorphaseservice.getAllOutSourceInTailor(this.page, this.rowsPerPage);	
		return "success";
		}
		else{
			return "failed";
		}
	}
	
}
