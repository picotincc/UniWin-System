package productManage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.BaseDao;
import productManage.vo.PageBean;

@Service
public class PageServiceImpl implements productManage.service.PageService {
	@Autowired
	BaseDao basedao;
	@Autowired
	PageBean pageBean;

	@Override
	public PageBean queryForPage(String hql, int pageSize, int page) {
		int allRow = basedao.getAllRowCount(hql);// 总记录数
		if (pageSize <= 0)
			pageSize = PageBean.DEFAULT_PAGE_SIZE;
		if (page<1)
			page=1;
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		if (page>totalPage)
			page = totalPage;
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = page;
		List list = basedao.queryForPage(hql, offset, length);// "一页"的记录

		// 把分页信息保存到Bean中
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}

}
