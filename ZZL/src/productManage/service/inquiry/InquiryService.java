package productManage.service.inquiry;

import java.util.List;
import java.util.Map;

import productManage.model.yk.Inquiry;
import productManage.vo.PageBean;

/**
 * @author TMS
 * @date 2016-3-01
 */
public interface InquiryService {
	public List<Inquiry> getAll();//返回所有记录
	public Inquiry getByCode(String code);//根据询价单编码找到对应记录
	public List<Inquiry> getByIs_priced(String is_priced);//根据未报价环节找到记录
	public void is_OK(Inquiry inquiry);//确认OK
	public Inquiry getInquiryByID(int inquiryID);
	public PageBean getShowedInquiryByPage(int pagesize,int page);
	/**
	 * 按照特定条件，分页查询询价单列表信息
	 * @param pageSize 每页条目数
	 * @param page	页号
	 * @param params 其它参数
	 * @return 封装有询价单列表以及页面控制参数的组件
	 */
	public PageBean queryInquiry(int pageSize,int page,Map<String,Object> params);
}
