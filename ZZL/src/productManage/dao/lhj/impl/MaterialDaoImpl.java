package productManage.dao.lhj.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.lhj.MaterialDao;
import productManage.model.lhj.Material;
import productManage.model.lhj.Materialapply;

@Repository
public class MaterialDaoImpl implements MaterialDao{
	@Autowired
	private BaseDao baseDao;
	    
    
    @Override
	public void add(Material material) {
		// TODO Auto-generated method stub
		baseDao.save(material);
	}
    

	@Override
	public void update(Material material) {
		// TODO Auto-generated method stub
		baseDao.update(material);
	}

	@Override
	public void delete(String materialCode) {
		// TODO Auto-generated method stub
		baseDao.delete(Material.class, materialCode);
	}

	
    @Override
    public Material getMaterialByMaterialCode(String materialCode){

    	String hql="from Material where materialCode="+"'"+materialCode+"'";
    	Session session=baseDao.getSession();
    	Query query=session.createQuery(hql);
    	List<Material> list=query.list();
    	if(list.size()!=0){
    		
    		return list.get(0);
    	}
    	else{
    		return null;
    	}
    }

	@Override
	public List<Material> getMaterialByKey(String key) {
		if(key.equals("")){
			return null;
		}
		else{
	    	String hql="from Material where materialCode like"+"'%"+key+"%'";
	    	Session session=baseDao.getSession();
	    	Query query=session.createQuery(hql);
	    	List<Material> list=query.list();
	    	if(list.size()!=0){   		
	    		return list;
	    	}
	    	else{
	    		return null;
	    	}
		}
	}
	
    @Override
    public List<MaterialDao> getAll() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<MaterialDao> getMaterialInList(String id, String ClouthStyleId,
           String style, String purcharseId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<MaterialDao> getMaterialOutList(String id, String ClouthStyleId,
            String MaterialName, String preOrderId) {
        // TODO Auto-generated method stub
        return null;
    }


	@Override
	public List<Material> getMaterialList(String hql) {
		// TODO Auto-generated method stub
		Session session=baseDao.getSession();
		Query query = session.createQuery(hql);
		List list = query.list();  
		return list;
	}
}
