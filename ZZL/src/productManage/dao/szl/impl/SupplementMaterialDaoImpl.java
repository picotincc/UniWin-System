package productManage.dao.szl.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.szl.SupplementMaterialDao;
import productManage.model.lhj.Supply;
import productManage.model.szl.Supplement;
import productManage.model.szl.SupplementMaterial;
import productManage.model.zky.Production;
@Repository
public class SupplementMaterialDaoImpl implements SupplementMaterialDao{
	@Autowired
	private BaseDao basedao;
	
	@Override
	public void add(SupplementMaterial supplementMaterial){
		basedao.save(supplementMaterial);
	}
	
	@Override
	public List<SupplementMaterial> getSupplementMaterialBySupplementID(int supplementID){
		 String hql="from SupplementMaterial as supplementMaterial "
		 		+ "where supplementMaterial.supplement.supplementID = "+supplementID;

	     List<SupplementMaterial> result=basedao.getSession().createQuery(hql).list();
	     return result.size()==0?null:result;
		
	}

	@Override
	public String getMaterialType(int supplementID) {
		List<SupplementMaterial> temp= getSupplementMaterialBySupplementID(supplementID);
		if(temp==null){
			return null;
		}
		return getSupplementMaterialBySupplementID(supplementID).get(0).getSupply().getMaterial().getMaterialType();
	}
	
	@Override
	public List<Supply> getMaterialForSelect(String hql){
		List<Supply> result=basedao.getSession().createQuery(hql).list();
		return result.size()==0?null:result;
	}
}
