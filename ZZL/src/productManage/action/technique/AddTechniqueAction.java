package productManage.action.technique;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.BaseAction;
import productManage.model.User;
import productManage.model.cs.Processor;
import productManage.model.tms.Design;
import productManage.model.tms.SpecificTechnique;
import productManage.model.tms.Technique;
import productManage.model.tms.TechniqueInventory;
import productManage.service.process.ProcessorService;
import productManage.service.system.UserService;
import productManage.service.technique.DesignService;
import productManage.service.technique.TechniqueService;

/**
 * @author TMS
 * @date 2016-2-29
 */
public class AddTechniqueAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userservice;

	@Autowired
	private TechniqueService techniqueService;
	@Autowired
	private DesignService designService;
	
	@Autowired
	private ProcessorService processorService;
	
	private String NowDay;
	private List designList = new ArrayList<>();
	private List processList = new ArrayList<>();
	private int tech_list_size;
	public String initAddTechnique(){
		if (request.getSession().getAttribute("account")!=null) {
			designList.clear();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			setNowDay(dateFormat.format(new Date()));
			List<Technique> techList = techniqueService.getAll();
			List<Design> tempDesignList = designService.getAll();
			for(int i=0;i<tempDesignList.size();i++){
				boolean isFind = false;
				for(int j=0;j<techList.size();j++){
					if(tempDesignList.get(i).getDesignID()==techList.get(j).getDesign().getDesignID()){
						isFind = true;
					}
				}
				if(!isFind){
					System.out.println(tempDesignList.get(i).getDesignCode());
					designList.add(tempDesignList.get(i));
				}
			}
			setDesignList(this.designList);
			setProcessList(processorService.getAllProcesser());
			return SUCCESS;
		}else{
			return "failed";
		}
		
	}
	public String execute() throws ServletException, IOException, ParseException{
		if (request.getSession().getAttribute("account")!=null) {
			String techCode = request.getParameter("techCode");
			String designCode = request.getParameter("designCode");
			String processorName = request.getParameter("processorName");
			int processorID = Integer.parseInt(processorName);
			String techDate = request.getParameter("techDate");
			String technique = request.getParameter("technique");
			String techShellType = request.getParameter("techShellType");
			String techSampleSize = request.getParameter("techSampleSize");
			
			
			String techJointSize = request.getParameter("techJointSize");
			String techLineDistance = request.getParameter("techLineDistance");
			String techPressingReq = request.getParameter("techPressingReq");
			String techComment = request.getParameter("techComment");
			 
			String tech_apart = request.getParameter("tech_apart");
			String specific_tech = request.getParameter("specific_tech");
			
			
//			Customer customer = customerService.getByID(customerID);
			Processor processor = processorService.getByID(processorID);
			System.out.println(processor.getProcessorCode()+" "+processor.getProcessorID());
			Design design = designService.getByCode(designCode);
			User user = userservice.findById("1");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Technique new_technique = new Technique();
			new_technique.setTechCode(techDate.replaceAll("-", "")+techCode);
			new_technique.setTechDate(dateFormat.parse(techDate));
			new_technique.setProcessor(processor);
			new_technique.setDesign(design);
			new_technique.setUser(user);
			new_technique.setTechnique(technique);
			new_technique.setTechShellType(techShellType);
			new_technique.setTechSampleSize(techSampleSize);
			new_technique.setTechModelFinish(0);
			new_technique.setTechJointSize(techJointSize);
			new_technique.setTechLineDistance(techLineDistance);
			new_technique.setTechPressingReq(techPressingReq);
			new_technique.setTechComment(techComment);
			techniqueService.save(new_technique);
			
			List<Technique> temp_List = techniqueService.getAll();
			int techID = temp_List.get(temp_List.size()-1).getTechid();
			System.out.println(techID);
			
			SpecificTechnique specificTechnique = new SpecificTechnique();
			specificTechnique.setSpecificTechnique(specific_tech);
			specificTechnique.setSpecificTechPartName(tech_apart);
			specificTechnique.setTechID(techID);
			techniqueService.save(specificTechnique);
			
			TechniqueInventory techniqueInventory;
			
			for(int i=0;i<tech_list_size;i++){
				String partName = request.getParameter("list-"+i+"-partName");
				String MCode = request.getParameter("list-"+i+"-MCode");
				String InTolerance = request.getParameter("list-"+i+"-InTolerance");
				System.out.println(InTolerance);
				techniqueInventory = new TechniqueInventory();
				techniqueInventory.setTechid(techID);
				techniqueInventory.setTechInMCode(MCode);
				techniqueInventory.setTechInPartName(partName);
				techniqueInventory.setTechInTolerance(Float.parseFloat(InTolerance));
				techniqueService.save(techniqueInventory);
			}
			initAddTechnique();
			return SUCCESS;
		}else{
			return "failed";
		}
		
	}


	
	public String getNowDay() {
		return NowDay;
	}

	public void setNowDay(String nowDay) {
		NowDay = nowDay;
	}

	public List getDesignList() {
		return designList;
	}

	public void setDesignList(List designList) {
		this.designList = designList;
	}


	public int getTech_list_size() {
		return tech_list_size;
	}

	public void setTech_list_size(int tech_list_size) {
		this.tech_list_size = tech_list_size;
	}

	public List getProcessList() {
		return processList;
	}

	public void setProcessList(List processList) {
		this.processList = processList;
	}






}
