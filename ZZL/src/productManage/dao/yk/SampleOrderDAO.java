package productManage.dao.yk;

import java.util.List;

import productManage.model.yk.SampleOrders;


public interface SampleOrderDAO {
	public void save(SampleOrders sampleOrder);
	public void update(SampleOrders sampleOrder);
	public void detele(SampleOrders sampleOrder);
	public List<SampleOrders> getAllSampleOrders();
	public SampleOrders getSampleOrderByID(int sampleOrderID);
	public SampleOrders getSampleOrderByCode(String sampleOrderCode);
}
