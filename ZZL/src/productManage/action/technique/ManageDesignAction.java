package productManage.action.technique;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;


import productManage.action.PageAction;
import productManage.model.tms.Design;
import productManage.service.technique.DesignService;
import productManage.vo.technique.TechniqueConstants;;

/**
 * @author TMS
 * @date 2016-3-01
 */
public class ManageDesignAction extends PageAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private DesignService designService;


	private String designCode;
	private String putawayDate;
	public String showAllDesigns(){
		if (request.getSession().getAttribute("account")!=null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			this.pageBean = designService.getDesignsByPage(this.rowsPerPage, this.page);
			List<Design> designs = pageBean.getList();
			for(int i=0;i<designs.size();i++){
				Date putawayDate = designs.get(i).getDesignPutawayDate();
				String temp = format.format(putawayDate);
				System.out.println("String"+temp);
				try {
					putawayDate = format.parse(temp);
					System.out.println("date"+putawayDate);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				designs.get(i).setDesignPutawayDate(putawayDate);
			}
			setDesignCode("");
			setPutawayDate("");
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	


	public String execute() throws ServletException, IOException{
		if (request.getSession().getAttribute("account")!=null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[0],designCode);
			params.put(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[1], putawayDate);
			this.pageBean = designService.searchDesignsByPage(this.rowsPerPage, this.page, params);
			List<Design> designs = pageBean.getList();
			for(int i=0;i<designs.size();i++){
				Date putawayDate = designs.get(i).getDesignPutawayDate();
				String temp = format.format(putawayDate);
				System.out.println("String"+temp);
				try {
					putawayDate = format.parse(temp);
					System.out.println("date"+putawayDate);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				designs.get(i).setDesignPutawayDate(putawayDate);
			}
			return SUCCESS;
		}else{
			return "failed";
		}
	}

	
	public String getDesignCode() {
		return designCode;
	}

	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}

	public String getPutawayDate() {
		return putawayDate;
	}

	public void setPutawayDate(String putawayDate) {
		this.putawayDate = putawayDate;
	}
	public Date string_to_Date(String techDate){
		return null;
	}


}
