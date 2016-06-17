package productManage.service;

import productManage.vo.PageBean;

public interface PageService {
	/**
	 * 
	 * @param hql （特定条件）的hql查询语句
	 * @param pageSize 页面大小
	 * @param currentPage 当前页面
	 * @return 包含结果列表以及页面相关控制参数的组件
	 */
	public PageBean queryForPage(String hql,int pageSize,int currentPage);
	
	
}
