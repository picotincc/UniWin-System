package productManage.dao.whq.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import productManage.dao.BaseDao;
import productManage.dao.whq.SampleStorageDetailDao;
import productManage.model.whq.SampleStorageDetail;

@Repository
public class SampleStorageDetailDaoImpl implements SampleStorageDetailDao{

	@Autowired
	private BaseDao basedao;
	@Override
	public int addSampleStorageDetail(SampleStorageDetail sampleStoragedetail) {
		basedao.save(sampleStoragedetail);
		return 1;
	}

}
