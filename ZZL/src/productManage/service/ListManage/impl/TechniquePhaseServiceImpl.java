package productManage.service.ListManage.impl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.cs.OutSourceDao;
import productManage.dao.cs.OutSourceDetailDao;
import productManage.dao.tz.TechniquePhaseDao;
import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.model.tz.TechniquePhase;
import productManage.service.PageService;
import productManage.service.ListManage.TechniquePhaseService;
import productManage.vo.PageBean;
import productManage.vo.listManage.OutSourceManageVO;
import productManage.vo.listManage.TechniquePhaseVO;
@Service
public class TechniquePhaseServiceImpl implements TechniquePhaseService {

	@Autowired
	PageService pageService;
	@Autowired
	OutSourceDao outSourceDao;
	@Autowired
	OutSourceDetailDao outsourcedetailDao;
	@Autowired
	TechniquePhaseDao techPhaseDao;
	
	@Override
	public void addTechniquePhase(TechniquePhase tp) {
		// TODO Auto-generated method stub
		techPhaseDao.addTechniquePhase(tp);
	}

	@Override
	public TechniquePhase getInfoById(int id) {
		// TODO Auto-generated method stub
		return techPhaseDao.getInfoById(id);
	}

	@Override
	public List<TechniquePhase> getAllInfo() {
		// TODO Auto-generated method stub
		return techPhaseDao.getAllInfo();
	}

	@Override
	public PageBean getAllOutSourceInTechnique(int page, int rowsPerPage) {
		// 查询所有工艺阶段外发单
		String hql = "select o from OutSource o,Production p where o.production.productionID = p.productionID and p.productionState ='工艺'" ;
		PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
        List<OutSource> list = result.getList();
        List<TechniquePhaseVO> list_vo = new ArrayList<TechniquePhaseVO>();
        for(int i=0;i<list.size();i++){
        	list_vo.add(new TechniquePhaseVO(list.get(i)));
        }
        result.setList(list_vo);
    	return result;
	}

	@Override
	public List<OutSourceDetail> getOutSourceDetailByID(int outsourceID) {
		// 通过外发单id获取外发单详情
		return outsourcedetailDao.getDetailByOutSourceId(outsourceID);
	}

	@Override
	public OutSource getOutSourceByID(int outsourceID) {
		//通过外发单id获取外发单
		return outSourceDao.getOutSourceByID(outsourceID);
	}

	@Override
	public PageBean inquireOutSourceInTechnique(String hql, int page, int rowsPerPage) {
		//查询工艺阶段外发单
		PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
        List<OutSource> list = result.getList();
        List<TechniquePhaseVO> list_vo = new ArrayList<TechniquePhaseVO>();
        for(int i=0;i<list.size();i++){
        	list_vo.add(new TechniquePhaseVO(list.get(i)));
        }
        result.setList(list_vo);
    	return result;
	}

	@Override
	public void beginTechniquePhase(int outsourceID) {
		// TODO Auto-generated method stub
		techPhaseDao.beginTechniquePhase(outsourceID);
	}

	@Override
	public void endTechniquePhase(int outsourceID) {
		// TODO Auto-generated method stub
		techPhaseDao.endTechniquePhase(outsourceID);
	}

}
