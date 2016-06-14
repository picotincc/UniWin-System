package productManage.dao.tms.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.tms.SpecificTechniqueDAO;
import productManage.model.tms.SpecificTechnique;
@Repository
public class SpecificTechniqueDAOImpl implements SpecificTechniqueDAO {
	@Autowired
	private BaseDao basedao;
	@Override
	public void save(SpecificTechnique sTechnique) {
		// TODO Auto-generated method stub
		basedao.save(sTechnique);
	}

}
