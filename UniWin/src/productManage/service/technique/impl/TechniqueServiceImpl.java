package productManage.service.technique.impl;
/**
 * @author TMS
 * @date 2016-2-29
 */


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.tms.SpecificTechniqueDAO;
import productManage.dao.tms.TechniqueDAO;
import productManage.dao.tms.TechniqueInventoryDAO;
import productManage.model.tms.SpecificTechnique;
import productManage.model.tms.Technique;
import productManage.model.tms.TechniqueInventory;
import productManage.service.PageService;
import productManage.service.technique.TechniqueService;
import productManage.vo.PageBean;
@Service
public class TechniqueServiceImpl implements TechniqueService {
	@Autowired
	private TechniqueDAO techniqueDao;
	public TechniqueDAO getTechniqueDao() {
		return techniqueDao;
	}

	public void setTechniqueDao(TechniqueDAO techniqueDao) {
		this.techniqueDao = techniqueDao;
	}
	@Autowired
	private SpecificTechniqueDAO spetechDao;
	
	public SpecificTechniqueDAO getSpetechDao() {
		return spetechDao;
	}

	public void setSpetechDao(SpecificTechniqueDAO spetechDao) {
		this.spetechDao = spetechDao;
	}
	
	@Autowired
	private TechniqueInventoryDAO tech_inven_Dao;
	public TechniqueInventoryDAO getTech_inven_Dao() {
		return tech_inven_Dao;
	}

	public void setTech_inven_Dao(TechniqueInventoryDAO tech_inven_Dao) {
		this.tech_inven_Dao = tech_inven_Dao;
	}
	
	@Autowired
	private PageService pageService;
	
	@Override
	public List<Technique> getAll() {
		// TODO Auto-generated method stub
		return techniqueDao.findAll();
		
	}
	@Override
	public void save(Technique technique) {
		// TODO Auto-generated method stub
		techniqueDao.save(technique);
	}

	@Override
	public void save(SpecificTechnique specificTechnique) {
		// TODO Auto-generated method stub
		spetechDao.save(specificTechnique);
	}

	@Override
	public void save(TechniqueInventory techniqueInventory) {
		// TODO Auto-generated method stub
		tech_inven_Dao.save(techniqueInventory);
	}



}
