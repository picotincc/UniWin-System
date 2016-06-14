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
import productManage.model.yrd.ModelCondition;
import productManage.model.yrd.TechniqueCondition;
import productManage.service.conditionSheets.ModelConditionService;

public class ModelConditionAction extends PageAction {
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private ModelConditionService modelConditionService;
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
    private String modelConditionAjax;
    
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
    public void setModelConditionAjax(String modelConditionAjax){
    	this.modelConditionAjax = modelConditionAjax;
    }
    public String getModelConditionAjax(){
    	return modelConditionAjax;
    }
	
	public String modelCondition() {		
		return SUCCESS;		
	}
	
	
	public String execute() throws JSONException{
		if (request.getSession().getAttribute("account")!=null){
			if(typeAjax.equals("年度")){
				System.out.println("制版单年度");
				List<ModelCondition> results = modelConditionService.getModelConditionByYear(dateAjax);
				int tcVol = 0;
				for(int i=0;i<results.size();i++){
					tcVol += results.get(i).getModelConditionVol();
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
				setModelConditionAjax(gson.toJson(map2));
			}else{
				String[] dates = dateAjax.split("-");
				String year = dates[0];
				String month = dates[1];
				List<ModelCondition> results = modelConditionService.getModelConditionByMonth(year,month);
				JSONArray json = new JSONArray();
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				System.out.println(results.get(0).getModelConditionVol());
				int i=0;
					for(ModelCondition tc:results){
						Map map = new HashMap<String, Object>();
						map.put("date",results.get(i).getModelConditionDate());
						map.put("tcVol",results.get(i).getModelConditionVol() );
						list.add(map);
						i++;
					 }
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("list", list);
			    Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				setModelConditionAjax(gson.toJson(map2));
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
