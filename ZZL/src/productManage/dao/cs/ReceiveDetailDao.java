package productManage.dao.cs;

import java.util.List;
import java.util.Set;

import productManage.model.cs.OutSourceDetail;
import productManage.model.cs.ReceiveDetail;

public interface ReceiveDetailDao {
	
	public void add(ReceiveDetail receiveDetail);
	
	public void add(List<ReceiveDetail> detailList);
	
	public void update(ReceiveDetail receiveDetail);
	
	public void update(List<ReceiveDetail> detailList);
	
	public void delete(ReceiveDetail receiveDetail);
	
	public void deleteBySet(Set<ReceiveDetail> dset);
	
	public List<ReceiveDetail> getDetailByreceiveId(int receiveid);

}
