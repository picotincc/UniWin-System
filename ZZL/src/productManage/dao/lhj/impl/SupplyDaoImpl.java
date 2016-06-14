package productManage.dao.lhj.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.lhj.SupplyDao;
import productManage.model.lhj.Supply;
import productManage.model.zky.Production;
@Repository
public class SupplyDaoImpl implements SupplyDao{

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public void add(Supply supply) {
		// TODO Auto-generated method stub
		baseDao.save(supply);
	}

	@Override
	public void update(Supply supply) {
		// TODO Auto-generated method stub
		baseDao.update(supply);
	}

	@Override
	public List<Supply> getSupplyByVendor(int vendorId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Supply> getSupplyByMaterial(String materialCode) {
		// TODO Auto-generated method stub
		return null;
	}

	//by szl
	@Override
	public Supply getSupplyByID(int supplyID) {
		
		Supply supply=(Supply) baseDao.load(Supply.class, supplyID);
		return supply;
	}

}
