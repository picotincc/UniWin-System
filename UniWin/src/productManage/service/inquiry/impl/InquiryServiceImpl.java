package productManage.service.inquiry.impl;
/**
 * @author TMS
 * @date 2016-3-01
 */
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import productManage.dao.tms.InquiryDAO;
import productManage.model.yk.Inquiry;
import productManage.service.PageService;
import productManage.service.inquiry.InquiryService;
import productManage.vo.PageBean;
import productManage.vo.inquiry.InquiryConstants;
@Service
public class InquiryServiceImpl implements InquiryService {
	@Autowired
	private InquiryDAO inquiryDao;
	public InquiryDAO getInquiryDao() {
		return inquiryDao;
	}

	public void setInquiryDao(InquiryDAO inquiryDao) {
		this.inquiryDao = inquiryDao;
	}
	
	@Autowired
	private PageService pageService;
	@Override
	public List<Inquiry> getAll() {
		// TODO Auto-generated method stub
		return inquiryDao.findAll();
	}

	@Override
	public Inquiry getByCode(String code) {
		// TODO Auto-generated method stub
		return inquiryDao.findByCode(code);
	}

	@Override
	public List<Inquiry> getByIs_priced(String is_priced) {
		// TODO Auto-generated method stub
		return inquiryDao.findByIs_priced(is_priced);
	}

	@Override
	public void is_OK(Inquiry inquiry) {
		// TODO Auto-generated method stub
		inquiryDao.is_OK(inquiry);
	}

	@Override
	public Inquiry getInquiryByID(int inquiryID) {
		// TODO Auto-generated method stub
		return inquiryDao.getInquiryByID(inquiryID);
	}

	@Override
	public PageBean queryInquiry(int pageSize, int page, Map<String, Object> params) {
		// TODO Auto-generated method stub
		String inquiryCode = (String)params.get(InquiryConstants.SEARCH_INQUIRY_PARAMS[0]);
		String not_priced = (String)params.get(InquiryConstants.SEARCH_INQUIRY_PARAMS[1]);
		String hql = "select i from Inquiry i where ";
		if((!not_priced.equals("请选择"))&&(!not_priced.equals("无"))&&(!inquiryCode.isEmpty())){
			hql+="i.inquiryCode like '%"+inquiryCode+"%'";
			if(not_priced.equals("面料OK")){
				hql+=" and shellOKTime is not null";
			}
			else if(not_priced.equals("辅料OK")){
				hql+=" and accOKTime is not null";
			}
			else if(not_priced.equals("花型OK")){
				hql+=" and flowerOKTime is not null";
			}
			else if(not_priced.equals("版型OK")){
				hql+=" and modelOKTime is not null";
			}
			else if(not_priced.equals("加工OK")){
				hql+=" and processOKTime is not null";
			}
			
		}
		else{
			if(!inquiryCode.isEmpty()){
				hql+="i.inquiryCode like '%"+inquiryCode+"%'";
			}
			if(not_priced.equals("面料OK")){
				hql+=" shellOKTime is not null";
			}
			else if(not_priced.equals("辅料OK")){
				hql+=" accOKTime is not null";
			}
			else if(not_priced.equals("花型OK")){
				hql+=" flowerOKTime is not null";
			}
			else if(not_priced.equals("版型OK")){
				hql+=" modelOKTime is not null";
			}
			else if(not_priced.equals("加工OK")){
				hql+=" processOKTime is not null";
			}
		}
		return pageService.queryForPage(hql, pageSize, page);
	}

	@Override
	public PageBean getShowedInquiryByPage(int pageSize, int page) {
		// TODO Auto-generated method stub
		/*String hql="select d.designID,d.designPicURL,i.inquiryCode,i.shellOKTime,i.processOKTime from "+
					"Design d ,Technique t,Inquiry i where i.design.designID=d.designID and t.design.designID=d.designID";
		*/
		String hql = "from Inquiry";
		return pageService.queryForPage(hql, pageSize, page);
	}


}
