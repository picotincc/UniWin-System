package productManage.service.process;

import java.util.List;
import java.util.Map;

import productManage.model.cs.ReceiveDetail;
import productManage.vo.PageBean;
import productManage.vo.process.ReceiveVO;

public interface ReceiveService {
	
	public boolean addReceive(ReceiveVO receiveVO);
	
	public PageBean queryAllReceive(int pageSize, int page);
	
	public PageBean queryReceive(int pageSize, int page , Map<String,Object> params);
	
	public boolean cancelReceive(int receiveID);
	
	public ReceiveVO getReceiveVO(int receiveID);
	
	public boolean modifyReceive(ReceiveVO receiveVO);
	
	public List<ReceiveDetail> getReceiveDetails(int rid);

}
