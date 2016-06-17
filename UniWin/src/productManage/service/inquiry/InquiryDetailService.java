package productManage.service.inquiry;

import productManage.model.yk.InquiryDetail;

/**
 * @author TMS
 * @date 2016-3-01
 */
public interface InquiryDetailService {
	public InquiryDetail findByInquiryCode(String code);
}
