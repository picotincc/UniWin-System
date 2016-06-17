package productManage.dao.cs.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.cs.OutSourceDetailDao;
import productManage.model.cs.OutSourceDetail;

@Repository
public class OutSourceDetailDaoImpl implements OutSourceDetailDao{

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public void add(OutSourceDetail outsourceDetail) {
		baseDao.save(outsourceDetail);		
	}

	@Override
	public void add(List<OutSourceDetail> detailList) {
		for(OutSourceDetail od : detailList){
			baseDao.save(od);
		}
	}

	@Override
	public void update(OutSourceDetail outsourceDetail) {
		baseDao.update(outsourceDetail);		
	}

	@Override
	public void update(List<OutSourceDetail> detailList) {
		for(OutSourceDetail od : detailList){
			baseDao.update(od);
		}
		
	}

	@Override
	public void delete(OutSourceDetail osd) {
		baseDao.delete(osd);		
	}

	@Override
	public List<OutSourceDetail> getDetailByOutSourceId(int outsourceid) {
		Session session = baseDao.getNewSession();	
		String hql = "from OutSourceDetail d where d.outsource.outsourceID ='"+outsourceid+"'";
		Query query = session.createQuery(hql);
		List<OutSourceDetail> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}
	}

	@Override
	public void deleteBySet(Set<OutSourceDetail> dset) {
		for(OutSourceDetail osd : dset){
			baseDao.delete(osd);
		}
		
	}

}
