package productManage.action.conditionSheets;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import productManage.action.PageAction;
import productManage.model.yrd.TechniqueCondition;
import productManage.service.conditionSheets.TechniqueConditionService;


public class TechniqueConditionAction extends PageAction{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private TechniqueConditionService techniqueConditionService;
	private String type;
	private String date;
	
	/**
     * ajax传参
     */
    private String typeAjax;
    private String dateAjax;
    /**
     * ajax返回值：
     */
    private String techniqueConditionAjax;
    
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
    public void setTechniqueConditionAjax(String techniqueConditionAjax){
    	this.techniqueConditionAjax = techniqueConditionAjax;
    }
    public String getTechniqueConditionAjax(){
    	return techniqueConditionAjax;
    }
		
		
	public String techniqueCondition(){		
		return SUCCESS;
	}
	
	public String execute() throws JSONException{
		if (request.getSession().getAttribute("account")!=null){
			if(typeAjax.equals("年度")){
				System.out.println("1");
				List<TechniqueCondition> results = techniqueConditionService.getTechniqueConditionByYear(dateAjax);
				int tcVol = 0;
				for(int i=0;i<results.size();i++){
					tcVol += results.get(i).getTechConditionVol();
				}
				JSONArray json = new JSONArray();
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				Map map = new HashMap<String, Object>();
				map.put("date", dateAjax);
				map.put("tcVol", tcVol);
				list.add(map);
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("list", list);
			    Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				setTechniqueConditionAjax(gson.toJson(map2));
				
			}else{
				String[] dates = dateAjax.split("-");
				String year = dates[0];
				String month = dates[1];
				System.out.println(year);
				System.out.println(month);
				List<TechniqueCondition> results = techniqueConditionService.getTechniqueConditionByMonth(year,month);
				for(int i = 0;i<results.size();i++){
					System.out.println(results.get(i).getTechConditionVol());
				}			
				JSONArray json = new JSONArray();
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();			
				int i=0;
				for(TechniqueCondition tc:results){				
					Map map = new HashMap<String, Object>();
					map.put("date",results.get(i).getTechConditionDate());
					map.put("tcVol",results.get(i).getTechConditionVol() );
					list.add(map);
					i++;
				 }			
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("list", list);
			    Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				setTechniqueConditionAjax(gson.toJson(map2));
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
	
}
