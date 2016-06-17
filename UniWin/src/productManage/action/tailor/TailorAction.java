package productManage.action.tailor;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.PageAction;
import productManage.service.tailor.TailorService;
import productManage.vo.PageBean;
import productManage.vo.tailor.TailorConstants;
import productManage.vo.tailor.TailorDetailVO;

@Controller
public class TailorAction extends PageAction {
	@Autowired
	private TailorService tailorService;
	private String productionCode;
	private String designCode;

	private String tailorID;
	private TailorDetailVO tailorDetailVO;
	private String startTime;
	private String finishTime;
	private String xs;
	private String s;
	private String m;
	private String l;
	private String xl;
	private String xxl;

	@Override
	public String queryPage() throws Exception {
		if (request.getSession().getAttribute("account") != null) {
			this.productionCode = null;
			this.designCode = null;
			return queryPageWithParams();
		} else {
			return "failed";
		}
	}

	public String queryPageWithParams() throws Exception {
		if (request.getSession().getAttribute("account") != null) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(TailorConstants.SEARCH_TAILOR_PARAMS[0], this.productionCode);
			params.put(TailorConstants.SEARCH_TAILOR_PARAMS[1], this.designCode);
			try {
				this.pageBean = tailorService.queryTailorsCondition(this.rowsPerPage, this.page, params);
			} catch (Exception e) {
				e.printStackTrace();
				this.pageBean = new PageBean();
				return ERROR;
			}
			return SUCCESS;
		} else {
			return "failed";
		}
	}

	public String queryTailor() {
		if (request.getSession().getAttribute("account") != null) {
			try {
				this.tailorDetailVO = tailorService.queryTailor(Integer.parseInt(tailorID));
			} catch (Exception e) {
				e.printStackTrace();
				return ERROR;
			}
			return SUCCESS;
		} else {
			return "failed";
		}
	}

	public String modifyTailor() {
		if (request.getSession().getAttribute("account") != null) {
			try {
				tailorDetailVO = new TailorDetailVO();
				tailorDetailVO.setTailorID(Integer.parseInt(tailorID.equals("") ? "-1" : tailorID));
				tailorDetailVO.setStartTime(startTime);
				tailorDetailVO.setFinishTime(finishTime);
				tailorDetailVO.setActualXS(Integer.parseInt(xs.equals("") ? "-1" : xs));
				tailorDetailVO.setActualS(Integer.parseInt(s.equals("") ? "-1" : s));
				tailorDetailVO.setActualM(Integer.parseInt(m.equals("") ? "-1" : m));
				tailorDetailVO.setActualL(Integer.parseInt(l.equals("") ? "-1" : l));
				tailorDetailVO.setActualXL(Integer.parseInt(xl.equals("") ? "-1" : xl));
				tailorDetailVO.setActualXXL(Integer.parseInt(xxl.equals("") ? "-1" : xxl));
				this.tailorDetailVO = tailorService.modifyTailor(tailorDetailVO);
			} catch (Exception e) {
				e.printStackTrace();
				return ERROR;
			}
			return SUCCESS;
		} else {
			return "failed";
		}
	}

	public String getProductionCode() {
		return productionCode;
	}

	public void setProductionCode(String productionCode) {
		this.productionCode = productionCode;
		this.page = 1;// 若查询条件发生变化，从第一页开始
	}

	public String getDesignCode() {
		return designCode;
	}

	public void setDesignCode(String designCode) {
		this.designCode = designCode;
		this.page = 1;// 若查询条件发生变化，从第一页开始
	}

	public String getTailorID() {
		return tailorID;
	}

	public void setTailorID(String tailorID) {
		this.tailorID = tailorID;
	}

	public TailorDetailVO getTailorDetailVO() {
		return tailorDetailVO;
	}

	public void setTailorDetailVO(TailorDetailVO tailorDetailVO) {
		this.tailorDetailVO = tailorDetailVO;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

	public String getXs() {
		return xs;
	}

	public void setXs(String xs) {
		this.xs = xs;
	}

	public String getS() {
		return s;
	}

	public void setS(String s) {
		this.s = s;
	}

	public String getM() {
		return m;
	}

	public void setM(String m) {
		this.m = m;
	}

	public String getL() {
		return l;
	}

	public void setL(String l) {
		this.l = l;
	}

	public String getXl() {
		return xl;
	}

	public void setXl(String xl) {
		this.xl = xl;
	}

	public String getXxl() {
		return xxl;
	}

	public void setXxl(String xxl) {
		this.xxl = xxl;
	}

}
