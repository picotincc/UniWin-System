package productManage.dao.cs;

import java.util.List;
import productManage.model.cs.Receive;

public interface ReceiveDao {
	
	public Receive add(Receive receive);
	
	public void update(Receive receive);
	
	public void delete(Receive receive);
	
	public Receive getReceiveByID(int receiveid);
	
	public List<Receive> getReceiveByKey(String[] keys);

}
