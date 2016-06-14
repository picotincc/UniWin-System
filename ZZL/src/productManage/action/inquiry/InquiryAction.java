package productManage.action.inquiry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import productManage.action.BaseAction;
import productManage.model.lhj.Material;
import productManage.model.yk.Inquiry;
import productManage.model.yk.InquiryMaterial;
import productManage.service.inquiry.InquiryMaterialService;
import productManage.service.inquiry.InquiryService;
import productManage.service.material.MaterialService;

public class InquiryAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private InquiryService inquiryService;
	
	@Autowired
	private MaterialService materialService;
	
	@Autowired
	private InquiryMaterialService inquiryMaterialService;
	private int inquiryID;
	private Inquiry inquiry;
	private List<Material> materials;
	private int fuliao_list_size;
	public int getFuliao_list_size() {
		return fuliao_list_size;
	}

	public void setFuliao_list_size(int fuliao_list_size) {
		this.fuliao_list_size = fuliao_list_size;
	}

	public int getInquiryID() {
		return inquiryID;
	}

	public void setInquiryID(int inquiryID) {
		this.inquiryID = inquiryID;
	}
	
	public Inquiry getInquiry() {
		return inquiry;
	}

	public void setInquiry(Inquiry inquiry) {
		this.inquiry = inquiry;
	}
	
	public List<Material> getMaterials() {
		return materials;
	}

	public void setMaterials(List<Material> materials) {
		this.materials = materials;
	}
	public String getInquiryByID(){
		if (request.getSession().getAttribute("account")!=null) {
			this.inquiry = inquiryService.getInquiryByID(inquiryID); 
			this.materials = materialService.getFuliaoMaterial();
			if (inquiry==null) {
				return ERROR;
			}
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
	public String checkFuliao(){
		if (request.getSession().getAttribute("account")!=null) {
			this.inquiry = inquiryService.getInquiryByID(inquiryID); 
			InquiryMaterial inquiryMaterial;
			for(int i=0;i<fuliao_list_size;i++){
				String materialCode = request.getParameter("list-"+i+"-fuliao");
				int inquiryMaterialUnitVol = Integer.parseInt(request.getParameter("list-"+i+"-counter"));
				Material material = materialService.getMaterialByCode(materialCode);
				inquiryMaterial = new InquiryMaterial();
				inquiryMaterial.setInquiry(inquiry);
				inquiryMaterial.setMaterial(material);
				inquiryMaterial.setInquiryMaterialUnitVol(inquiryMaterialUnitVol);
				inquiryMaterialService.save(inquiryMaterial);
			}
			return SUCCESS;
		}else{
			return "failed";
		}
	}


	
}
