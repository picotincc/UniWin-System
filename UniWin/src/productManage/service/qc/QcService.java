package productManage.service.qc;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import productManage.model.tms.Design;
import productManage.model.wcy.Qc;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.Orders;
import productManage.model.yrd.Customer;
import productManage.model.zky.Production;
import productManage.model.User;
import productManage.vo.PageBean;
import productManage.vo.qc.QCVO;

public interface QcService {

	
	public void add(Qc qc);
	public Design getDesignPic(String designCode);
	public Customer getCustomerName(int customerID);
	public void update(Qc qc); 
	public List<Qc> getAll();
	public PageBean getAll(int rowsPerPage, int page);
	public List<Qc> get(String designCode,String qCDesignateTime,String userName,String qCState);
	public List<User> getAllUsers();
	public List<User> getUserByName(String username);
	public PageBean getSearched(int page, int rowsPerPage,String designCode,String pQCTime,String userName,String qCState);
	public QCVO getQCVO(Qc qc);
	public String addresult(Qc qc);
	public Qc getQcById(int qcID);
	public Qc getQcByCode(String qcCode);
	public void setCharge(int userId,int qcID);
	public PageBean getDesignByPage(int rowsPerPage, int page,Map<String, Object> params);
	public QCVO getQCVOByOrder(int orderID);
	public User getUserByAccount(String account);
	public void delete(String QCCode);
	public PageBean getChargeByPage(int rowsPerPage, int page,
			Map<String, Object> params);
	public void addPurchase(Production production,User user);
 
}
