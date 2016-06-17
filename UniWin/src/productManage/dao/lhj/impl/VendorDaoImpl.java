package productManage.dao.lhj.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.lhj.VendorDao;
import productManage.model.lhj.Material;
import productManage.model.lhj.Vendor;
@Repository
public class VendorDaoImpl implements VendorDao{

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public void add(Vendor vendor) {
		// TODO Auto-generated method stub
		baseDao.save(vendor);
	}

	@Override
	public void update(Vendor vendor) {
		// TODO Auto-generated method stub
		baseDao.update(vendor);
	}

	@Override
	public Vendor getVendorById(String vendorId){
    	String hql="from Vendor where vendorId="+"'"+vendorId+"'";
    	Session session=baseDao.getSession();
    	Query query=session.createQuery(hql);
    	List<Vendor> list=query.list();
    	if(list.size()!=0){    		
    		return list.get(0);
    	}
    	else{
    		return null;
    	}
	}
	
	@Override
	public Vendor getVendorByName(String vendorName) {
    	String hql="from Vendor where vendorName="+"'"+vendorName+"'";
    	Session session=baseDao.getSession();
    	Query query=session.createQuery(hql);
    	List<Vendor> list=query.list();
    	if(list.size()!=0){    		
    		return list.get(0);
    	}
    	else{
    		return null;
    	}
	}

	@Override
	public List<Vendor> getVendorList() {
		// TODO Auto-generated method stub
    	String hql="from Vendor";
    	Session session=baseDao.getSession();
    	Query query=session.createQuery(hql);
    	List<Vendor> list=query.list();
    	return list;
	}

}
