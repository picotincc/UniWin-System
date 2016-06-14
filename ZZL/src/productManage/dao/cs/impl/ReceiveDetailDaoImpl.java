package productManage.dao.cs.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.cs.ReceiveDetailDao;
import productManage.model.cs.OutSourceDetail;
import productManage.model.cs.ReceiveDetail;

@Repository
public class ReceiveDetailDaoImpl implements ReceiveDetailDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public void add(ReceiveDetail receiveDetail) {
		baseDao.save(receiveDetail);		
	}

	@Override
	public void add(List<ReceiveDetail> detailList) {
		for(ReceiveDetail rd : detailList){
			baseDao.save(rd);
		}
	}

	@Override
	public void update(ReceiveDetail receiveDetail) {
		baseDao.update(receiveDetail);		
	}

	@Override
	public void update(List<ReceiveDetail> detailList) {
		for(ReceiveDetail rd : detailList){
			baseDao.update(rd);
		}		
	}

	@Override
	public void delete(ReceiveDetail receiveDetail) {
		baseDao.delete(receiveDetail);
		
	}

	@Override
	public List<ReceiveDetail> getDetailByreceiveId(int receiveid) {
		Session session = baseDao.getSession();	
		String hql = "from ReceiveDetail as d where d.receive.receiveID ='"+receiveid+"'";
		Query query = session.createQuery(hql);
		List<ReceiveDetail> list = query.list();
		if(list.size()==0){

			return null;
		}else{
			return list;
		}
	}

	@Override
	public void deleteBySet(Set<ReceiveDetail> dset) {
		for(ReceiveDetail osd : dset){
			baseDao.delete(osd);
		}
		
	}

}
