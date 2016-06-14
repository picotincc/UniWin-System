package productManage.service.sample;

import java.util.Map;

import productManage.model.whq.Sample;
import productManage.model.whq.SampleStorageDetail;
import productManage.vo.PageBean;

/**
 * @author WHQ
 * @date 2016-03-08
 */
public interface SampleManageService {
	public int SampleInput(String designID,String samplePlace,String sampleOPComment);
	public PageBean showAllSamples(int rowsPerPage,int page);
	public PageBean showSamplesByFilter(int rowsPerPage,int page,Map filter);
	/**
	 * 根据位置和款式号寻找样衣
	 * @param location
	 * @param designID
	 * @return
	 */
	public Sample getSample(String location , String designCode);
	public Sample addSample(String designCode, String samplePlace ,String sampleState);
	public int addSampleStorageDetail(SampleStorageDetail sampleStorageDetail);
	public String getExcelModel();        //获得excel模板，返回文件地址
}
