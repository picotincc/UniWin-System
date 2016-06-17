package productManage.action.qc;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import antlr.collections.List;
import productManage.action.PageAction;
import productManage.model.wcy.Qc;
import productManage.service.qc.QcService;
import productManage.vo.qc.QCVO;
@Controller
public class QCDetailAction extends PageAction{

	@Autowired
	private QcService qcService;
	private int  qcID ;
	private QCVO qcVO;
	private String modify;
	private ArrayList<String> stageList;
	private ArrayList<String> resultList;
	public ArrayList<String> getStageList() {
		return stageList;
	}

	public void setStageList(ArrayList<String> stageList) {
		this.stageList = stageList;
	}

	public ArrayList<String> getResultList() {
		return resultList;
	}

	public void setResultList(ArrayList<String> resultList) {
		this.resultList = resultList;
	}

	private String current_stage;
	private String ifAdded;
	private String current_result;
	public String getCurrent_result() {
		return current_result;
	}

	public void setCurrent_result(String current_result) {
		this.current_result = current_result;
	}





	public String getCurrent_stage() {
		return current_stage;
	}

	public void setCurrent_stage(String current_stage) {
		this.current_stage = current_stage;
	}

	public String getIfAdded() {
		return ifAdded;
	}

	public void setIfAdded(String ifAdded) {
		this.ifAdded = ifAdded;
	}

	public String getModify() {
		return modify;
	}

	public void setModify(String modify) {
		this.modify = modify;
	}

	public QCVO getQcVO() {
		return qcVO;
	}

	public void setQcVO(QCVO qcVO) {
		this.qcVO = qcVO;
	}

	

	public int getQcID() {
		return qcID;
	}

	public void setQcID(int qcID) {
		this.qcID = qcID;
	}

	public QcService getQcService() {
		return qcService;
	}

	public void setQcService(QcService qcService) {
		this.qcService = qcService;
	}
	public String getQcDetail(){
		if (request.getSession().getAttribute("account")!=null){
		modify = "no";
		try{
	    ifAdded="";
		Qc qc = qcService.getQcById(qcID);
		
		this.qcVO = qcService.getQCVO(qc);
	    String stage = qc.getQCStages();
	    String result=qc.getQCResult();
	    String[] stage_temp = stage.split("\\/");
	 
	    stageList = new ArrayList<String>();
	    resultList = new ArrayList<String>();
	    
	    for(int i=0;i<stage_temp.length;i++){
	    
	    	stageList.add(stage_temp[i]);
	    }
	    String[] result_temp = result.split("\\/");
	    for(int i=0;i<result_temp.length;i++){
	    	resultList.add(result_temp[i]);
	    }
	    if(stage_temp.length==result_temp.length){
	    	ifAdded="质检单结果已填写";
	    }
	    String productionProgress = qc.getProduction().getProductionProgress();
	    if(productionProgress.equals("外发加工中")){
	    	if(stage.contains("外发加工检"))
	    		current_stage="外发加工检";
	    	else
	    		current_stage="当前无需质检环节";
	    	
	    }
        if(productionProgress.equals("完整收货")){
        	if(stage.contains("收货前检"))
	    		current_stage="收货前检";
	    	else
	    		current_stage="当前无需质检环节";
	    }
        if(productionProgress.equals("裁剪/工艺阶段")){
        	if(stage.contains("裁剪检验")){
	    		current_stage="裁剪检验";
	    		if(stage.contains("工艺检验"))
	    			current_stage="裁剪检验/工艺检验";
        	}
	    	else if(stage.contains("工艺检验"))
	    		current_stage="工艺检验";
	    	else
	    		current_stage="当前无需质检环节";
	
        }
         if(productionProgress.equals("质检中")){
        	 if(stage.contains("后道检验（含贴标）")){
 	    		current_stage="后道检验（含贴标）";
 	    		if(stage.contains("包装前全检"))
 	    			current_stage="后道检验（含贴标）/包装前全检";
         	}
 	    	else if(stage.contains("包装前全检"))
 	    		current_stage="包装前全检";
 	    	else
 	    		current_stage="当前无需质检环节";
        }  
         if(productionProgress.equals("质检完成")){
        	 current_stage="当前无需质检环节";
         }  
         if(productionProgress.equals("部分收货")){
        	 if(stage.contains("收货前检"))
 	    		current_stage="收货前检";
 	    	else
 	    		current_stage="当前无需质检环节";
         }  
         if(productionProgress.equals("采购中")){
        	 if(stage.contains("检验布料"))
 	    		current_stage="检验布料";
 	    	else
 	    		current_stage="当前无需质检环节";
         }  
	    //current_stage = stage_temp[stage_temp.length-1];
         current_result = result_temp[result_temp.length-1];
         
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
		
		return "success";
		}else{
			return "failed";
		}
	}
	
	public String addResult(){
		if (request.getSession().getAttribute("account")!=null){
		//模糊查询、作废、判断质检环节
		if(qcID==0){
			return "success";
		}
		else{
		Qc qc = qcService.getQcById(qcID);
		String qcResult = request.getParameter("qcResult");
		
		qc.setQCResult(qc.getQCResult()+"/"+qcResult);
	    qc.setQCState("已完结");
	    if(qcService.addresult(qc).equals("success")){
	    this.qcVO = qcService.getQCVO(qc);
	    modify = "yes";
		return "success";
		}
		else
		return "error";
		}
		}else{
			return "failed";
		}
	}
	
}
