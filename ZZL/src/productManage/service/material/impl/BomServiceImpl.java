package productManage.service.material.impl;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.lhj.BomDao;
import productManage.dao.lhj.MaterialDao;
import productManage.dao.tms.DesignDAO;
import productManage.model.lhj.Bom;
import productManage.model.lhj.Material;
import productManage.model.tms.Design;
import productManage.service.PageService;
import productManage.service.material.BomService;
import productManage.util.DateFormat;
import productManage.vo.PageBean;
import productManage.vo.technique.TechniqueConstants;

@Service
public class BomServiceImpl implements BomService{

	@Autowired
	private MaterialDao materialdao;
	@Autowired
	private DesignDAO designdao;
	@Autowired
	private BomDao bomdao;
	@Autowired
	private PageService pageservice;
	@Override
	public PageBean queryDesign(int pageSize, int page,
			Map<String, Object> params) {
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
			
		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		return pageBean;
	}
	
	@Override
	public void addDesign(Design design) {
		// TODO Auto-generated method stub
		designdao.addDesign(design);
	}
	
	public void quitDesign(String designId){
		designdao.quitDesign(designId);
	}
	
	@Override
	public void addBom(Bom bom) {
		// TODO Auto-generated method stub
		bomdao.addBom(bom);
	}
	
	public void deleteBom(Material m,Design d){
		bomdao.deleteBom(m, d);
	}
	
	@Override
	public Design getDesignById(String id){
		return designdao.findById(id);
	}
}
