package productManage.dao.tms;

import java.util.Date;
import java.util.List;

import productManage.model.tms.Technique;

public interface TechniqueDAO {
	public void save(Technique technique);//保存款式工艺
	public List<Technique> findAll();//找到所有记录
	/*
	public Technique findByTechniqueID(String ID);//根据款式编码找到记录
	public List<Technique> findByDate(Date date);//根据上架日期找到记录
	
	*/
}
