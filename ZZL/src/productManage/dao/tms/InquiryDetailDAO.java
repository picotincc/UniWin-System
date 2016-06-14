package productManage.dao.tms;

import productManage.model.yk.InquiryDetail;

public interface InquiryDetailDAO {
	public InquiryDetail findByInquiryCode(String code);//返回某一条记录显示在页面
}
