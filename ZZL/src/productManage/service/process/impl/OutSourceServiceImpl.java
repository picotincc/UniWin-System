package productManage.service.process.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.cs.OutSourceDao;
import productManage.dao.cs.OutSourceDetailDao;
import productManage.dao.cs.ProcessorDao;
import productManage.dao.tms.DesignDAO;
import productManage.dao.wy.UserDao;
import productManage.dao.zky.ProductionDao;
import productManage.model.User;
import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.model.cs.Processor;
import productManage.model.tms.Design;
import productManage.model.zky.Production;
import productManage.service.PageService;
import productManage.service.process.OutSourceService;
import productManage.service.production.ProductionService;
import productManage.vo.PageBean;
import productManage.vo.process.OutSourceVO;
import productManage.vo.process.ProcessConstants;
import productManage.vo.production.ProductionConstants;

@Service
public class OutSourceServiceImpl implements OutSourceService {

	@Autowired
	private ProcessorDao processorDao;
	@Autowired
	private PageService pageservice;
	@Autowired
	private ProductionService productionService;
	@Autowired
	private OutSourceDao outSourceDao;
	@Autowired
	private ProductionDao productionDao;
	@Autowired
	private DesignDAO designDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private OutSourceDetailDao outSourceDetailDao;

	@Override
	public OutSource addOutSource(OutSource os) {

		Production p = productionDao.getProductionByCode(os.getProduction().getProductionCode());
		os.setProduction(p);

		Design d = designDao.findByCode(os.getDesign().getDesignCode());
		os.setDesign(d);

		Processor pr = processorDao.getProcessorById(os.getProcessor().getProcessorCode());
		os.setProcessor(pr);

		User user = userDao.getUserByAccount(os.getUser().getUserName());
		os.setUser(user);

		OutSource o = new OutSource();
		o = os;
		outSourceDao.add(o);

		/**
		 * 若对应生产单未开始外发，则转化其状态并记录此阶段开始时间, 若无问题可删除注释 by zky
		 */
		productionService.tryStartOutsource(p, new Timestamp(os.getActualOutDate().getTime()));

		OutSource result = outSourceDao.getOutSourceByCode(os.getOutsourceCode());

		return result;
	}

	@Override
	public void addOutSourceDetail(OutSource os, List<OutSourceDetail> details) {

		for (int i = 0; i < details.size(); i++) {
			OutSourceDetail osd = details.get(i);
			osd.setOutsource(os);
			outSourceDetailDao.add(osd);
		}
	}

	@Override
	public PageBean queryAllOutSource(int pageSize, int page) {
		String hql = "from OutSource ";

		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		List<OutSource> osList = (List<OutSource>) pageBean.getList();
		List<OutSourceVO> osvoList = packagingVO(osList);

		pageBean.setList(osvoList);
		return pageBean;
	}

	@Override
	public PageBean queryOutSource(int pageSize, int page, Map<String, Object> params) {
		String hql = "select os from OutSource as os inner join os.design as od inner join os.processor as op";
		String osCode = (String) params.get(ProcessConstants.SEARCH_OUTSOURCE_PARAMS[0]);
		String designCode = (String) params.get(ProcessConstants.SEARCH_OUTSOURCE_PARAMS[1]);
		String osDate = (String) params.get(ProcessConstants.SEARCH_OUTSOURCE_PARAMS[2]);
		String finishDate = (String) params.get(ProcessConstants.SEARCH_OUTSOURCE_PARAMS[3]);

		if (!(params.isEmpty())) {
			hql = hql + " where ";
		}
		int len = params.size();

		if (osCode != null) {
			hql = hql + "os.outsourceCode like '%" + osCode + "%'";
			len--;
			if (len > 0) {
				hql = hql + " and ";
			}
		}

		if (designCode != null) {
			hql = hql + "od.designCode like '%" + designCode + "%'";
			len--;
			if (len > 0) {
				hql = hql + " and ";
			}
		}

		if (osDate != null) {
			hql = hql + "os.actualOutDate = '" + osDate + "'";
			len--;
			if (len > 0) {
				hql = hql + " and ";
			}
		}

		if (finishDate != null) {
			hql = hql + "os.finishDate = '" + finishDate + "'";
			len--;
		}

		System.out.println(hql);

		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		List<OutSource> osList = (List<OutSource>) pageBean.getList();
		List<OutSourceVO> osvoList = packagingVO(osList);

		pageBean.setList(osvoList);
		return pageBean;
	}

	private List<OutSourceVO> packagingVO(List<OutSource> list) {
		List<OutSourceVO> voList = new ArrayList<OutSourceVO>();
		for (OutSource os : list) {
			OutSourceVO vo = new OutSourceVO();
			vo.setOsCode(os.getOutsourceCode());
			vo.setDesignCode(os.getDesign().getDesignCode());
			vo.setDesignImg("../images/1.png");
			vo.setDesignName(os.getDesign().getDesignName());
			vo.setFinishDate(os.getFinishDate());
			vo.setOsDate(os.getActualOutDate());
			vo.setOsPriority("第一时间");
			vo.setOsState(os.getOutsourceState());
			vo.setProcessorMobile(os.getProcessor().getProcessorMobileNum());
			vo.setProcessorName(os.getProcessor().getProcessorName());

			int sum = 0;
			Set<OutSourceDetail> details = os.getOutSourceDetails();
			for (OutSourceDetail d : details) {
				sum = sum + d.getOutsourceTotal();
			}
			vo.setSum(sum);
			voList.add(vo);
		}
		return voList;
	}

	@Override
	public boolean cancelOutSource(String code) {
		OutSource os = outSourceDao.getOutSourceByCode(code);
		if (os != null) {
			if(!(os.getOutSourceDetails().isEmpty() )){
				outSourceDetailDao.deleteBySet(os.getOutSourceDetails());
			}
			outSourceDao.delete(os);
			return true;
		}
		return false;
	}

	@Override
	public boolean modifyOutSource(OutSourceVO vo) {
		OutSource outsource = outSourceDao.getOutSourceByCode(vo.getOsCode());

		if (outsource != null) {
			if(!(outsource.getOutSourceDetails().isEmpty())){
				for (OutSourceDetail d : outsource.getOutSourceDetails()) {
					outSourceDetailDao.delete(d);
				}
			}

			outsource.setOutSourceDetails(null);
			outsource.setActualOutDate(vo.getActualOutDate());

			/**
			 * 若对应生产单未开始外发，则转化其状态并记录此阶段开始时间, 若无问题可删除注释 by zky
			 */
			productionService.tryStartOutsource(outsource.getProduction(),
					new Timestamp(vo.getActualOutDate().getTime()));

			outsource.setDesign(designDao.findByCode(vo.getDesignCode()));
			outsource.setFinishDate(vo.getFinishDate());
			outsource.setLabourCost(vo.getLabourCost());
			outsource.setOsScheduleDate(vo.getOsScheduleDate());
			outsource.setProcessor(processorDao.getProcessorById(vo.getProcessorCode()));
			outsource.setUser(userDao.getUserByName(vo.getUserName()).get(0));

			for (OutSourceDetail osd : vo.getDetails()) {
				osd.setOutsource(outsource);
			}
			List<OutSourceDetail> list = vo.getDetails();
			list.remove(list.size() - 1);
			outSourceDetailDao.add(list);

			outSourceDao.update(outsource);
			return true;
		}
		return false;
	}

	@Override
	public OutSource changeState(String code, String state) {
		OutSource outsource = outSourceDao.getOutSourceByCode(code);
		if (outsource != null) {
			outsource.setOutsourceState(state);
			/**
			 * 若对应生产单未部分收货或完全收货，则转化其状态并记录此阶段开始时间, 若无问题可删除注释 by zky
			 */
			if (state.equals("部分收货")) {
				productionService.tryPartReceive(outsource.getProduction(), new Timestamp(new Date().getTime()));
			} else if (state.equals("已完结")) {
				productionService.tryReceiveAll(outsource.getProduction(), new Timestamp(new Date().getTime()));
			}
			
			outSourceDao.update(outsource);
			return outsource;
		}
		return null;
	}

	@Override
	public OutSourceVO getOutSourceVO(String code) {
		OutSource os = outSourceDao.getOutSourceByCode(code);
		OutSourceVO vo = new OutSourceVO();
		vo.setOutsourceID(os.getOutsourceID());
		vo.setOsCode(os.getOutsourceCode());
		vo.setDesignCode(os.getDesign().getDesignCode());
		vo.setDesignImg("../images/1.png");
		vo.setDesignName(os.getDesign().getDesignName());
		vo.setFinishDate(os.getFinishDate());
		vo.setOsDate(os.getActualOutDate());
		vo.setOsPriority("第一时间");
		vo.setOsState(os.getOutsourceState());
		vo.setProcessorName(os.getProcessor().getProcessorName());
		vo.setProcessorMobile(os.getProcessor().getProcessorMobileNum());
		vo.setProcessorCode(os.getProcessor().getProcessorCode());
		vo.setActualOutDate(os.getActualOutDate());
		vo.setLabourCost(os.getLabourCost());
		vo.setOsScheduleDate(os.getOsScheduleDate());
		vo.setProductionID(os.getProduction().getProductionCode());
		vo.setUserName(os.getUser().getUserName());

		int sum = 0;
		Set<OutSourceDetail> details = os.getOutSourceDetails();
		List<OutSourceDetail> list = new ArrayList<OutSourceDetail>();
		for (OutSourceDetail d : details) {
			list.add(d);
			sum = sum + d.getOutsourceTotal();
		}
		vo.setDetails(list);
		vo.setSum(sum);
		return vo;
	}

}
