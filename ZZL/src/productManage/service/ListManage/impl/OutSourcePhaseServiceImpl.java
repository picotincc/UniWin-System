package productManage.service.ListManage.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.cs.OutSourceDao;
import productManage.dao.cs.OutSourceDetailDao;
import productManage.dao.tz.TechniquePhaseDao;
import productManage.dao.zky.ProductionDao;
import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.model.tms.Design;
import productManage.model.yk.Orders;
import productManage.model.zky.Production;
import productManage.service.PageService;
import productManage.service.ListManage.OutSourcePhaseService;
import productManage.vo.PageBean;
import productManage.vo.listManage.OutSourceManageVO;
@Service
public class OutSourcePhaseServiceImpl implements OutSourcePhaseService{

	@Autowired
	PageService pageService;
	@Autowired
	OutSourceDao outSourceDao;
	@Autowired
	OutSourceDetailDao outsourcedetailDao;

	@Override
	public List<OutSource> getOutSourceByKeys() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Design getDesignByOutSource() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Orders getOrderByOutSource() {
		// TODO Auto-generated method stub
		return null;
	}

	
	public List<OutSource> getAllOutSource(){
		return outSourceDao.getAllOutSource();
	}
	
	//根据外发单id来查询
	public List<OutSource> getOutSourceByOutSourceID(int outSourceID){
		return outSourceDao.getOutSourceListByID(outSourceID);
	}

	//分页查询
	@Override
	public PageBean getAllOutSourceInOutward(int page, int rowsPerPage) {
		String hql = "select o from OutSource o,Production p where o.production.productionID = p.productionID and p.productionState ='外发'" ;
    	PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
        List<OutSource> list = result.getList();
        List<OutSourceManageVO> list_vo = new ArrayList<OutSourceManageVO>();
        for(int i=0;i<list.size();i++){
        	list_vo.add(new OutSourceManageVO(list.get(i)));
        }
        result.setList(list_vo);
    	return result;
	}

	public PageBean inquireOutSourceInOutward(String hql,String orderPriority,int page, int rowsPerPage){
		PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
        List<OutSource> list = result.getList();
        List<OutSourceManageVO> list_vo = new ArrayList<OutSourceManageVO>();
        for(int i=0;i<list.size();i++){
        	list_vo.add(new OutSourceManageVO(list.get(i)));
        }
        if(orderPriority!=null){//订单优先级有需要
        	for(int i=0;i<list_vo.size();i++){
        		if(!list_vo.get(i).getOrderPriority().equals(orderPriority)){
        			list_vo.remove(i);
        			i--;
        		}
        	}
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
	
}
