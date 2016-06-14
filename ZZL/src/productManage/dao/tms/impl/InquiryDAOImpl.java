package productManage.dao.tms.impl;

import java.util.List;

import productManage.dao.BaseDao;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.tms.InquiryDAO;
import productManage.model.yk.Inquiry;
@Repository
public class InquiryDAOImpl implements InquiryDAO {
	@Autowired
	private BaseDao basedao;
	@Override
	public List<Inquiry> findAll() {
		// TODO Auto-generated method stub
		return basedao.getAllList(Inquiry.class);
	}

	@Override
	public Inquiry findByCode(String code) {
		// TODO Auto-generated method stub
		return (Inquiry)basedao.load(Inquiry.class, code);
	}

	@Override
	public List<Inquiry> findByIs_priced(String is_priced) {
		// TODO Auto-generated method stub
		String hql = "from productManage.Model.Inquiry where "+is_priced+"=0";
		Session session = basedao.getNewSession();
		return session.createQuery(hql).list();
	}

	@Override
	public void is_OK(Inquiry inquiry) {
		// TODO Auto-generated method stub
		basedao.update(inquiry);
	}

	@Override
	public Inquiry getInquiryByID(int inquiryID) {
		// TODO Auto-generated method stub
		return (Inquiry)basedao.load(Inquiry.class, inquiryID);
	}




}
