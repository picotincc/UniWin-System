package productManage.dao.wjx.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.wjx.StoreDao;
import productManage.model.lhj.Material;
import productManage.model.lhj.WareHouse;
import productManage.model.wjx.Store;
@Repository
public class StoreDaoImpl implements StoreDao{
    @Autowired
    private BaseDao baseDao;
    @Override
    public Store updateStore(Store store) {
        Session session = baseDao.getSession();
        session.update(store);
        session.flush();
        return store;
    }

    @Override
    public List<Store> getStoreByMaterial(Material material) {
        String hql="from Store where materialCode="+"'"+material.getMaterialCode()+"'";
        Session session=baseDao.getSession();
        return session.createQuery(hql).list();
    }

    @Override
    public List<Store> getAllStoreInfos() {
        return baseDao.getAllList(Store.class);
    }

	@Override
	public List<WareHouse> getTest() {
		
		return baseDao.getAllList(WareHouse.class);
	}

	@Override
	public Store getStore(String material, int warehouse) {
		String hql = "select s from Store as s where s.material.materialCode='"+material+"' and s.warehouse.warehouseid="+warehouse;
		System.out.println(hql);
		List<Store> result = baseDao.getSession().createQuery(hql).list();
		System.out.println(result.size());
		System.out.println(result);
		return result.size()==0?null:result.get(0);
	}

}
