package productManage.dao.wy.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.wy.AuthorityDao;
import productManage.model.wy.Authority;

/**
 * @author wangye
 * @date 创建时间2016-02-28
 */
@Repository
public class AuthorityDaoImpl implements AuthorityDao{
	@Autowired
	private BaseDao baseDao;

	@Override
	public void update(Authority authority) {
		// TODO Auto-generated method stub
		baseDao.update(authority);
	}

	@Override
	public List<Authority> findAll() {
		return baseDao.getAllList(Authority.class);
	}

	@Override
	public Authority findById(String id) {
		// TODO Auto-generated method stub
		return (Authority) baseDao.load(Authority.class, id);
	}

	@Override
	public int getIDByAuthority(String highAuthoName, String middleAuthoName,
			String lowAuthoName) {
		// TODO Auto-generated method stub
		String hql = "select a.authorityID from Authority a";
		if (!highAuthoName.isEmpty()) {
			hql += " where replace(a.highAuthName,' ', '')='"+highAuthoName+"'";
			if (!middleAuthoName.isEmpty()) {
				hql += " and replace(a.middleAuthName,' ', '')='"+middleAuthoName+"'";
				if (!lowAuthoName.isEmpty()) {
					hql += " and replace(a.lowAuthName,' ', '')='"+lowAuthoName+"'";
				}else{
					hql += " and a.lowAuthName is null";
				}
			}else{
				hql += " and a.middleAuthName is null";
			}
			//System.out.println(hql);
			Session session = baseDao.getSession();
			return (int) session.createQuery(hql).list().get(0);
		}else{
			return -1;
		}
	}

}
