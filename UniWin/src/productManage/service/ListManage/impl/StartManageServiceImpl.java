package productManage.service.ListManage.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.tz.CreateManageDao;
import productManage.model.cs.OutSource;
import productManage.service.PageService;
import productManage.service.ListManage.StartManageService;
import productManage.vo.PageBean;
import productManage.vo.listManage.OutSourceVO;

@Service
public class StartManageServiceImpl implements StartManageService{

	@Autowired
	PageService pageService;
	@Autowired
	CreateManageDao createmanageDao;
	
	@Override
	public PageBean getAllOutSource(int page, int rowsPerPage) {
		String hql = "select o from OutSource o,Production p where o.production.productionID = p.productionID and p.productionState ='未排单'" ;
    	PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
        List<OutSource> list = result.getList();
        List<OutSourceVO> list_vo = new ArrayList<OutSourceVO>();
        for(int i=0;i<list.size();i++){
        	list_vo.add(new OutSourceVO(list.get(i)));
        }
        result.setList(list_vo);
    	return result;
	}

	@Override
	public boolean changeProductionState(int outsourceID) {
		// TODO Auto-generated method stub
		return createmanageDao.changeProductionState(outsourceID);
	}

	@Override
	public PageBean inquireOutSourceInOutward(String hql, int page, int rowsPerPage) {
		// TODO Auto-generated method stub
		PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
        List<OutSource> list = result.getList();
        List<OutSourceVO> list_vo = new ArrayList<OutSourceVO>();
        for(int i=0;i<list.size();i++){
        	list_vo.add(new OutSourceVO(list.get(i)));
        }
        result.setList(list_vo);
    	return result;
	}

}
