package productManage.action.productionSchedule;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.PageAction;
import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.model.yk.Orders;
import productManage.service.ListManage.OutSourcePhaseService;

@Controller
public class OutSourceManageAction extends PageAction {
	@Autowired
	private OutSourcePhaseService outsourcePhaseService;
	private int outSourceID;
	private List<OutSourceDetail> outsourceDetail;
	private OutSource outsource;
	private int refernence_pirce; // 参考数量
	private String order_state; // 订单状态

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public int getRefernence_pirce() {
		return refernence_pirce;
	}

	public void setRefernence_pirce(int refernence_pirce) {
		this.refernence_pirce = refernence_pirce;
	}

	public OutSource getOutsource() {
		return outsource;
	}

	public void setOutsource(OutSource outsource) {
		this.outsource = outsource;
	}

	public List<OutSourceDetail> getOutsourceDetail() {
		return outsourceDetail;
	}

	public void setOutsourceDetail(List<OutSourceDetail> outsourceDetail) {
		this.outsourceDetail = outsourceDetail;
	}

	public int getOutSourceID() {
		return outSourceID;
	}

	public void setOutSourceID(int outSourceID) {
		this.outSourceID = outSourceID;
	}

	public String showAllOutSources() {
		if (request.getSession().getAttribute("account")!=null) {
		this.pageBean = outsourcePhaseService.getAllOutSourceInOutward(this.page, this.rowsPerPage);
		return "showAllOutSources";
		}
		else{
			return "failed";
		}
	}

	public String getOutSourceByID() {
		if (request.getSession().getAttribute("account")!=null) {
		this.outsource = outsourcePhaseService.getOutSourceByID(outSourceID);
		this.outsourceDetail = outsourcePhaseService.getOutSourceDetailByID(outSourceID);
		setNum(); // 参考数量
		order_state = getOrders(outsource).getOrderPriority(); // 优先级
		return "showOutSourceDetail";
		}
		else{
			return "failed";
		}
	}

	public String inquireOutSources() {// 查询
		if (request.getSession().getAttribute("account")!=null) {
		String design_code = request.getParameter("designCode");
		String designName = request.getParameter("designName");
		String outSource_date = request.getParameter("outSource_date");
		String inquiryProgress = request.getParameter("inquiryProgress");
		String outsource_code = request.getParameter("outsourceCode");

		// 生成sql语句
		StringBuffer hql = new StringBuffer();
		hql.append(
				"select o from OutSource o,Production p where o.production.productionID = p.productionID and p.productionState ='外发'");
		if (null != design_code && !"".equals(design_code)) {
			hql.append(" and o.design.designCode like '%" + design_code + "%'");
		}
		if (null != designName && !"".equals(designName)) {
			hql.append(" and o.design.designName like '%" + designName + "%'");
		}
		if (null != outSource_date && !"".equals(outSource_date)) {
			hql.append(" and o.referenceOutDate <='" + outSource_date + "'");
		}
		if (null != outsource_code && !"".equals(outsource_code)) {
			hql.append(" and o.outsourceCode like '%" + outsource_code + "%'");
		}
		if(null != inquiryProgress && !inquiryProgress.equals("请选择") && !"".equals(inquiryProgress)){
		/****
		 * 状态删选	
		 */
			this.pageBean = outsourcePhaseService.inquireOutSourceInOutward(hql.toString(),inquiryProgress,this.page, this.rowsPerPage);
		}		
		else{
		this.pageBean = outsourcePhaseService.inquireOutSourceInOutward(hql.toString(),null,this.page, this.rowsPerPage);
		}
		return "success";
		}
		else{
			return "failed";
		}
	}

	public void setNum() { // 参考数量设置
		refernence_pirce = 0;
		if (outsourceDetail == null)
			return;
		if (outsourceDetail.size() != 0) {
			for (int i = 0; i < outsourceDetail.size(); i++) {
				refernence_pirce += outsourceDetail.get(i).getOutsourceTotal();
			}
		}
	}

	// 获取优先级
	public Orders getOrders(OutSource outsource) {
		Set<Orders> orders = outsource.getProduction().getOrders();
		Iterator<Orders> it = orders.iterator();
		while (it.hasNext()) {
			return it.next();
		}
		return null;
	}

}
