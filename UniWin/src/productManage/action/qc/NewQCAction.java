package productManage.action.qc;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.PageAction;
import productManage.model.User;
import productManage.model.wcy.Qc;
import productManage.model.yk.Orders;
import productManage.model.zky.Production;
import productManage.service.qc.QcService;
import productManage.service.system.UserService;
import productManage.vo.qc.DesignConstants;
import productManage.vo.qc.QCVO;
import productManage.vo.system.ChargeConstants;


@Controller
public class NewQCAction extends PageAction{

	@Autowired
	private QcService qcService;
	
	private QCVO qcVO;
	private String designCode;
	private String designJson;
	private String orderID;
	private String QCStages;
	public String getQCStages() {
		return QCStages;
	}

	public void setQCStages(String qCStages) {
		QCStages = qCStages;
	}

	public String getQCComment() {
		return QCComment;
	}

	public void setQCComment(String qCComment) {
		QCComment = qCComment;
	}
	private String QCComment;
	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public String getDesignJson() {
		return designJson;
	}

	public void setDesignJson(String designJson) {
		this.designJson = designJson;
	}

	public String getDesignCode() {
		return designCode;
	}

	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}

	public QCVO getQcVO() {
		return qcVO;
	}

	public void setQcVO(QCVO qcVO) {
		this.qcVO = qcVO;
	}

	public String newQc(){
		if (request.getSession().getAttribute("account")!=null){
		this.designCode =null;
		this.designJson=null;
		this.orderID=null;
		this.pageBean = null;
		this.page=1;
		this.QCComment =null;
		this.QCStages=null;
		this.qcVO=null;
		return "success";
		}
		else{
			return "failed";
		}
	}

	public QcService getQcService() {
		return qcService;
	}

	public void setQcService(QcService qcService) {
		this.qcService = qcService;
	}
	
	
	public String getAllDesignByPageAjax(){
		if (request.getSession().getAttribute("account")!=null){
		try {
			this.rowsPerPage = 6;
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(DesignConstants.SEARCH_DESIGN_PARAMS[0], this.designCode);
			
			this.pageBean = qcService.getDesignByPage(rowsPerPage, this.page,params);
			List<Orders> orderList = pageBean.getList();
			JSONObject json = new JSONObject();
			json.put("totalPage", pageBean.getTotalPage());
			json.put("currentPage", pageBean.getCurrentPage());
			JSONArray orders = new JSONArray();
			json.put("orders", orders);
			for (int i = 0; i < orderList.size(); i++) {
				Orders orderX = orderList.get(i);
				JSONObject order = new JSONObject();
				order.put("productionID",orderX.getProduction().getProductionID());
				order.put("orderID", orderX.getOrderID());
				order.put("productionCode", orderX.getProduction().getProductionCode());
				order.put("designCode", orderX.getDesign().getDesignCode());
				orders.put(order);
			}
			setDesignJson(json.toString());
			//System.out.println(userJson);
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
	
	
	public String  newQcByDesign(){
		//orderID =request.getParameter("order_ID");
		//System.out.println("aaaaaaaa"+orderID);
	   // this.qcVO =new QCVO();
		if (request.getSession().getAttribute("account")!=null){
		try{
			qcVO = qcService.getQCVOByOrder(Integer.parseInt(this.orderID));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
		//System.out.println("aaaaaaaa"+qcVO.getDesign().getDesignCode());
		orderID = null;
		return "success";
		}
		else{
			return "failed";
		}
	}
	public String addQC(){
		//System.out.println("aaaaaaaaaaa"+qcVO.getDesign().getDesignCode());
		
		//System.out.println("qqqqqqqqqqqqwdqfeeca"+qcstages.length);
		if (request.getSession().getAttribute("account")!=null){
		Qc qc=new Qc();
		qc.setProduction(qcVO.getProduction());
		
		SimpleDateFormat fmt=new SimpleDateFormat("hhmmss_yyyyMMdd");
		qc.setQCCode("ZJD"+fmt.format(new Date()));
		qc.setQCComment(request.getParameter("QCComment"));
		String[] temp = request.getParameterValues("QCStages");
		String qcStages = null;
		for(int i=0;i<temp.length;i++){
			if(i==0) 
				qcStages =  temp[i];
			else
				qcStages = qcStages+"/"+temp[i];
		}
		qc.setQCStages(qcStages);
		qc.setQCState("未进行");
		try{
		qcService.add(qc);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
		return "success";
		//输入为空，增加表格行
		}
		else{
			return "failed";
		}
	}
}
