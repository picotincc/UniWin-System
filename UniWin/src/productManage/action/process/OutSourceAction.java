package productManage.action.process;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.PageAction;
import productManage.model.User;
import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.model.cs.Processor;
import productManage.model.tms.Design;
import productManage.model.zky.Production;
import productManage.service.process.OutSourceService;
import productManage.util.DateFormat;
import productManage.vo.PageBean;
import productManage.vo.process.OutSourceVO;
import productManage.vo.process.ProcessConstants;

public class OutSourceAction extends PageAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private OutSourceService outSourceService;
	
	/**
	 * 新增外发单
	 */
	private List<OutSourceDetail> details_add = new ArrayList<OutSourceDetail>();
	
	public String addOutSource(){
		OutSource os = new OutSource();
		os.setOutsourceCode(request.getParameter("outSourceCode"));
		
		Production p = new Production();
		p.setProductionCode(request.getParameter("productionCode"));
        os.setProduction(p);
        
        Design d = new Design();
        d.setDesignCode(request.getParameter("designCode"));
        os.setDesign(d);
        
        os.setFinishDate(DateFormat.StringToDate(request.getParameter("finishDate")));
        os.setOsScheduleDate(DateFormat.StringToDate(request.getParameter("osScheduleDate")));
        os.setOutsourceState(request.getParameter("outSourceState"));
        os.setLabourCost(Integer.parseInt(request.getParameter("labourCost")));
        
        Processor processor = new Processor();
        processor.setProcessorCode(request.getParameter("processorCode"));
        os.setProcessor(processor);
        
        os.setActualOutDate(DateFormat.StringToDate(request.getParameter("actualOutDate")));

        User user = new User();
        user.setUserName(request.getParameter("userName"));
        os.setUser(user);
        
        OutSource o = outSourceService.addOutSource(os);
        details_add.remove(details_add.size()-1);
        System.out.println(details_add.size());
        if(o!=null){
        	outSourceService.addOutSourceDetail(o, details_add);
        	return "success";
        }else{
        	return "fail";
        }
		
	}

	public List<OutSourceDetail> getDetails_add() {
		return details_add;
	}

	public void setDetails_add(List<OutSourceDetail> details_add) {
		this.details_add = details_add;
	}
	
	
	
	
	/**
	 * 外发单列表显示
	 */
	
	public String showAllOutSourceList(){
		try {
			this.pageBean = outSourceService.queryAllOutSource(this.rowsPerPage, this.page);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return "error";
		}
		return "success";
		
	}
	
	/**
	 * 外发单查询
	 */
	private String outSourceCode;
	private String designCode;
	private String osDate;
	private String finishDate;
	
	public String queryOutSource(){
		Map<String, Object> params = new HashMap<String, Object>();
		if(!(this.outSourceCode.equals(""))){
			params.put(ProcessConstants.SEARCH_OUTSOURCE_PARAMS[0], this.outSourceCode);
		}
		if(!(this.designCode.equals(""))){
			params.put(ProcessConstants.SEARCH_OUTSOURCE_PARAMS[1], this.designCode);
		}
		if(!(this.osDate.equals(""))){
			params.put(ProcessConstants.SEARCH_OUTSOURCE_PARAMS[2], this.osDate);
		}
		if(!(this.finishDate.equals(""))){
			params.put(ProcessConstants.SEARCH_OUTSOURCE_PARAMS[3], this.finishDate);
		}
		try {			
			this.pageBean = outSourceService.queryOutSource(this.rowsPerPage, this.page, params);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return "error";
		}
		return "success";
		
	}

	public String getOutSourceCode() {
		return outSourceCode;
	}

	public void setOutSourceCode(String outSourceCode) {
		this.outSourceCode = outSourceCode;
	}

	public String getDesignCode() {
		return designCode;
	}

	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}

	public String getOsDate() {
		return osDate;
	}

	public void setOsDate(String osDate) {
		this.osDate = osDate;
	}

	public String getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}
	
	
	/**
	 * 外发单修改状态
	 */
	public String changeState(){
		String code = request.getParameter("changeCode");
		String state = request.getParameter("outsourceState");
		OutSource os = outSourceService.changeState(code, state);
		if(os == null){
			return "error";
		}
			
		return "success";
	}
	
	
	/**
	 * 外发单作废
	 */
	public String cancelOutSource(){
		String code = request.getParameter("cancelCode");
		boolean res = outSourceService.cancelOutSource(code);
		if(res){
			return "success";
		}
			
		return "error";
	}
	
	/**
	 * 外发单获取至修改页面
	 */
	private OutSourceVO getOS;
	private List<OutSourceDetail> getDetails = new ArrayList<OutSourceDetail>();
	private int detailSize;
	public String getOutSource(){
		String code = request.getParameter("codeID");
		this.getOS = outSourceService.getOutSourceVO(code);	
		this.getDetails = this.getOS.getDetails();
		this.detailSize = this.getDetails.size();
		return "success";
	}

	public OutSourceVO getGetOS() {
		return getOS;
	}

	public void setGetOS(OutSourceVO getOS) {
		this.getOS = getOS;
	}

	public List<OutSourceDetail> getGetDetails() {
		return getDetails;
	}

	public void setGetDetails(List<OutSourceDetail> getDetails) {
		this.getDetails = getDetails;
	}

	public int getDetailSize() {
		return detailSize;
	}

	public void setDetailSize(int detailSize) {
		this.detailSize = detailSize;
	}
	
	
	/**
	 * 外发单修改
	 */
	private List<OutSourceDetail> details_modify = new ArrayList<OutSourceDetail>();
	
	public String modifyOutSource(){
		OutSourceVO vo = new OutSourceVO();
		vo.setOutsourceID(Integer.parseInt(request.getParameter("os_outsourceID")));
		vo.setOsCode(request.getParameter("os_code"));
		vo.setProductionID(request.getParameter(""));
		vo.setDesignCode(request.getParameter("os_designCode"));
		vo.setFinishDate(DateFormat.StringToDate(request.getParameter("os_finishDate")));
		vo.setOsScheduleDate(DateFormat.StringToDate(request.getParameter("os_scheduleDate")));
		vo.setLabourCost(Float.parseFloat(request.getParameter("os_labourCost")));
		vo.setProcessorCode(request.getParameter("os_processorCode"));
		vo.setUserName(request.getParameter("os_userName"));
		vo.setActualOutDate(DateFormat.StringToDate(request.getParameter("os_actualOutDate")));
		vo.setDetails(this.details_modify);
		boolean tag = outSourceService.modifyOutSource(vo);
		if(tag){
			return "success";
		}
		return "fail";
	}

	public List<OutSourceDetail> getDetails_modify() {
		return details_modify;
	}

	public void setDetails_modify(List<OutSourceDetail> details_modify) {
		this.details_modify = details_modify;
	}
	
	
	
	

}
