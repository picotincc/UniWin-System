package productManage.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;

public interface BaseDao {

	public Session getSession();

	public Session getNewSession();

	public void flush();

	public void clear();

	public Object load(Class c, String id);

	public Object load(Class c, int id);

	public List getAllList(Class c);

	public Long getTotalCount(Class c);

	public void save(Object bean);

	public void update(Object bean);

	public void delete(Object bean);

	public void delete(Class c, String id);

	public void delete(Class c, String[] ids);

	/**
	 * 
	 * @param hql (特定条件的）查询语句
	 * @param offset 本页起始点相对偏移量
	 * @param length 需要获取的列表长度
	 * @return
	 */
	public List queryForPage(String hql, int offset, int length);
	/**
	 * 
	 * @param hql
	 * @return 满足特定条件的条目数
	 */
	public int getAllRowCount(String hql);

}
