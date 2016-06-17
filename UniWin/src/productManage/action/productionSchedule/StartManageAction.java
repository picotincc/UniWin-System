package productManage.action.productionSchedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.PageAction;
import productManage.service.ListManage.StartManageService;
@Controller
public class StartManageAction extends PageAction {
	@Autowired
	private StartManageService startmanageservice;
	
	public String showAllOutSources(){
		if (request.getSession().getAttribute("account")!=null) {
		this.pageBean = startmanageservice.getAllOutSource(this.page, this.rowsPerPage);
		return "success";	
		}
		else{
			return "failed";
		}
	}
	
	public String changeProductionState(){
		if (request.getSession().getAttribute("account")!=null) {
		String outSourceID_select = request.getParameter("selectedCode");
		String[] selects = outSourceID_select.split(",");
		for(int i=0;i<selects.length;i++){
			startmanageservice.changeProductionState(Integer.parseInt(selects[i]));
		}
		this.pageBean = startmanageservice.getAllOutSource(this.page, this.rowsPerPage);
		return "success";
		}
		else{
			return "failed";
		}
	}


	public String inquire(){
		if (request.getSession().getAttribute("account")!=null) {
		String designCode = request.getParameter("designCode");
		String designName = request.getParameter("designName");
		String outsourceCode = request.getParameter("outsourceCode");
		String outSource_date = request.getParameter("outSource_date");
		
				StringBuffer hql = new StringBuffer();
				hql.append(
						"select o from OutSource o,Production p where o.production.productionID = p.productionID and p.productionState ='未排单'");
				if (null != designCode && !"".equals(designCode)) {
					hql.append(" and o.design.designCode like '%" + designCode + "%'");
				}
				if (null != designName && !"".equals(designName)) {
					hql.append(" and o.design.designName like '%" + designName + "%'");
				}
				if (null != outSource_date && !"".equals(outSource_date)) {
					hql.append(" and o.referenceOutDate <='" + outSource_date + "'");
				}
				if (null != outsourceCode && !"".equals(outsourceCode)) {
					hql.append(" and o.outsourceCode like '%" + outsourceCode + "%'");
				}
	this.pageBean = startmanageservice.inquireOutSourceInOutward(hql.toString(),this.page, this.rowsPerPage);		
		
		return "success";
		}
		else{
			return "failed";
		}
	}
	
}

