package productManage.action.process;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.PageAction;
import productManage.model.cs.ReceiveDetail;
import productManage.service.process.ReceiveService;
import productManage.util.DateFormat;
import productManage.vo.PageBean;
import productManage.vo.process.ProcessConstants;
import productManage.vo.process.ReceiveVO;

public class ReceiveAction extends PageAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private ReceiveService receiveService;
	
	
	
	private boolean isAjaxRes(){		 
        String header = request.getHeader("X-Requested-With");
        if (header != null && "XMLHttpRequest".equals(header))
            return true;
        else
            return false;
	}
	
	/**
	 * 新增收货单
	 */
	private List<ReceiveDetail> details_add = new ArrayList<ReceiveDetail>();
	
	public String addReceive(){
		ReceiveVO receiveVO = new ReceiveVO();
		
		receiveVO.setOutsourceCode(request.getParameter("outsourceCode"));
		receiveVO.setProcessorCode(request.getParameter("processorCode"));
		receiveVO.setReceiveDate(DateFormat.StringToDate("2016-05-16"));
		receiveVO.setUserName("Suarez");
        receiveVO.setDetails(details_add);
        
        boolean tag = receiveService.addReceive(receiveVO);
        
        if(tag){
        	return "success";
        }else{
        	return "fail";
        }
		
	}

	public List<ReceiveDetail> getDetails_add() {
		return details_add;
	}

	public void setDetails_add(List<ReceiveDetail> details_add) {
		this.details_add = details_add;
	}
	
	
	/**
	 * 收货单列表显示
	 */
	private List<ReceiveVO> allList;
	
	public String showAllReceiveList(){
		try {
			this.pageBean = receiveService.queryAllReceive(this.rowsPerPage, this.page);
			this.allList = pageBean.getList();
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return "error";
		}
		return "success";
		
	}
		
	public List<ReceiveVO> getAllList() {
		return allList;
	}

	public void setAllList(List<ReceiveVO> allList) {
		this.allList = allList;
	}


	/**
	 * 收货单查询
	 */
	private String processorName;
	private String receiveDate;
	private String designCode;
	
	public String queryReceive(){
		Map<String, Object> params = new HashMap<String, Object>();
		if(!(this.processorName.equals(""))){
			params.put(ProcessConstants.SEARCH_RECEIVE_PARAMS[0], this.processorName);
		}
		if(!(this.receiveDate.equals(""))){
			params.put(ProcessConstants.SEARCH_RECEIVE_PARAMS[1], this.receiveDate);
		}
		if(!(this.designCode.equals(""))){
			params.put(ProcessConstants.SEARCH_RECEIVE_PARAMS[2], this.designCode);
		}
		try {			
			this.pageBean = receiveService.queryReceive(this.rowsPerPage, this.page, params);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return "error";
		}
		return "success";
		
	}

	public String getProcessorName() {
		return processorName;
	}

	public void setProcessorName(String processorName) {
		this.processorName = processorName;
	}

	public String getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getDesignCode() {
		return designCode;
	}

	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}
	
	
	/**
	 * 收货单作废
	 */
	public String cancelReceive(){
		String id = request.getParameter("cancelID");
		boolean res = receiveService.cancelReceive(Integer.parseInt(id));
		if(res){
			return "success";
		}
			
		return "error";
	}
	
	/**
	 * 收货单获取
	 */
	private ReceiveVO getRO;
	private List<ReceiveDetail> getDetails = new ArrayList<ReceiveDetail>();
	private int detailSize;
	
	public String getReceive(){
		String rid = request.getParameter("receiveID");
		this.getRO = receiveService.getReceiveVO(Integer.parseInt(rid));	
		this.getDetails = this.getRO.getDetails();
		this.detailSize = this.getDetails.size();
		return "success";
	}

	public ReceiveVO getGetRO() {
		return getRO;
	}

	public void setGetRO(ReceiveVO getRO) {
		this.getRO = getRO;
	}

	public List<ReceiveDetail> getGetDetails() {
		return getDetails;
	}

	public void setGetDetails(List<ReceiveDetail> getDetails) {
		this.getDetails = getDetails;
	}

	public int getDetailSize() {
		return detailSize;
	}

	public void setDetailSize(int detailSize) {
		this.detailSize = detailSize;
	}
	
	/**
	 * 收货单修改
	 */
	private List<ReceiveDetail> details_modify = new ArrayList<ReceiveDetail>();
	
	public String modifyReceive(){
		ReceiveVO vo = new ReceiveVO();
		vo.setReceiveID(Integer.parseInt(request.getParameter("receiveID")));		
		vo.setReceiveDate(DateFormat.StringToDate(request.getParameter("receiveDate")));
		vo.setUserName(request.getParameter("userName"));
		vo.setDetails(this.details_modify);
		boolean tag = receiveService.modifyReceive(vo);
		if(tag){
			return "success";
		}
		return "fail";
	}

	public List<ReceiveDetail> getDetails_modify() {
		return details_modify;
	}

	public void setDetails_modify(List<ReceiveDetail> details_modify) {
		this.details_modify = details_modify;
	}
	
	/**
	 * 收货单列表显示
	 */
	private String detailMsg;
	private int rid;
	
	public String getReceiveDetails(){
		List<ReceiveDetail> dList = new ArrayList<ReceiveDetail>();
		if(isAjaxRes()){
			this.detailMsg = null;
			dList = receiveService.getReceiveDetails(rid);
			if( dList != null ){
				try{
				JSONArray json = new JSONArray();
				for(ReceiveDetail d : dList){
	                JSONObject jo = new JSONObject();
	                jo.put("receiveColor", d.getReceiveColor());
	                jo.put("receiveXS", d.getReceiveXS());
	                jo.put("receiveS", d.getReceiveS());
	                jo.put("receiveM", d.getReceiveM());
	                jo.put("receiveL", d.getReceiveL());
	                jo.put("receiveXL", d.getReceiveXL());
	                jo.put("receiveXXL", d.getReceiveXXL());
	                jo.put("receiveTotal", d.getReceiveTotal());
	                json.put(jo);
	            } 
					this.detailMsg = json.toString();
				}catch(Exception e){
					System.out.println(e);
				}
				return "success";
			}
		}
		
		return "success";		
	}

	public String getDetailMsg() {
		return detailMsg;
	}

	public void setDetailMsg(String detailMsg) {
		this.detailMsg = detailMsg;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}
	
	


}
