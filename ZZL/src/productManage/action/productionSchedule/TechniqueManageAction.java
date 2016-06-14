package productManage.action.productionSchedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.PageAction;
import productManage.service.ListManage.TechniquePhaseService;
@Controller
public class TechniqueManageAction extends PageAction{
	@Autowired
	private TechniquePhaseService techniqueservice;
	private String outsourceID;

	public String showAllOutSources(){
		if (request.getSession().getAttribute("account")!=null) {
		this.pageBean = techniqueservice.getAllOutSourceInTechnique(this.page, this.rowsPerPage);
		return "success";
		}
		else{
			return "failed";
		}
	
	}
	
	public String InquireOutSourceInTechnique(){
		if (request.getSession().getAttribute("account")!=null) {
		String designCode = request.getParameter("designCode");
		String designName = request.getParameter("designName");
		String outsourceCode = request.getParameter("outsourceCode");
		String technique = request.getParameter("technique");           //工艺查询按什么查询
		String outSource_date = request.getParameter("outSource_date");
		
		//生成sql语句
		StringBuffer hql = new StringBuffer();
		hql.append("select o from OutSource o,Production p where o.production.productionID = p.productionID and p.productionState ='工艺'");
		
		if(null != designCode && !"".equals(designCode)){
			hql.append(" and o.design.designCode like '%"+designCode+"%'");
		}
		if(null != designName && !"".equals(designName)){
			hql.append(" and o.design.designName like '%"+designName+"%'");
		}
		if(null != outsourceCode && !"".equals(outsourceCode)){
			hql.append(" and o.outsourceCode like '%"+outsourceCode+"%'");
		}
		if(null!=outSource_date && !"".equals(outSource_date)){
			hql.append(" and o.referenceOutDate <='"+outSource_date+"'");
		}
		if(null!=technique && !"".equals(technique)){
			hql.append(" and o.design.technique.techCode like '%"+technique+"%'");
		}
		this.pageBean = techniqueservice.inquireOutSourceInTechnique(hql.toString(), this.page,this.rowsPerPage);
		return "success";
		}
		else{
			return "failed";
		}
	}
	
    public String changeTechniqueState(){
    	if (request.getSession().getAttribute("account")!=null) {
    	String changeCode = request.getParameter("changeCode");
		String beginTime = request.getParameter("beginTime");
		if(null != beginTime && !"".equals(beginTime)){
			techniqueservice.endTechniquePhase(Integer.parseInt(changeCode));
		}
		else{
			techniqueservice.beginTechniquePhase(Integer.parseInt(changeCode));
		}
		this.pageBean = techniqueservice.getAllOutSourceInTechnique(this.page, this.rowsPerPage);
		return "success";
    	}
		else{
			return "failed";
		}
    }

	public String getOutsourceID() {
		return outsourceID;
	}

	public void setOutsourceID(String outsourceID) {
		this.outsourceID = outsourceID;
	}
	
	
}
