package productManage.dao.cs;

import java.util.List;

import productManage.model.cs.OutSource;

public interface OutSourceDao {
	
	public OutSource getOutSourceByCode(String code);
	
	public void add(OutSource outsource);
	
	public void update(OutSource outsource);
	
	public void delete(OutSource outsource);
	
	public List<OutSource> getOutSourceByKey(String[] keys);

	public List<OutSource> getOutSourceListByID(int outSourceID); // 通过外发单编号模糊查询
	
	public OutSource getOutSourceByID(int outSourceID); // 通过外发单编号查询
	
	public List<OutSource> getOutSourceListByProductionID(int productionID); // 通过生产单编号查询
	
	public List<OutSource> getAllOutSource(); //获取全部外发单
}
