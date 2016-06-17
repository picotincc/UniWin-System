package productManage.dao.tyc.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.tyc.PurchaseDao;
import productManage.model.cs.OutSource;
import productManage.model.tyc.Purchase;
import productManage.model.wcy.Qc;
import productManage.model.yk.Orders;

/**  
* 类说明   
*  
* @author tyc  
* @date 2016年3月2日 新建 
*/
@Repository
public class PurchaseDaoImpl implements PurchaseDao {
	@Autowired
	private BaseDao baseDao;

	@Override
	public List<Purchase> allPurchase(String type) {
		// TODO Auto-generated method stub
				Session session = baseDao.getSession();	
				String hql = "from Purchase as p where p.purchaseType = '"+type+"'";
				Query query = session.createQuery(hql);
				List<Purchase> list = query.list();
				return list;
	}

	@Override
	public List<Purchase> selectPurchase(Date Eta, Date scheduledPurchaseDate, int vendorId, String purchaseState,
			int styleId, int oldOrNew) {
		// TODO Auto-generated method stub
		Session session = baseDao.getSession();	
		String hql = "from Purchase as c where c.ETA='"+Eta+"'"
				+ "and c.scheduledPurchaseDate='"+scheduledPurchaseDate+"'"+"and c.purchaseState='"+purchaseState+"'";
		Query query = session.createQuery(hql);
		List<Purchase> list = query.list();
		
			return list;
	}

	@Override
	public void updatePurchaseState(int purchaseID, String state) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Purchase usingMaterialAudit(int purchaseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Purchase stockAudit(int purchaseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Purchase purchaseDetail(int purchaseID) {
		// TODO Auto-generated method stub
		return (Purchase)baseDao.load(Purchase.class, purchaseID);
	}

	@Override
	public Purchase getPurchaseByPurchaseCode(String purchaseCode){
		String hql="from Purchase where purchaseCode="+"'"+purchaseCode+"'";
		Session session = baseDao.getSession();
		Query query = session.createQuery(hql);
		List<Purchase> list = query.list();
		if(list.size()!=0){
			return list.get(0);
		}
		else{
			return null;
		}
	}

	@Override
	public void update(Purchase purchase) {
		// TODO Auto-generated method stub
		baseDao.update(purchase);
	}

	@Override
	public void delete(Purchase purchase) {
		// TODO Auto-generated method stub
		System.out.println(purchase.getPurchaseCode());
		baseDao.delete(purchase);
	}
}
