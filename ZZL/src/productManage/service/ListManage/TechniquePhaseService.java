package productManage.service.ListManage;

import java.util.List;

import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.model.tz.TechniquePhase;
import productManage.vo.PageBean;

/**
 * 工艺阶段
 * 唐泽
 * 
 */

public interface TechniquePhaseService {
	public void addTechniquePhase(TechniquePhase tp);
	public TechniquePhase getInfoById(int id);
	public List<TechniquePhase> getAllInfo();
	
	/**************/
	public PageBean getAllOutSourceInTechnique(int page, int rowsPerPage);
	public List<OutSourceDetail> getOutSourceDetailByID(int outsourceID);
	public OutSource getOutSourceByID(int outsourceID);
	public PageBean inquireOutSourceInTechnique(String hql,int page, int rowsPerPage);
	public void beginTechniquePhase(int outsourceID);
	public void endTechniquePhase(int outsourceID);
}
