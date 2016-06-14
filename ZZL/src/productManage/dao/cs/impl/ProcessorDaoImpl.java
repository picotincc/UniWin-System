package productManage.dao.cs.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.cs.ProcessorDao;
import productManage.model.cs.Processor;
import productManage.model.tms.Design;

@Repository
public class ProcessorDaoImpl implements ProcessorDao{
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public void add(Processor processor){
		baseDao.save(processor);
	}

	@Override
	public List<Processor> getAllProcessor() {
		
		return baseDao.getAllList(Processor.class);
	}

	@Override
	public Processor getProcessorById(String code) {
//		Session session = baseDao.getSession();	
//		System.out.println("-----"+code+"----");
//		String hql = "from Processor as p where p.processorCode='"+code+"'";
//		Query query = session.createQuery(hql);
//		List<Processor> list = query.list();
//		session.clear();
//		Processor p = list.get(0);
		
		String hql = "from Processor d  where d.processorCode='"+code+"'";
		System.out.println(hql);
		Session session = baseDao.getSession();
		List<Processor> results = session.createQuery(hql).list();
		return results.size()>=1?results.get(0):null;

	}
	
	@Override
	//按名字关键字查找加工方
	public List<Processor> getProcessorByName(String name) {
		Session session = baseDao.getSession();	
		String hql = "from productManage.Model.Processor as p where p.processorName like %"+name+"%";
		Query query = session.createQuery(hql);
		List<Processor> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}
	}

	@Override
	public Processor getByID(int processID) {
		// TODO Auto-generated method stub
		return (Processor)baseDao.load(Processor.class, processID);
	}

	
	

}
