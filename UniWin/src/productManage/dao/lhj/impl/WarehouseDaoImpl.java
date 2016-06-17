package productManage.dao.lhj.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.lhj.WarehouseDao;
import productManage.model.lhj.WareHouse;
@Repository
public class WarehouseDaoImpl implements WarehouseDao{

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public void add(WareHouse warehouse) {
		// TODO Auto-generated method stub
		baseDao.save(warehouse);
	}

	@Override
	public void update(WareHouse warehouse) {
		// TODO Auto-generated method stub
		baseDao.update(warehouse);
	}

	@Override
	public WareHouse getWarehouseByLocation(String location) {
		// TODO Auto-generated method stub
		String hql = "from WareHouse as w where w.location = '"+location+"'";
		Session session = baseDao.getSession();
		List<WareHouse> results = session.createQuery(hql).list();
		return results.size()>=1?results.get(0):null;
	}

	@Override
	public WareHouse getWarehouseById(int id) {
		String hql = "from WareHouse as w where w.warehouseid = "+id;
		Session session = baseDao.getSession();
		List<WareHouse> results = session.createQuery(hql).list();
		return results.size()>=1?results.get(0):null;
	}

	@Override
	public List<WareHouse> getWarehouseList() {
		// TODO Auto-generated method stub
		String hql = "from WareHouse";
		Session session = baseDao.getSession();
		List<WareHouse> results = session.createQuery(hql).list();
		return results;
	}

}
