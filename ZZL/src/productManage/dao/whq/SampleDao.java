package productManage.dao.whq;

import productManage.model.whq.Sample;



/**
 * @author WHQ
 * @date 创建时间2016-3-8
 * 样衣表DAO
 */
public interface SampleDao {
		public Sample addSample(Sample sample);
		public Sample getSample(String location ,String designCode);
}
