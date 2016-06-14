package productManage.dao.cs.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.cs.ReceiveDao;
import productManage.model.cs.Receive;

@Repository
public class ReceiveDaoImpl implements ReceiveDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public Receive add(Receive receive) {
		baseDao.save(receive);
		return receive;
	}

	@Override
	public void update(Receive receive) {
		baseDao.update(receive);
	}

	@Override
	public void delete(Receive receive) {
		baseDao.delete(receive);	
	}

	@Override
	public List<Receive> getReceiveByKey(String[] keys) {
		return null;
	}

	@Override
	public Receive getReceiveByID(int receiveid) {
		return (Receive) baseDao.load(Receive.class, receiveid);
	}

}
