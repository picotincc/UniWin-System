package productManage.service.process;

import java.util.List;
import java.util.Map;

import productManage.model.cs.Processor;
import productManage.vo.PageBean;

public interface ProcessorService {
	
	public boolean isProcesserExisted(String processorCode);
	
	public Processor getByID(int processorID);
	
	public boolean addProcessor(Processor processor);
	
	public List<Processor> getAllProcesser();
	
	public PageBean queryProcessor(int pageSize, int page, Map<String, Object> params);

}
