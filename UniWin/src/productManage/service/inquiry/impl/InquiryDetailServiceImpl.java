package productManage.service.inquiry.impl;
/**
 * @author TMS
 * @date 2016-3-02
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.tms.InquiryDetailDAO;
import productManage.model.yk.InquiryDetail;
import productManage.service.inquiry.InquiryDetailService;
@Service
public class InquiryDetailServiceImpl implements InquiryDetailService {
	@Autowired
	private InquiryDetailDAO idDao;
	public InquiryDetailDAO getInquiryDetailDao() {
		return idDao;
	}

	public void setInquiryDetailDao(InquiryDetailDAO idDao) {
		this.idDao = idDao;
	}
	@Override
	public InquiryDetail findByInquiryCode(String code) {
		// TODO Auto-generated method stub
		return idDao.findByInquiryCode(code);
	}

}
