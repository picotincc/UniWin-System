package productManage.service.technique;
/**
 * @author TMS
 * @date 2016-3-01
 */
import java.util.Date;
import java.util.List;
import java.util.Map;

import productManage.model.tms.Design;
import productManage.vo.PageBean;

public interface DesignService {
	public List<Design> getAll();
	public List<Design> getByDate(Date date);
	public Design getByCode(String code);
	public PageBean getDesignsByPage(int pageSize,int page);
	public PageBean searchDesignsByPage(int pageSize,int page,Map<String, Object> params);
	public List<Design> getDesignByKey(String key);
}
