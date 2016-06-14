package productManage.dao.wcy.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.wcy.OrderDetailDAO;
import productManage.model.lhj.Material;
import productManage.model.lhj.Supply;
import productManage.model.lhj.Vendor;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.OrderMaterialDetail;
import productManage.model.yk.Orders;
@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO{

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public void save(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		baseDao.save(orderDetail);
	
	}

	@Override
	public void update(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		baseDao.update(orderDetail);
	}
	
	@Override
	public OrderDetail getOrderDetail(int orderID) {
		// TODO Auto-generated method stub
		Session session = baseDao.getNewSession();	
		String hql = "from OrderDetail as o where o.orderID='"+orderID+"'";
		Query query = session.createQuery(hql);
		List<OrderDetail> list = query.list();
		if (null != list && list.size() > 0) {
			return (OrderDetail)list.get(0);
			}
		else
			return null;
	}

	@Override
	public List<OrderDetail> getAll() {
		// TODO Auto-generated method stub
		Session session = baseDao.getNewSession();	
		String hql = "from OrderDetail";
		Query query = session.createQuery(hql);
		List<OrderDetail> list = query.list();
		return list;
		 
	}

	public void SaveOrderMaterailDetail(OrderMaterialDetail orderMaterialDetail){

		try {
			Session session = baseDao.getSession();
			session.save(orderMaterialDetail);
		} catch (Exception e) {
			e.printStackTrace();
			throw(e);//��һ�����Լ�����ȥ��,Ϊ����AdminDaoImpl�ķ���֪���������ʱ�����쳣
		}
		
	}

	public void add(OrderDetail od){
		baseDao.save(od);		
	}
	
	public Material getMaterial(String materialName,String colorCode,String materialType){
		String hql="select m from Material as m where m.materialName= '"+materialName+"' and m.colorCode= '"+colorCode+"' and m.materialType ='"+materialType+"'";
		List<Material> list = baseDao.getSession().createQuery(hql).list();
		
		if (null != list && list.size() > 0) {
			return list.get(0);
		}
		else
			return null;
	}

	@Override
	public Supply getSupply(String materialCode, int vendorId) {
		String hql="select s from Supply as s where s.material.materialCode= '"+materialCode+"' and s.vendor.vendorId= "+vendorId;
		
		List<Supply> list = baseDao.getSession().createQuery(hql).list();
		
		if (null != list && list.size() > 0) {
			return list.get(0);
		}
		else
			return null;
		
		
	}

	@Override
	public void addOrderMaterialdetail(OrderMaterialDetail od) {
		// TODO Auto-generated method stub
		baseDao.save(od);	
		
	}

	@Override
	public void addSupply(Supply supply1) {
		// TODO Auto-generated method stub
		baseDao.save(supply1);
	}
	
}
