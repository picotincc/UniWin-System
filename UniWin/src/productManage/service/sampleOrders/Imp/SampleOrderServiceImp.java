package productManage.service.sampleOrders.Imp;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.yk.SampleOrderDAO;
import productManage.model.yk.SampleOrders;
import productManage.service.PageService;
import productManage.service.ProgressService;
import productManage.service.sampleOrders.SampleOrderService;
import productManage.vo.PageBean;
import productManage.vo.sampleOrders.SampleOrdersConstants;
@Service
public class SampleOrderServiceImp implements SampleOrderService{
	@Autowired
	private SampleOrderDAO sampleOrderDAO;
	@Autowired
	private PageService pageService;
	@Autowired
	private ProgressService progressService;
	
	@Override
	public SampleOrders getSampleOrderByID(int sampleOrderID) {
		// TODO Auto-generated method stub
		return sampleOrderDAO.getSampleOrderByID(sampleOrderID);
	}
	
	@Override
	public SampleOrders getSampleOrderByCode(String sampleOrderCode) {
		// TODO Auto-generated method stub
		return sampleOrderDAO.getSampleOrderByCode(sampleOrderCode); 
	}

	@Override
	public PageBean getAllSampleOrdersByPage(int pageSize, int page) {
		// TODO Auto-generated method stub
		String hql = "from SampleOrders";
		return pageService.queryForPage(hql, pageSize, page);
	}

	@Override
	public PageBean searchSampleOrdersByPage(int pageSize, int page,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql = "select sampleOrder from SampleOrders as sampleOrder";
		String maker =  (String) params.get(SampleOrdersConstants.SEARCH_SAMPLEORDERS_PARAMS[0]);
		String date =  (String) params.get(SampleOrdersConstants.SEARCH_SAMPLEORDERS_PARAMS[1]);
		String sampleOrderProgress =  (String) params.get(SampleOrdersConstants.SEARCH_SAMPLEORDERS_PARAMS[2]);
		//按照相应条件组装hql
		if (!maker.isEmpty()||!date.isEmpty()||!sampleOrderProgress.isEmpty()) {
			hql += " where";
		}
		if (!maker.isEmpty()) {
			hql += " sampleOrder.maker.userName like '"+maker+"%'";
		}
		if (!maker.isEmpty()&(!date.isEmpty()||!sampleOrderProgress.isEmpty())) {
			hql += " and";
		}
		if (!date.isEmpty()) {
			hql += " sampleOrder.sampleOrderTime like '"+date+"%'";
		}
		if (!date.isEmpty()&!sampleOrderProgress.isEmpty()) {
			hql += " and";
		}
		if (!sampleOrderProgress.isEmpty()) {
			hql += progressService.sampleOrderProgressHql("sampleOrder.sampleProcedure", sampleOrderProgress);
		}
		//System.out.println(hql);
		return pageService.queryForPage(hql, pageSize, page);
	}

}
