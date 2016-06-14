package productManage.action.qc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.PageAction;
import productManage.model.User;
import productManage.model.wcy.Qc;
import productManage.model.zky.Production;
import productManage.service.qc.QcService;
import productManage.vo.PageBean;
import productManage.vo.qc.QCVO;
import productManage.vo.system.ChargeConstants;

@Controller
public class QCListAction extends PageAction{

	
	@Autowired
	private QcService qcService;
	private String userId;
	private String qcID;
	private String userJson;
	private String userName;
	private String user_page;

	//private String selectedCode;
	/*List<Qc>  QCList = new ArrayList<Qc>();
	
	public List<Qc> getQCList() {
		return QCList;
	}

	public void setQCList(List<Qc> qCList) {
		QCList = qCList;
	}*/

	//public String getSelectedCode() {
		//return selectedCode;
	//}

	/*public void setSelectedCode(String selectedCode) {
		this.selectedCode = selectedCode;
	}*/

	public String getUser_page() {
		return user_page;
	}

	public void setUser_page(String user_page) {
		this.user_page = user_page;
	}

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

	public String getQcID() {
		return qcID;
	}

	public void setQcID(String qcID) {
		this.qcID = qcID;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	 @JSON(serialize=false)
	public QcService getQcService() {
		return qcService;
	}

	public void setQcService(QcService qcService) {
		this.qcService = qcService;
	}
	
	public String showQcList() {
	    //QCList = qcService.getAll();
		if (request.getSession().getAttribute("account")!=null){
		try{
		this.pageBean = qcService.getAll(this.rowsPerPage,this.page);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
		return "success";
	    }
		else{
			return "failed";
		}
	}
	public String showSearchedQcList(){
		if (request.getSession().getAttribute("account")!=null){
		String designCode = request.getParameter("designCode");
		//System.out.print("hahah--------"+designCode);
		String pQCTime = request.getParameter("pQCTime");
		String userName = request.getParameter("userName");
		String qCState = request.getParameter("qCState");
		//this.pageBean = qcService.getSearched(this.page,this.rowsPerPage,designCode,pQCTime,userName,qCState);
		//ArrayList<QCVO> qcvo = (ArrayList<QCVO>) this.pageBean.getAllList();
		//System.out.println("xainziatotal="+qcvo.size());
		try{
		this.pageBean = qcService.getSearched(this.page, this.rowsPerPage, designCode, pQCTime, userName, qCState);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
		return "success";
		}
		else{
			return "failed";
		}
		//7 17 10 18 6 12 2 9 8 19 11 13
		//ZJD12 YOPS8(state) 1980-08-08 08:08:08 84QUJF6ANM(name) KUTI8MDYF4P3LGRW9W J(code)
	}
	public String setCharge(){
		if (request.getSession().getAttribute("account")!=null){
		int userID = Integer.parseInt(this.userId);
		int qcID = Integer.parseInt(this.qcID);
		
		try{
		qcService.setCharge(userID,qcID);
		
		this.pageBean = qcService.getAll(this.rowsPerPage,this.page);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
		return "success";
		}
		else{
			return "failed";
		}
		
	}
	public String deleteQC(){
		if (request.getSession().getAttribute("account")!=null){
	    try{
		String selectedCode = request.getParameter("qc_Code");
		qcService.delete(selectedCode);
		this.pageBean =qcService.getAll(this.rowsPerPage,this.page);
		//System.out.println("delete1"+selectedCode);
	    }catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
		return "success";
		}
		else{
			return "failed";
		}
	}
	public String getAllChargeByPageAjax(){
		if (request.getSession().getAttribute("account")!=null){
		try {
			this.rowsPerPage = 6;
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(ChargeConstants.SEARCH_CHARGE_PARAMS[0], this.userName);
			
			//this.pageBean = qcService.getChargeByPage(this.rowsPerPage,this.page);
			this.pageBean = qcService.getChargeByPage(rowsPerPage, Integer.parseInt(this.user_page),params);
			//this.pageBean = qcService.getChargeByPage(rowsPerPage, this.page,params);
			
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
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
		}
		else{
			return "failed";
		}
	}
	
}
