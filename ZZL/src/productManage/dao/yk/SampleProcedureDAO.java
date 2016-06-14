package productManage.dao.yk;

import productManage.model.yk.SampleProcedure;

public interface SampleProcedureDAO {
	public void save(SampleProcedure sampleProcedure);
	public void update(SampleProcedure sampleProcedure);
	public void detele(SampleProcedure sampleProcedure);
	public SampleProcedure getSampleProcedureByID(int sampleOrderID);
}
