package productManage.dao.tz.impl;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.tz.TailorPhaseDao;
import productManage.model.User;
import productManage.model.cs.OutSource;
import productManage.model.tz.TechniquePhase;
import productManage.model.yk.Orders;
import productManage.model.zky.Production;
import productManage.model.zky.Tailor;

@Repository
public class TailorPhaseDaoImpl implements TailorPhaseDao{

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public boolean tailorAppoint(int outsourceID, int userID, String role) {//根据角色委派
	    //获取裁剪单列表
		Set<Tailor> tailors = getTailorByID(outsourceID);
		Iterator<Tailor> it = tailors.iterator();
		//获取用户
		User user = getUserByID(userID);
		while(it.hasNext()){
		if(role.equals("排版")){		
			Tailor tailor = it.next();
			tailor.setTailormodelmaker(user);
			updateTailor(tailor);
			return true;
		}
		if(role.equals("裁剪")){
			Tailor tailor = it.next();
			tailor.setTailor(user);
			updateTailor(tailor);
			return true;
		}
		}
		return false;
	}
	
	public Set<Tailor> getTailorByID(int outsourceID){
		OutSource outsource = (OutSource) baseDao.load(OutSource.class, outsourceID);
		return outsource.getProduction().getTailors();
	}
	
	public User getUserByID(int userId){
		return (User) baseDao.load(User.class, userId);
	}

	public void updateTailor(Tailor tailor){
		baseDao.update(tailor);
	}

	@Override
	public boolean beginTailorAppoint(int outsourceID) {
		// TODO Auto-generated method stub
		OutSource outsource = (OutSource) baseDao.load(OutSource.class, outsourceID);
	    //开始裁剪阶段
		Tailor tailor = getFirstTailorByID(outsource);
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		Timestamp ts = new Timestamp(date.getTime());
		tailor.setTailorStartingTime(ts);
		updateTailor(tailor);
		return false;
	}

	public Tailor getFirstTailorByID(OutSource outsource){
		Set<Tailor> tailors = outsource.getProduction().getTailors();
		Iterator<Tailor> it = tailors.iterator();
		while(it.hasNext()){
			return it.next();
		}
		return null;
	}
	
	@Override
	public boolean endTailorAppoint(int outsourceID) {
		// TODO Auto-generated method stub
		OutSource outsource = (OutSource) baseDao.load(OutSource.class, outsourceID);
		//结束裁剪阶段
		Tailor tailor = getFirstTailorByID(outsource);
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		Timestamp ts = new Timestamp(date.getTime());
		tailor.setTailorEndTime(ts);
		updateTailor(tailor);
		//跳转
		String state = outsource.getDesign().getDesignTechProcedure();
		if((getNextState(state)).equals("工艺")){
			TechniquePhase technique = new TechniquePhase();
			technique.setOutSource(outsource);
			baseDao.save(technique);
		}
		Production production = outsource.getProduction();
		production.setProductionState(getNextState(state));
		baseDao.update(production);
		return false;
	}
	
	public String getNextState(String state){
		String[] states = state.split("->");
		int a = -1;
		for(int i=0;i<states.length;i++){
			if(states[i].equals("裁剪")){
				a = i+1;
				break;
			}
		}
		if(a>=states.length || a<0){
			return "工序错误";
		}
		else{
			return states[a];
		}
	}
}
