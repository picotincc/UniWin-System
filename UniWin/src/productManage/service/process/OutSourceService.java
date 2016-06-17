package productManage.service.process;

import java.util.List;
import java.util.Map;

import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.vo.PageBean;
import productManage.vo.process.OutSourceVO;

public interface OutSourceService {
	
	public OutSource addOutSource(OutSource os);
	
	public void addOutSourceDetail(OutSource os, List<OutSourceDetail> details);
	
	public PageBean queryAllOutSource(int pageSize, int page);
	
	public PageBean queryOutSource(int pageSize, int page , Map<String,Object> params);
	
	public boolean modifyOutSource(OutSourceVO vo);
	
	public boolean cancelOutSource(String code);
	
	public OutSource changeState(String code , String state);
	
	public OutSourceVO getOutSourceVO(String code);

}
