package productManage.dao.wcy;

import java.sql.Timestamp;
import java.util.List;

import productManage.model.User;
import productManage.model.tms.Design;
import productManage.model.wcy.Qc;
import productManage.model.wy.Role;
import productManage.model.yrd.Customer;
import productManage.vo.qc.QCVO;

public interface QcDAO {
	
	public void add(Qc qc);
	public Design getDesignPic(String designCode);
	public Customer getCustomerName(int customerID);
	
	public List<Qc> getAll();
	public List<Qc> get(String designCode,String qCDesignteTime,String userName,String qCState);
	public List<User> getAllUsers();
	public List<User> getUserByName(String username);
    public QCVO getQCVOByQc(Qc qc);
	public String update(Qc qc);
    public Qc getQcById(int qcID);
    public Qc getQcByCode(String qcCode);
    public void setCharge(int userId,int qcID);
    public QCVO getQCVOByOrder(int orderID);
	public User getUserByAccount(String account);
	public void delete(String QCCode);
	
}
