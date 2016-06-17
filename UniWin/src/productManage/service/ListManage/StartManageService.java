package productManage.service.ListManage;

import productManage.vo.PageBean;

public interface StartManageService {//开始排单
	
	public PageBean getAllOutSource(int page, int rowsPerPage);
      
	public boolean changeProductionState(int outsourceID);
	
	public PageBean inquireOutSourceInOutward(String hql,int page, int rowsPerPage);
}
