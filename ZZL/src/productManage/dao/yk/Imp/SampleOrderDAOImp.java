package productManage.dao.yk.Imp;

import java.util.List;

import org.hibernate.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.yk.SampleOrderDAO;
import productManage.model.yk.SampleOrders;
@Repository
public class SampleOrderDAOImp implements SampleOrderDAO{
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public void save(SampleOrders sampleOrder) {
		// TODO Auto-generated method stub
		baseDao.save(sampleOrder);
	}

	@Override
	public void update(SampleOrders sampleOrder) {
		// TODO Auto-generated method stub
		baseDao.update(sampleOrder);
	}

	@Override
	public void detele(SampleOrders sampleOrder) {
		// TODO Auto-generated method stub
		baseDao.delete(sampleOrder);
	}

	@Override
	public List<SampleOrders> getAllSampleOrders() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(SampleOrders.class);
	}

	@Override
	public SampleOrders getSampleOrderByID(int sampleOrderID) {
		// TODO Auto-generated method stub
		return (SampleOrders) baseDao.load(SampleOrders.class, sampleOrderID);
	}

	@Override
	public SampleOrders getSampleOrderByCode(String sampleOrderCode) {
		// TODO Auto-generated method stub
		String hql = "from SampleOrders s where s.sampleOrderCode='"+sampleOrderCode+"'";
		Session session = baseDao.getSession();
		return (SampleOrders) session.createQuery(hql).list().get(0);
	}

}
