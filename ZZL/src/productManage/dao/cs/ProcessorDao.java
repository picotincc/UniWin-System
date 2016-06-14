package productManage.dao.cs;

import java.util.List;

import productManage.model.cs.Processor;

public interface ProcessorDao {
	
	public void add(Processor processor);
	
	public Processor getProcessorById(String code);
	
	public List<Processor> getAllProcessor();
	
	public List<Processor> getProcessorByName(String name);
	
	public Processor getByID(int processID);

}
