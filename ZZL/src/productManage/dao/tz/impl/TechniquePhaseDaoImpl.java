package productManage.dao.tz.impl;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.tz.TechniquePhaseDao;
import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.model.tz.TechniquePhase;
import productManage.model.yk.Orders;
import productManage.model.zky.Production;
import productManage.model.zky.Tailor;
/**
 * 工艺阶段查询
 * @author 唐泽
 *
 */
@Repository
public class TechniquePhaseDaoImpl implements TechniquePhaseDao {

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public TechniquePhase getInfoById(int id) {
		// 通过id来获取工艺阶段信息
		Session session = baseDao.getNewSession();	
		String hql = "from TechniquePhase as c where c.techPhaseID='"+id+"'";
		Query query = session.createQuery(hql);
		List<TechniquePhase> list = query.list();
		
		//输出第一行
		if (null != list && list.size() > 0) {
			return (TechniquePhase)list.get(0);
			}
		else
			return null;
	}

	@Override
	public List<TechniquePhase> getAllInfo() {
		// 查询全部工艺阶段信息
		Session session = baseDao.getNewSession();	
		String hql = "from TechniquePhase";
		Query query = session.createQuery(hql);
		List<TechniquePhase> list = query.list();
		return list;
	}

	@Override
	public void addTechniquePhase(TechniquePhase tp) {
		//添加工艺阶段
		baseDao.save(tp);
	}

	@Override
	public List<OutSourceDetail> getOutSourceDetailByID(int outSourceID) {
		// 通过外发单编号获取外发单详情
		Session session = baseDao.getNewSession();	
		String hql = "from productManage.Model.OutSourceDetail as d where d.outsource.outsourceID ='"+outSourceID+"'";
		Query query = session.createQuery(hql);
		List<OutSourceDetail> list = query.list();
		if(list.size()==0){
			return null;
		}else{
			return list;
		}
	}

	@Override
	public void beginTechniquePhase(int outsourceID) {
		// TODO Auto-generated method stub
		OutSource outsource = (OutSource) baseDao.load(OutSource.class,outsourceID);
		TechniquePhase technique = outsource.getTechniquePhase();
		Date date = new Date();
		//增添意外添加
		technique.setTechPhaseStartingTime(date);
		baseDao.update(technique);
	}

	@Override
	public void endTechniquePhase(int outsourceID) {
		// 更新结束时间 同时传递至下一状态
		OutSource outsource = (OutSource) baseDao.load(OutSource.class, outsourceID);
		outsource.getProduction().getpOutsourceTime();
		TechniquePhase technique = outsource.getTechniquePhase();
		technique.getTechPhaseEndTime();
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		technique.setTechPhaseEndTime(date);
		baseDao.update(technique);
		
		//传递至下一状态
		String state = outsource.getDesign().getDesignTechProcedure();
	
		Production production = outsource.getProduction();
		production.setProductionState(getNextState(state));
		baseDao.update(production);
	}
	
	public  String getNextState(String state){
		String[] states = state.split("->");
		int a = -1;
		for(int i=0;i<states.length;i++){
			if(states[i].equals("工艺")){
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
