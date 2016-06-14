package productManage.dao.tz;

import java.util.List;

import productManage.model.cs.OutSourceDetail;
import productManage.model.tz.TechniquePhase;

/**
 *   工艺阶段查询
 * @author 唐泽
 *
 */

public interface TechniquePhaseDao {
	public void addTechniquePhase(TechniquePhase tp);
	public TechniquePhase getInfoById(int id);
	public List<TechniquePhase> getAllInfo();
	
	public List<OutSourceDetail> getOutSourceDetailByID(int outSourceID);
	public void beginTechniquePhase(int outSourceID);
	public void endTechniquePhase(int outSourceID);
}
