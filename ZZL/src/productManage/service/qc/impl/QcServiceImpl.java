package productManage.service.qc.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.BaseDao;
import productManage.dao.tms.InquiryDAO;
import productManage.dao.wcy.QcDAO;
import productManage.model.User;
import productManage.model.tms.Design;
import productManage.model.tyc.Purchase;
import productManage.model.wcy.Qc;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.Orders;
import productManage.model.yrd.Customer;
import productManage.model.zky.Production;
import productManage.service.PageService;
import productManage.service.production.ProductionService;
import productManage.service.qc.QcService;
import productManage.vo.PageBean;
import productManage.vo.qc.DesignConstants;
import productManage.vo.qc.QCVO;
import productManage.vo.system.ChargeConstants;
@Service
public class QcServiceImpl implements QcService{

	@Autowired
	private QcDAO qcDao;
	@Autowired
	private BaseDao baseDao;
	@Autowired
	PageService pageService;
	@Autowired
	ProductionService productionService;
	public QcDAO getQcDao() {
		return qcDao;
	}

	public void setQcDao(QcDAO qcDao) {
		this.qcDao = qcDao;
	}
	
	@Override
	public void add(Qc qc) {
		// TODO Auto-generated method stub
		/**
		 * 若对应生产单未开始质检，则转化其状态并记录此阶段开始时间, 若无问题可删除注释 by zky
		 */
		productionService.tryQC(qc.getProduction(), new Timestamp(new Date().getTime()));

		qcDao.add(qc);
	}



	@Override
	public Design getDesignPic(String designCode) {
		// TODO Auto-generated method stub
		return qcDao.getDesignPic(designCode);
	}

	

	@Override
	public Customer getCustomerName(int customerID) {
		// TODO Auto-generated method stub
		return qcDao.getCustomerName(customerID);
	}

	@Override
	public void update(Qc qc) {
		// TODO Auto-generated method stub
		qcDao.update(qc);;
	}

	@Override
	public List<Qc> getAll() {
		// TODO Auto-generated method stub
		return qcDao.getAll();
	}

	@Override
    public PageBean getAll(int rowsPerPage, int page) {
    	String hql = "from Qc as qc";
    	PageBean pagebean = pageService.queryForPage(hql, rowsPerPage, page);
    	List<Qc> qcs =pagebean.getList();
    	/*List<Qc> qcs = baseDao.getSession().createQuery(hql).list();
    	System.out.println("qcsvvvvvvvvvgde size"+ qcs.size());*/
    	List<QCVO> qcVOs = new ArrayList<QCVO>();
    	for(int i=0;i<qcs.size();i++){
    		QCVO qcVO  = new QCVO();
    		
    		qcVO = qcDao.getQCVOByQc(qcs.get(i));
    		qcVOs.add(qcVO);
    	}
    	
    	pagebean.setList(qcVOs);
    	//pagebean.setAllList(qcVOs);
        return pagebean;
    }

	@Override
	public List<Qc> get(String designCode,String qCDesignateTime,String userName,String qCState) {
		// TODO Auto-generated method stub
		return qcDao.get(designCode, qCDesignateTime, userName, qCState);
	}

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return qcDao.getAllUsers();
	}

	@Override
	public List<User> getUserByName(String username) {
		// TODO Auto-generated method stub
		return qcDao.getUserByName(username);
	}

	@Override
	public PageBean getSearched(int page, int rowsPerPage,String designCode,String pQCTime,String userName,String qCState) {
		
		//String hql = "select q from Qc q,Orders o where q.QCState = '"+qCState+"' and q.production.pQCTime = '"+pQCTime+"' and q.user.userName= '"+userName+"' and o.production.productionID = q.production.productionID and o.design.designCode= '"+designCode+"'";
		//String hql = " from Qc  where Qc.qCState = '"+qCState+"' and Qc.production.pQCTime = '"+pQCTime+"' and Qc.user.userName= '"+userName+"' join Orders with Orders.production.productionID = Qc.production.productionID where Orders.design.designCode= '"+designCode+"'";
    	
		StringBuffer hql = new StringBuffer();
		hql.append(
				"select q from Qc q,Orders o where o.production.productionID = q.production.productionID ");
		if (null != pQCTime && !"".equals(pQCTime)) {
			hql.append(" and q.production.pQCTime like '%" + pQCTime + "%'");
		}
		if (null != qCState && !"".equals(qCState)) {
			hql.append(" and q.QCState like '%" + qCState + "%'");
		}
		if (null != userName && !"".equals(userName)) {
			hql.append(" and q.user.userName like '%" + userName + "%'");
		}
		if (null != designCode && !"".equals(designCode)) {
			hql.append(" and o.design.designCode like '%" + designCode + "%'");
		}
		
		PageBean pagebean = pageService.queryForPage(hql.toString(), rowsPerPage, page);
		
		List<Qc> qcs = pagebean.getList();
    	List<QCVO> qcVOs = new ArrayList<QCVO>();
    	for(int i=0;i<qcs.size();i++){
    		QCVO qcVO  = new QCVO();
    		
    		qcVO = qcDao.getQCVOByQc(qcs.get(i));
    		qcVOs.add(qcVO);
    	}
    	System.out.println("qcsjiiiiie size"+ qcVOs.size());
    	pagebean.setList(qcVOs);
        return pagebean;
		
	}

	@Override
	public QCVO getQCVO(Qc qc) {
		
		return qcDao.getQCVOByQc(qc);
	}

	@Override
	public String addresult(Qc qc) {
		String[] qc_result=qc.getQCResult().split("\\/");
		String[] qc_stages = qc.getQCStages().split("\\/");
		if(qc_result.length==qc_stages.length){
		productionService.tryFinishQC(qc.getProduction(),new Timestamp(new Date().getTime()) );
		}
		String result=qcDao.update(qc);
		return result;
	}

	public Qc getQcById(int qcID){
		return qcDao.getQcById(qcID);
	}
	public Qc getQcByCode(String qcCode){
		return qcDao.getQcByCode(qcCode);
	}
	
	public void setCharge(int userId,int qcID){
		 qcDao.setCharge(userId,qcID);
	}

	@Override
	public PageBean getDesignByPage(int rowsPerPage, int page,
			Map<String, Object> params) {
		String hql = "select orders from Production as production ,Orders as orders  where production.productionID= orders.production.productionID ";
		String designCode = (String) params.get(DesignConstants.SEARCH_DESIGN_PARAMS[0]);
		if (null != designCode && !"".equals(designCode)) {
			hql += " and orders.design.designCode like '%"+designCode+"%'";
		}
		
		return pageService.queryForPage(hql, rowsPerPage, page);
	
	}

	@Override
	public QCVO getQCVOByOrder(int orderID) {
		// TODO Auto-generated method stub\
		return qcDao.getQCVOByOrder(orderID);
		
	}

	@Override
	public User getUserByAccount(String account) {
		return qcDao.getUserByAccount(account);
	}
	public void delete(String QCCode){
		 qcDao.delete(QCCode);
	}

	@Override
	public PageBean getChargeByPage(int rowsPerPage, int page,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql = "select distinct user from User user,UserRole ur,Role r where ur.roleID=r.roleID and user.userId=ur.userId and r.roleName='QC质检单负责人' ";
		String userName = (String) params.get(ChargeConstants.SEARCH_CHARGE_PARAMS[0]);
		if (!userName.isEmpty()) {
			hql += " and user.userName like '%"+userName+"%'";
		}
		return pageService.queryForPage(hql, rowsPerPage, page);
	}

	@Override
	public void addPurchase(Production production,User user) {
		// TODO Auto-generated method stub
		Purchase purchase = new Purchase();
		purchase.setUser(user);
		purchase.setProduction(production);
		SimpleDateFormat fmt=new SimpleDateFormat("hhmmss_yyyyMMdd");
		Date nowDate = new Date();
		String purchaseCode =  "CGD"+fmt.format(nowDate);
		purchase.setPurchaseCode(purchaseCode); 
		java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
		purchase.setScheduledPurchaseDate(currentDate);
		purchase.setPurDocumentedDate(currentDate);
		purchase.setPurchaseState("待审核");
		purchase.setPurchaseType("shell");
		baseDao.save(purchase);
		Purchase purchase1 = purchase;
		purchase1.setPurchaseCode("FLD"+fmt.format(nowDate));
		purchase1.setPurchaseType("accessory");
		baseDao.save(purchase1);
	}
	
	 

}
