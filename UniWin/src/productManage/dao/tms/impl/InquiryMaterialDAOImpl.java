package productManage.dao.tms.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.tms.InquiryMaterialDAO;
import productManage.model.yk.InquiryMaterial;
@Repository
public class InquiryMaterialDAOImpl implements InquiryMaterialDAO {
	@Autowired
	private BaseDao basedao;
	@Override
	public void save(InquiryMaterial im) {
		// TODO Auto-generated method stub
		basedao.save(im);
	}

}
