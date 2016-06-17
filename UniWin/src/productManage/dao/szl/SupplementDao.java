package productManage.dao.szl;

import java.sql.Date;
import java.util.List;

import productManage.model.szl.Supplement;

public interface SupplementDao {
	public int add(Supplement supplement);//添加一个补料单
	
	public void update(Supplement supplement);//更新补料单状态信息
	
	
	public Supplement getSupplementDetail(int supplementID);
	
	public List<Supplement> getAllSupplement();
	
	public Supplement getSupplementByCode(String supplementCode);
	
	
}
