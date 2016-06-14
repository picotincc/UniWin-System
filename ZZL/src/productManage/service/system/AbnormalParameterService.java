package productManage.service.system;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

import java.util.List;

import productManage.model.wy.AbnormalParameter;
import productManage.vo.PageBean;

public interface AbnormalParameterService {
	public List<AbnormalParameter> findAll();//获取所有异常参数的信息
	
	public void save(AbnormalParameter abnormalParameter);//保存异常参数信息
	
	public void update(AbnormalParameter abnormalParameter);//修改异常参数信息
	
	public AbnormalParameter findByID(String id);//根据id查找异常参数
	
	public PageBean getAbnormalParameterByPage(int pageSize,int page);
}
