package productManage.service.ListManage.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.tz.TailorPhaseDao;
import productManage.model.cs.OutSource;
import productManage.service.PageService;
import productManage.service.ListManage.TailorPhaseService;
import productManage.vo.PageBean;
import productManage.vo.listManage.TailorManageVO;
import productManage.vo.system.ChargeConstants;
@Service
public class TailorPhaseServiceImpl implements TailorPhaseService {

	@Autowired
	PageService pageService;
	@Autowired
	TailorPhaseDao tailorDao;
	
	@Override
	public PageBean getAllOutSourceInTailor(int page, int rowsPerPage) {
		String hql = "select o from OutSource o,Production p where o.production.productionID = p.productionID and p.productionState ='裁剪'" ;
		PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
        List<OutSource> list = result.getList();
        List<TailorManageVO> list_vo = new ArrayList<TailorManageVO>();
        for(int i=0;i<list.size();i++){
        	list_vo.add(new TailorManageVO(list.get(i)));
        }
        result.setList(list_vo);
    	return result;
	}

	public PageBean getChargeByPage(int pageSize,int page,Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql = "select distinct user from User user,UserRole ur,Role r where ur.roleID=r.roleID and user.userId=ur.userId and r.roleName='排单管理负责人'";
		String userName = (String) params.get(ChargeConstants.SEARCH_CHARGE_PARAMS[0]);
		if (!userName.isEmpty()) {
			hql += " where user.userName like '%"+userName+"%'";
		}
		return pageService.queryForPage(hql, pageSize, page);
	}
	
	
	@Override
	public PageBean inquireOutSourceInTailor(String hql,HashMap<String,String> conditions, int page, int rowsPerPage) {
		PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
        List<OutSource> list = result.getList();
        List<TailorManageVO> list_vo = new ArrayList<TailorManageVO>();
        for(int i=0;i<list.size();i++){
        	list_vo.add(new TailorManageVO(list.get(i)));
        }
        //根据条件删选 
        String tailModel = conditions.get("tailModel");
        String isInStore = conditions.get("isInStore");
        String inquiryProgress = conditions.get("inquiryProgress");
        String tailor = conditions.get("tailor");
        
        if(!tailModel.equals("请选择") || !isInStore.equals("请选择") || !inquiryProgress.equals("请选择") || !tailor.equals("请选择")){
        
        	for(int i=0;i<list_vo.size();i++){
        		if(tailModel.equals("已排版")&&list_vo.get(i).getTailorModelName().equals("无")){
        			list_vo.remove(i);
        			i--;
        			continue;
        		}
        		if(tailModel.equals("未排版")&&!list_vo.get(i).getTailorModelName().equals("无")){
        			list_vo.remove(i);
        			i--;
        			continue;
        		}
        		if((!isInStore.equals(list_vo.get(i).getIsInWarehouse())) && !isInStore.equals("请选择") ){
        			list_vo.remove(i);
        			i--;
        			continue;
        		}
        		if(!inquiryProgress.equals(list_vo.get(i).getOrderPriority()) && !inquiryProgress.equals("请选择")){
        			list_vo.remove(i);
        			i--;
        			continue;
        		}
        		if(tailor.equals("已裁剪")&&list_vo.get(i).getTailorTailorName().equals("无")){
        			list_vo.remove(i);
        			i--;
        			continue;
        		}
                if(tailor.equals("未裁剪")&&!list_vo.get(i).getTailorTailorName().equals("无")){
                	list_vo.remove(i);
        			i--;
        			continue;
        		}
        	}
        	
        }
        
        result.setList(list_vo);
    	return result;
	}

	public boolean tailorAppoint(int outsourceID, int userID, String role) {
		//委派
		return  tailorDao.tailorAppoint(outsourceID, userID, role);
	}

	@Override
	public void beginTailorPhase(int outsourceID) {
		// TODO Auto-generated method stub
		tailorDao.beginTailorAppoint(outsourceID);
	}

	@Override
	public void endTailorPhase(int outsourceID) {
		// TODO Auto-generated method stub
		tailorDao.endTailorAppoint(outsourceID);
	}

}
