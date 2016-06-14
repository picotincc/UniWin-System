package productManage.service.inquiry.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.tms.InquiryMaterialDAO;
import productManage.model.yk.InquiryMaterial;
import productManage.service.inquiry.InquiryMaterialService;
@Service
public class InquiryMaterialServiceImpl implements InquiryMaterialService{
	@Autowired
	InquiryMaterialDAO inquiryMaterialDao;
	@Override
	public void save(InquiryMaterial inquiryMaterial) {
		// TODO Auto-generated method stub
		inquiryMaterialDao.save(inquiryMaterial);
	}

}
