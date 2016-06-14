package productManage.dao.whq.impl;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.whq.SampleDao;
import productManage.model.whq.Sample;

/**
 * @author WHQ
 * @date 创建时间2016-3-8
 */
@Repository
public class SampleDaoImpl implements SampleDao{

	@Autowired
	private BaseDao basedao;
	@Override
	public Sample addSample(Sample sample) {
		Session session = basedao.getSession();
		session.save(sample);
		return sample;
	}
	@Override
	public Sample getSample(String location, String designCode) {
		Session session = basedao.getSession();
		String hql = "select s from Sample as s where s.samplePlace = '"+location+"' and s.design.designCode = '"+designCode+"'";
		Query q = session.createQuery(hql);
		List<Sample> results = q.list();
		return results.size() >=1?results.get(0):null;
	}
	
}