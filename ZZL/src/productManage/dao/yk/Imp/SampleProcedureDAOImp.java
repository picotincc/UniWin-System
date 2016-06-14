package productManage.dao.yk.Imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.yk.SampleProcedureDAO;
import productManage.model.yk.SampleProcedure;
@Repository
public class SampleProcedureDAOImp implements SampleProcedureDAO{
	@Autowired
	private  BaseDao baseDao;
	
	@Override
	public void save(SampleProcedure sampleProcedure) {
		// TODO Auto-generated method stub
		baseDao.save(sampleProcedure);
	}

	@Override
	public void update(SampleProcedure sampleProcedure) {
		// TODO Auto-generated method stub
		baseDao.update(sampleProcedure);
	}

	@Override
	public void detele(SampleProcedure sampleProcedure) {
		// TODO Auto-generated method stub
		baseDao.delete(sampleProcedure);
	}

	@Override
	public SampleProcedure getSampleProcedureByID(int sampleOrderID) {
		// TODO Auto-generated method stub
		return (SampleProcedure) baseDao.load(SampleProcedure.class, sampleOrderID);
	}

}
