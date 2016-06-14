package productManage.service.process.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.cs.ProcessorDao;
import productManage.model.cs.Processor;
import productManage.service.PageService;
import productManage.service.process.ProcessorService;
import productManage.vo.PageBean;
import productManage.vo.process.ProcessConstants;

@Service
public class ProcessorServiceImpl implements ProcessorService{

	@Autowired
	private ProcessorDao processorDao;
	@Autowired
	private PageService pageservice;
	
	@Override
	public boolean isProcesserExisted(String processorCode) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addProcessor(Processor processor) {
		processorDao.add(processor);
		return true;
	}

	@Override
	public PageBean queryProcessor(int pageSize, int page, Map<String, Object> params) {
		String hql = "select processor from Processor as processor ";
		String processorName = (String) params.get(ProcessConstants.SEARCH_PROCESSOR_PARAMS[0]);
		if (processorName != null) {
			hql += "where ";
			hql += "processor.processorName like '%" + processorName + "%' ";
		}
		
		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		List<Processor> processorList = pageBean.getList();
		
		pageBean.setList(processorList);
		return pageBean;
	}

	@Override
	public List<Processor> getAllProcesser() {
		List<Processor> list = (List<Processor>)processorDao.getAllProcessor();
		return list;
	}

	@Override
	public Processor getByID(int processorID) {
		// TODO Auto-generated method stub
		return processorDao.getByID(processorID);
	}

}
