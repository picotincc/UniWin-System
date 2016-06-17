package productManage.action.conditionSheets;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import productManage.action.PageAction;
import productManage.model.yrd.PhaseCondition;
import productManage.model.yrd.TechniqueCondition;
import productManage.service.conditionSheets.PhaseConditionService;

public class PhaseConditionAction extends PageAction {
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private PhaseConditionService phaseConditionService;
	private String type;
	private String date;
	private String phase;
	/**
     * ajax传参
     */
    private String typeAjax;
    private String dateAjax;
    private String phaseAjax;
    /**
     * ajax返回值：
     */
    private String phaseConditionAjax;
    
    public void setTypeAjax(String typeAjax){
    	this.typeAjax = typeAjax;
    }
    public String getTypeAjax(){
    	return typeAjax;
    }
    public void setDateAjax(String dateAjax){
    	this.dateAjax = dateAjax;
    }
    public String getDateAjax(){
    	return dateAjax;
    }
    public void setPhaseAjax(String phaseAjax){
    	this.phaseAjax = phaseAjax;
    }
    public String getPhaseAjax(){
    	return phaseAjax;
    }
    public void setPhaseConditionAjax(String phaseConditionAjax){
    	this.phaseConditionAjax = phaseConditionAjax;
    }
    public String getPhaseConditionAjax(){
    	return phaseConditionAjax;
    }
	
    
	public String phaseCondition(){		
		return SUCCESS;
	}
	
	public String execute() throws JSONException{
		if (request.getSession().getAttribute("account")!=null){
//			System.out.println("进入环节订单");
			String type = request.getParameter("type");
			String date = request.getParameter("date");
			String phase = request.getParameter("phase");
			if(typeAjax.equals("年度")){
				List<PhaseCondition> results = phaseConditionService.getPhaseConditionByYear(dateAjax,phaseAjax);
				int tcVol = 0;
				for(int i=0;i<results.size();i++){
					tcVol += results.get(i).getPhasesConditionVol();
				}
				System.out.println(tcVol);
				
				JSONArray json = new JSONArray();
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
//				for(PhaseCondition tc:results){
					Map map = new HashMap<String, Object>();
					map.put("date", dateAjax);
					map.put("tcVol", tcVol);
					list.add(map);
//				}
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("list", list);
			    Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				setPhaseConditionAjax(gson.toJson(map2));
			}else{
				String[] dates = dateAjax.split("-");
				String year = dates[0];
				String month = dates[1];
				List<PhaseCondition> results = phaseConditionService.getPhaseConditionByMonth(year,month,phaseAjax);
				JSONArray json = new JSONArray();
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
//				for(int i = 0;i<results.size();i++){
				int i = 0;
				for(PhaseCondition tc:results){
					Map map = new HashMap<String, Object>();
					map.put("date",results.get(i).getPhasesConditionDate());
					map.put("tcVol",results.get(i).getPhasesConditionVol() );
					list.add(map);
					i++;
				 }				
//				}
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("list", list);
			    Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				setPhaseConditionAjax(gson.toJson(map2));
			}
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
	
	public void setType(String type){
		this.type = type;
	}
	public String getType(){
		return type;
	}
	
	public void setDate(String date){
		this.date = date;
	}
	public String getDate(){
		return date;
	}
	
	public void setPhase(String phase){
		this.phase = phase;
	}
	public String getPhase(){
		return phase;
	}

}
