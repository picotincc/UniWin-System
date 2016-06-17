package productManage.service.ListManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.vo.PageBean;

public interface TailorPhaseService {//裁剪排单
	

	public PageBean getAllOutSourceInTailor(int page, int rowsPerPage);
	public PageBean inquireOutSourceInTailor(String hql,HashMap<String,String> conditions,int page, int rowsPerPage);
	public boolean tailorAppoint(int outsourceID,int userID,String role); //委派裁剪人员
	public PageBean getChargeByPage(int pageSize,int page,Map<String, Object> params);//获取所有的订单负责人分页返回
	public void beginTailorPhase(int outsourceID);
	public void endTailorPhase(int outsourceID);
}
