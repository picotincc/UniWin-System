package productManage.dao.cs;

import java.util.List;
import java.util.Set;

import productManage.model.cs.OutSourceDetail;

public interface OutSourceDetailDao {
	
	public void add(OutSourceDetail outsourceDetail);
	
	public void add(List<OutSourceDetail> detailList);
	
	public void update(OutSourceDetail outsourceDetail);
	
	public void update(List<OutSourceDetail> detailList);
	
	public void delete(OutSourceDetail osd);
	
	public void deleteBySet(Set<OutSourceDetail> dset);
	
	public List<OutSourceDetail> getDetailByOutSourceId(int outsourceid);

}
