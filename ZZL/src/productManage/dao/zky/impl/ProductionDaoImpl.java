package productManage.dao.zky.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.zky.ProductionDao;
import productManage.model.zky.Production;
@Repository
public class ProductionDaoImpl implements ProductionDao {
	@Autowired
	private BaseDao basedao;
	@Override
	public void save(Production production) {
		basedao.save(production);
	}

	@Override
	public Production getProductionByCode(String productionNo) {
		String hql="from Production p where p.productionCode = '"+productionNo+"'";
		Session session=basedao.getSession();
		List list= session.createQuery(hql).list();
		Production production=null;
		if(list!=null&&list.size()!=0)
			production=(Production) list.get(0);
		return production;
	}

	@Override
	public Production getProductionById(int productionId) {
		Production production=(Production) basedao.load(Production.class, productionId);
		return production;
	}

	@Override
	public List<Production> getProductionByProductionState(String productionState) {
		// 根据生产单状态获取生产单信息
		String hql="from Production p where p.productionState = '"+productionState+"'";
		Session session = basedao.getNewSession();
		List<Production> list = session.createQuery(hql).list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}
	}

}
