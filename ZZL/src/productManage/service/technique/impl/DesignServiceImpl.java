package productManage.service.technique.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.tms.DesignDAO;
import productManage.model.tms.Design;
import productManage.service.PageService;
import productManage.service.technique.DesignService;
import productManage.vo.PageBean;
import productManage.vo.technique.TechniqueConstants;
@Service
public class DesignServiceImpl implements DesignService {
	@Autowired
	private DesignDAO designDao;
	public DesignDAO getDesignDao() {
		return designDao;
	}

	public void setDesignDao(DesignDAO designDao) {
		this.designDao = designDao;
	}
	@Autowired
	private PageService pageService;
	@Override
	public List<Design> getAll() {
		// TODO Auto-generated method stub
		return designDao.findAll();
	}

	@Override
	public List<Design> getByDate(Date date) {
		// TODO Auto-generated method stub
		return designDao.findByDate(date);
	}

	@Override
	public Design getByCode(String Code) {
		// TODO Auto-generated method stub
		return designDao.findByCode(Code);
	}

	@Override
	public PageBean getDesignsByPage(int pageSize, int page) {
		// TODO Auto-generated method stub
		String hql="select design from Design design";
		return pageService.queryForPage(hql, pageSize, page);
	}

	@Override
	public PageBean searchDesignsByPage(int pageSize, int page, Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql="select d from Design d";
		String designCode = (String)params.get(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[0]);
		String putawayDate = (String)params.get(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[1]);

		if((!(designCode.equals("")))&&(!(putawayDate.equals("")))){
			hql+=" where ";
			hql+="d.designCode like '%"+designCode+"%'"+" and d.designPutawayDate like '%"+putawayDate+"%'";
		}
		else{
			if(!(designCode.equals(""))){
				hql+=" where ";
				hql+="d.designCode like '%"+designCode+"%'";
			}
			if(!(putawayDate.equals(""))){
				hql+=" where ";
				hql+="d.designPutawayDate like '%"+putawayDate+"%'";
			}
		}
			
		PageBean pageBean = pageService.queryForPage(hql, pageSize, page);
		return pageBean;
	}
	
	@Override
	public List<Design> getDesignByKey(String key){
		return designDao.findByKey(key);
	}

}
