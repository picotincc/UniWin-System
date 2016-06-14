package productManage.service.system.impl;

/**
 * @author wangye
 * @date 创建时间2016-03-02
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.wy.AbnormalParameterDao;
import productManage.model.wy.AbnormalParameter;
import productManage.service.PageService;
import productManage.service.system.AbnormalParameterService;
import productManage.vo.PageBean;
@Service
public class AbnormalParameterServiceImpl implements AbnormalParameterService{

	@Autowired
	private AbnormalParameterDao abnormalParameterDao;
	@Autowired
	private PageService pageService;
	
	public AbnormalParameterDao getAbnormalParameterDao() {
		return abnormalParameterDao;
	}

	public void setAbnormalParameterDao(AbnormalParameterDao abnormalParameterDao) {
		this.abnormalParameterDao = abnormalParameterDao;
	}
	
	@Override
	public List<AbnormalParameter> findAll() {
		return abnormalParameterDao.findAll();
	}

	@Override
	public void save(AbnormalParameter abnormalParameter) {
		abnormalParameterDao.save(abnormalParameter);
	}

	@Override
	public void update(AbnormalParameter abnormalParameter) {
		abnormalParameterDao.update(abnormalParameter);
	}

	@Override
	public AbnormalParameter findByID(String id) {
		// TODO Auto-generated method stub
		return abnormalParameterDao.findByID(id);
	}

	@Override
	public PageBean getAbnormalParameterByPage(int pageSize, int page) {
		String hql="select abnormalParameter from AbnormalParameter abnormalParameter";
		return pageService.queryForPage(hql, pageSize, page);
	}

}
