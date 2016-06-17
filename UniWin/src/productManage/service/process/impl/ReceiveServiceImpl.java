package productManage.service.process.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.cs.OutSourceDao;
import productManage.dao.cs.ProcessorDao;
import productManage.dao.cs.ReceiveDao;
import productManage.dao.cs.ReceiveDetailDao;
import productManage.dao.wy.UserDao;
import productManage.model.User;
import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.model.cs.Processor;
import productManage.model.cs.Receive;
import productManage.model.cs.ReceiveDetail;
import productManage.service.PageService;
import productManage.service.process.ReceiveService;
import productManage.vo.PageBean;
import productManage.vo.process.OutSourceVO;
import productManage.vo.process.ProcessConstants;
import productManage.vo.process.ReceiveVO;

@Service
public class ReceiveServiceImpl implements ReceiveService{
	
	@Autowired
	private PageService pageservice;
	@Autowired
	private ProcessorDao processorDao;
	@Autowired
	private OutSourceDao outSourceDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ReceiveDao receiveDao;
	@Autowired
	private ReceiveDetailDao receiveDetailDao;

	@Override
	public boolean addReceive(ReceiveVO receiveVO) {
		Receive receive = new Receive();
		
		User user =  userDao.getUserByAccount((receiveVO.getUserName()));
		receive.setUser(user);
		
		receive.setReceiveDate(receiveVO.getReceiveDate());
		
		Processor p = processorDao.getProcessorById(receiveVO.getProcessorCode());
		receive.setProcessor(p);
		receive.setReceiveType(p.getDeliveryType());
		
		OutSource os = outSourceDao.getOutSourceByCode(receiveVO.getOutsourceCode());
		receive.setR_outsource(os);
			
		Receive result = receiveDao.add(receive);
		if(result == null){
			return false;
		}
		
		List<ReceiveDetail> details_add = receiveVO.getDetails();
		if(details_add.size() > 1 ){
			details_add.remove(details_add.size()-1);
			for(ReceiveDetail rd : receiveVO.getDetails()){
				rd.setReceive(result);
				receiveDetailDao.add(rd);
			}
		}

		return true;
	}

	@Override
	public PageBean queryAllReceive(int pageSize, int page) {
		String hql = "from Receive ";
		
		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		List<Receive> rList = (List<Receive>)pageBean.getList();
		List<ReceiveVO> rvoList = packagingVO(rList);
		
		pageBean.setList(rvoList);
		return pageBean;
	}

	@Override
	public PageBean queryReceive(int pageSize, int page, Map<String, Object> params) {
		String hql = "select r from Receive as r inner join r.r_outsource.design as rd inner join r.processor as rp";
		String processorName = (String) params.get(ProcessConstants.SEARCH_RECEIVE_PARAMS[0]);
		String receiveDate = (String) params.get(ProcessConstants.SEARCH_RECEIVE_PARAMS[1]);
		String designCode = (String) params.get(ProcessConstants.SEARCH_RECEIVE_PARAMS[2]);
		
		
		if(!(params.isEmpty())){
			hql = hql + " where ";
		}
		int len = params.size();
		
		if( processorName != null ){
			hql = hql + "rp.processorName like '%" + processorName + "%'";
			len--;
			if( len > 0 ){
				hql = hql + " and ";
			}
		}
		
		if( designCode != null ){
			hql = hql + "rd.designCode like '%" + designCode + "%'";
			len--;
			if( len > 0 ){
				hql = hql + " and ";				
			}
		}
		
		if( receiveDate != null ){
			hql = hql + "r.receiveDate = '" + receiveDate + "'";
			len--;
			if( len > 0 ){
				hql = hql + " and ";
			}
		}
		
		System.out.println(hql);

		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		List<Receive> rList = (List<Receive>)pageBean.getList();
		List<ReceiveVO> rvoList = packagingVO(rList);
		
		pageBean.setList(rvoList);
		return pageBean;
	}

	
	private List<ReceiveVO> packagingVO(List<Receive> rList) {
		List<ReceiveVO> voList = new ArrayList<ReceiveVO>();
		for(Receive r : rList){
			ReceiveVO vo = new ReceiveVO();
			vo.setReceiveID(r.getReceiveID());
            vo.setDeliveryType(r.getProcessor().getDeliveryType());
            vo.setDesignImgUrl("../images/1.png");
            vo.setOutsourceCode(r.getR_outsource().getOutsourceCode());
            vo.setProcessorCode(r.getProcessor().getProcessorCode());
            vo.setProcessorDistrict(r.getProcessor().getProcessorDistrict());
            vo.setProcessorName(r.getProcessor().getProcessorName());
            vo.setReceiveDate(r.getReceiveDate());
            vo.setUserName(r.getUser().getUserName());
            
			
			int sum = 0 ; 
			Set<ReceiveDetail> details = r.getReceiveDetails();
			List<ReceiveDetail> list = new ArrayList<ReceiveDetail>();
			for(ReceiveDetail d : details){
				list.add(d);
				sum = sum + d.getReceiveTotal();
			}
			vo.setDetails(list);
			vo.setSum(sum);
			voList.add(vo);
		}		
		return voList;
	}

	@Override
	public boolean cancelReceive(int receiveID) {
		Receive r = receiveDao.getReceiveByID(receiveID);
		if(r != null){
			if(!(r.getReceiveDetails().isEmpty())){
				receiveDetailDao.deleteBySet(r.getReceiveDetails());
			}
			receiveDao.delete(r);
			return true;
		}
		return false;
	}

	@Override
	public ReceiveVO getReceiveVO(int receiveID) {
		Receive r = receiveDao.getReceiveByID(receiveID);
		ReceiveVO vo = new ReceiveVO();
		
		vo.setReceiveID(r.getReceiveID());
		vo.setOutsourceCode(r.getR_outsource().getOutsourceCode());
		vo.setProcessorCode(r.getProcessor().getProcessorCode());
		vo.setDeliveryType(r.getReceiveType());
		vo.setDesignImgUrl("../images/1.png");
		vo.setProcessorDistrict(r.getProcessor().getProcessorDistrict());
		vo.setProcessorMobile(r.getProcessor().getProcessorMobileNum());
		vo.setProcessorName(r.getProcessor().getProcessorName());
		vo.setReceiveDate(r.getReceiveDate());
		vo.setUserName(r.getUser().getUserName());
		
		int sum = 0 ; 
		Set<ReceiveDetail> details = r.getReceiveDetails();
		List<ReceiveDetail> list = new ArrayList<ReceiveDetail>();
		for(ReceiveDetail d : details){
			list.add(d);
			sum = sum + d.getReceiveTotal();
		}
		vo.setDetails(list);
		vo.setSum(sum);
		return vo;
	}

	@Override
	public boolean modifyReceive(ReceiveVO receiveVO) {
		Receive receive = receiveDao.getReceiveByID(receiveVO.getReceiveID());
		
		if(receive != null ){
			if(!(receive.getReceiveDetails().isEmpty())){
				for(ReceiveDetail d : receive.getReceiveDetails()){
					receiveDetailDao.delete(d);
				}
			}


            receive.setReceiveDetails(null);
            receive.setReceiveDate(receiveVO.getReceiveDate());
			receive.setUser(userDao.getUserByName(receiveVO.getUserName()).get(0));
			
			receiveDao.update(receive);
			
			List<ReceiveDetail> list = receiveVO.getDetails();
			if(list.size() > 1){
				list.remove(list.size()-1);
				for(ReceiveDetail osd : list){
					osd.setReceive(receive);
				}
				receiveDetailDao.add(list);
			}			
			return true;
		}
		return false;
	}

	@Override
	public List<ReceiveDetail> getReceiveDetails(int rid) {
		List<ReceiveDetail> resList = new ArrayList<ReceiveDetail>();
		resList = receiveDetailDao.getDetailByreceiveId(rid);
		return resList;
	}
}
