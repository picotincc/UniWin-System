package productManage.dao.szl.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.szl.SupplementDao;
import productManage.model.cs.OutSource;
import productManage.model.szl.Supplement;

@Repository
public class SupplementDaoImpl implements SupplementDao{
	@Autowired
	private BaseDao basedao;
	
	@Override
	public int add(Supplement supplement){
		basedao.save(supplement);
		return supplement.getSupplementID();
	}
	
	@Override
	public void update(Supplement supplement){
		basedao.update(supplement);
	}
	
	@Override
	public Supplement getSupplementDetail(int supplementID){
		Supplement supplement=(Supplement) basedao.load(Supplement.class, supplementID);
		return supplement;
		
	}
	

	@Override
	public List<Supplement> getAllSupplement() {
		
		return basedao.getAllList(Supplement.class);
	}

	@Override
	public Supplement getSupplementByCode(String supplementCode) {
		//System.out.println(supplementCode);
		Session session = basedao.getSession();
		String hql = "from Supplement as supplement where supplement.supplementCode  like '%" + supplementCode + "%' ";//此处like '% %'应该为= ' ' code做约束后需要改回=
		Query query = session.createQuery(hql);
		List<Supplement> list = query.list();
//		if(list.size()==0){
//			return null;
//		}else{
			return list.get(0);
//		}
		
	}



}
