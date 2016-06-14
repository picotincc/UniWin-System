package productManage.action.sampleOrders;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.PageAction;
import productManage.model.User;
import productManage.model.yk.SampleOrders;
import productManage.service.sampleOrders.SampleOrderService;
import productManage.vo.sampleOrders.SampleOrdersConstants;

public class SampleOrderAction extends PageAction{
	@Autowired
	private SampleOrderService sampleOrderService;
	
	private int sampleOrderID;
	private String sampleOrderCode;
	private SampleOrders sampleOrder;
	private String maker;
	private String date;
	private String sampleOrderProgress;
	private String day;
	
	public int getSampleOrderID() {
		return sampleOrderID;
	}

	public void setSampleOrderID(int sampleOrderID) {
		this.sampleOrderID = sampleOrderID;
	}

	public String getSampleOrderCode() {
		return sampleOrderCode;
	}

	public void setSampleOrderCode(String sampleOrderCode) {
		this.sampleOrderCode = sampleOrderCode;
	}
	
	public SampleOrders getSampleOrder() {
		return sampleOrder;
	}

	public void setSampleOrder(SampleOrders sampleOrder) {
		this.sampleOrder = sampleOrder;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getSampleOrderProgress() {
		return sampleOrderProgress;
	}

	public void setSampleOrderProgress(String sampleOrderProgress) {
		this.sampleOrderProgress = sampleOrderProgress;
	}
	
	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getSampleOrderByID(){
		if (request.getSession().getAttribute("account")!=null) {
			this.sampleOrder = sampleOrderService.getSampleOrderByID(sampleOrderID);
			Date dt=new Date();
		    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		    day = sdf.format(dt);
			if (sampleOrder==null) {
				return ERROR;
			}
			return SUCCESS;
		}else{
			return "failed";
		}
		
	}
	
	public String getSampleOrderByCode(){
		this.sampleOrder = sampleOrderService.getSampleOrderByCode(sampleOrderCode);
		if (sampleOrder==null) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String getAllSampleOrdersByPage() {
		if (request.getSession().getAttribute("account")!=null) {
			this.maker = null;
			this.date = null;
			this.sampleOrderProgress = null;
			this.pageBean = sampleOrderService.getAllSampleOrdersByPage(this.rowsPerPage,this.page);
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
	public String searchSampleOrdersByPage(){
		if (request.getSession().getAttribute("account")!=null) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(SampleOrdersConstants.SEARCH_SAMPLEORDERS_PARAMS[0], this.maker);
			params.put(SampleOrdersConstants.SEARCH_SAMPLEORDERS_PARAMS[1], this.date);
			params.put(SampleOrdersConstants.SEARCH_SAMPLEORDERS_PARAMS[2], this.sampleOrderProgress);
			
			this.pageBean = sampleOrderService.searchSampleOrdersByPage(this.rowsPerPage,this.page,params);
			return SUCCESS;
		}else{
			return "failed";
		}
	}
}
