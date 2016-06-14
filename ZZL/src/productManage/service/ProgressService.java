package productManage.service;

public interface ProgressService {
	/**
	 * 
	 * @param progress 某单进度
	 * @return hql的查询语句where条件
	 */
	public String inquiryProgressHql(String path,String inquiryProgress);
	public String sampleOrderProgressHql(String path,String sampleOrderProgress);
	public String productionProgressHql(String path,String productionProgress);
}
