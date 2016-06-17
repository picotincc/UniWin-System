package productManage.action.inquiry;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import productManage.action.PageAction;
import productManage.service.inquiry.InquiryService;
import productManage.vo.inquiry.InquiryConstants;

/**
 * @author TMS
 * @date 2016-3-01
 */
public class ShowInquiryListAction extends PageAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private InquiryService inquiryService;
	public InquiryService getInquiryService() {
		return inquiryService;
	}

	public void setInquiryService(InquiryService inquiryService) {
		this.inquiryService = inquiryService;
	}

	private String inquiryCode;
	private String not_priced;
	public String showAllInquiryList(){
		if (request.getSession().getAttribute("account")!=null) {
			this.pageBean = inquiryService.getShowedInquiryByPage(this.rowsPerPage, this.page);
			setInquiryCode("");
			setNot_priced("");
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
	public String showSearchedInquiryList(){
		if (request.getSession().getAttribute("account")!=null) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(InquiryConstants.SEARCH_INQUIRY_PARAMS[0], inquiryCode);
			params.put(InquiryConstants.SEARCH_INQUIRY_PARAMS[1], not_priced);
			if((inquiryCode.isEmpty())&&((not_priced.equals("无")||not_priced.equals("请选择")))){
				this.pageBean = inquiryService.getShowedInquiryByPage(this.rowsPerPage, this.page);
			}
			else{
				this.pageBean = inquiryService.queryInquiry(this.rowsPerPage, this.page, params);
			}
			return SUCCESS;
		}else{
			return "failed";
		}
		
	}

	public String getInquiryCode() {
		return inquiryCode;
	}

	public void setInquiryCode(String inquiryCode) {
		this.inquiryCode = inquiryCode;
	}

	public String getNot_priced() {
		return not_priced;
	}

	public void setNot_priced(String not_priced) {
		this.not_priced = not_priced;
	}






}
