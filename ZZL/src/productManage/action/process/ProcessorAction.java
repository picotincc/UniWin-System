package productManage.action.process;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.PageAction;
import productManage.model.cs.Processor;
import productManage.service.process.ProcessorService;
import productManage.util.DateFormat;
import productManage.vo.PageBean;
import productManage.vo.process.ProcessConstants;


@SuppressWarnings("serial")
public class ProcessorAction extends PageAction{

	@Autowired
	private ProcessorService processorService;
	
	/**
	 * 加工方查询
	 */
	private String processorName;
	
	public String queryProcessor(){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put(ProcessConstants.SEARCH_PROCESSOR_PARAMS[0], this.processorName);
		try {
			this.pageBean = processorService.queryProcessor(this.rowsPerPage, this.page, params);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return ERROR;
		}
		return "success";
	}
	
	public String getProcessorName() {
		return processorName;
	}
	
	public void setProcessorName(String processorName) {
		this.processorName = processorName;
	}
	
	/**
     * 加工方列表显示
     */
	
	public String showAllProcessorList(){
		Map<String, Object> params = new HashMap<String, Object>();
		this.processorName = null;
		try {
			this.pageBean = processorService.queryProcessor(this.rowsPerPage, this.page, params);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return ERROR;
		}
		return "success";
	}
	
	
	/**
     * 新增加工方
     */
	public String addProcessor(){
		Processor processor = new Processor();
		processor.setProcessorCode(request.getParameter("new_Code"));
		processor.setProcessorName(request.getParameter("new_Name"));
		processor.setProcessorState(request.getParameter("new_State"));
		processor.setProcessorInitialPassword(request.getParameter("new_Password"));
		processor.setProcessorMobileNum(request.getParameter("new_Mobile"));
		processor.setProcessorRank(request.getParameter("new_Rank"));
		processor.setProcessorAddr(request.getParameter("new_Addr"));
		processor.setProcessorWorkerNum(Integer.parseInt(request.getParameter("new_WorkerNum")));
		processor.setProcessorDistrict(request.getParameter("new_District"));
		processor.setDeliveryType(request.getParameter("new_DeliveryType"));
		processor.setStartingDate(DateFormat.StringToDate(request.getParameter("new_StartingDate")));
		processor.setProcessorComment(request.getParameter("new_Comment"));
		boolean tag = processorService.addProcessor(processor);
		if(tag){
			return "success";		
		}
		return "fail";
		
	}
	
	

}
