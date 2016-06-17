package productManage.action;

import org.springframework.stereotype.Controller;

import productManage.vo.PageBean;

/**
 * 继承此类并重写queryPage()方法以进行分页查询
 * 
 * @author 克崽兽EX
 *
 */
@Controller
public class PageAction extends BaseAction {
	protected int page;
	protected int rowsPerPage;
	protected PageBean pageBean;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	/**
	 * 本方法中需要调用Service中的分页查询方法，并将返回的pageBean赋值给this.pageBean
	 * 
	 * @return
	 * @throws Exception
	 */
	public String queryPage() throws Exception {
		return SUCCESS;
	}
}
