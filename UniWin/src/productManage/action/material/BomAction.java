package productManage.action.material;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import productManage.action.PageAction;
import productManage.model.lhj.Bom;
import productManage.model.lhj.Material;
import productManage.model.tms.Design;
import productManage.service.material.BomService;
import productManage.service.material.MaterialService;
import productManage.service.technique.DesignService;
import productManage.vo.PageBean;
import productManage.vo.material.BomForMaterial;
import productManage.vo.material.MaterialConstants;
import productManage.vo.technique.TechniqueConstants;

public class BomAction extends PageAction{

	private static final long serialVersionUID = 1L;
	@Autowired
	private BomService bomservice;
	
	@Autowired
	private MaterialService materialservice;
	
	@Autowired
	private DesignService designservice;
	
	private String designCode="";

	private String putawayDate="";
	
	
	public String getDesignCode() {
		return designCode;
	}

	public String getPutawayDate() {
		return putawayDate;
	}

	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}

	public void setPutawayDate(String putawayDate) {
		this.putawayDate = putawayDate;
	}
	
	public String showDesignList(){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[0],designCode);
		params.put(TechniqueConstants.SEARCH_TECHNIQUE_PARAMS[1], putawayDate);
		try {
			this.pageBean = bomservice.queryDesign(this.rowsPerPage, this.page, params);
			List<Design> list = this.pageBean.getList();
			for(int i=0;i<list.size();i++){
				String url = list.get(i).getDesignPicURL();
				if(url.length()>12) {list.get(i).setDesignPicURL("../images/1.png");}
			}
			this.pageBean.setList(list);
		} catch (Exception e) {
			e.printStackTrace();
			this.pageBean=new PageBean();
			return ERROR;
		}
		return SUCCESS;
	}

	
	private Design design;
	
	private List materialMes;
	
	public List getMaterialMes() {
		return materialMes;
	}

	public void setMaterialMes(List materialMes) {
		this.materialMes = materialMes;
	}

	public Design getDesign() {
		return design;
	}

	public void setDesign(Design design) {
		this.design = design;
	}

	public String getBom(){
		this.design = bomservice.getDesignById(request.getParameter("designId"));
		
		String procedure = design.getDesignTechProcedure();
		procedure = procedure.replaceAll(">", "&gt;");
		System.out.println(procedure);
		design.setDesignTechProcedure(procedure);
		if(design.getDesignPicURL().length()>12){
			design.setDesignPicURL("../images/1.png");
		}
		
		List materialMes = new ArrayList();
		
		Iterator<Bom> materialItr = design.getBoms().iterator();	
		while(materialItr.hasNext()){
			Bom bom = materialItr.next();
			Material material = bom.getMaterial();

			BomForMaterial bomTem = new BomForMaterial();
			bomTem.setColorCode(material.getColorCode());
			bomTem.setMaterialCode(material.getMaterialCode());
			bomTem.setMaterialName(material.getMaterialName());
			bomTem.setMaterialPosition(bom.getMaterialPosition());
			bomTem.setMaterialType(material.getMaterialType());
			bomTem.setUnitPrice(material.getUnitPrice());
			bomTem.setVolPerDesign(bom.getVolPerDesign());
			materialMes.add(bomTem);
			
			System.out.println(bom.getMaterial().getMaterialCode());
		}

		this.materialMes = materialMes;
		return SUCCESS;
	}

	private String materialCode="";
	private String volPerDesign="";
	private String materialPosition="";
	
	public String getMaterialCode() {
		return materialCode;
	}

	public String getVolPerDesign() {
		return volPerDesign;
	}

	public String getMaterialPosition() {
		return materialPosition;
	}

	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}

	public void setVolPerDesign(String volPerDesign) {
		this.volPerDesign = volPerDesign;
	}

	public void setMaterialPosition(String materialPosition) {
		this.materialPosition = materialPosition;
	}
	
	public String addBom(){
		Material m = materialservice.getMaterialByCode(materialCode);
		Design d = designservice.getByCode(designCode);
		float vol = Float.parseFloat(volPerDesign);
		
		Bom bom = new Bom(d,m,vol,materialPosition);
		
		bomservice.addBom(bom);
		return SUCCESS;
	}
	
	public String deleteBom(){
		Material m = materialservice.getMaterialByCode(materialCode);
		Design d = designservice.getByCode(designCode);
		
		bomservice.deleteBom(m, d);
		return SUCCESS;
	}
	
	public String showAddDesign(){		
		return SUCCESS;
	}
	
	public String addDesign(){
		Design design = new Design();
		
		String designCode = request.getParameter("designCode");
		String designName = request.getParameter("designName");
		String designProcessPrice = request.getParameter("designProcessPrice");
		String designTechProcedure = request.getParameter("designTechProcedure");
		String designPutawayDate = request.getParameter("designPutawayDate");
		String designColorDescription = request.getParameter("designColorDescription");
		String designsewninCode = request.getParameter("designsewninCode");
		String designMainLabelCode = request.getParameter("designMainLabelCode");
		String designHangTagCode = request.getParameter("designHangTagCode");
		String designType = request.getParameter("designType");
		String designFlagShipURL= request.getParameter("designFlagShipURL");
		String designComment = request.getParameter("designComment");
		
		DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		try {
			date = fmt.parse(designPutawayDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		design.setDesignCode(designCode);
		design.setDesignName(designName);
		design.setDesignProcessPrice(Float.parseFloat(designProcessPrice));
		design.setDesignTechProcedure(designTechProcedure);
		design.setDesignPutawayDate(date);
		design.setDesignColorDescription(designColorDescription);
		design.setDesignsewninCode(designsewninCode);
		design.setDesignMainLabelCode(designMainLabelCode);
		design.setDesignHangTagCode(designHangTagCode);
		design.setDesignType(designType);
		design.setDesignFlagShipURL(designFlagShipURL);
		design.setDesignComment(designComment);
		try {
			upload();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		design.setDesignPicURL(designPicURL);
		
		System.out.println(designPicURL);
		
		bomservice.addDesign(design);
		
		this.designCode="";
		return SUCCESS;
	}
	
	public String updateDesign(){
		
		return SUCCESS;
	}
	
	public String quitDesign(){
		String designId = request.getParameter("designId");
		bomservice.quitDesign(designId);
		return SUCCESS;
	}
	
	
	//==========================================================================
	
	private String materialName;
	
	private String materialListAjax;

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	
	
	public String getMaterialListAjax() {
		return materialListAjax;
	}

	public void setMaterialListAjax(String materialListAjax) {
		this.materialListAjax = materialListAjax;
	}
	
	public String getMaterialList(){
		System.out.println("enter bomManage getMaterialList");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put(MaterialConstants.SEARCH_MATERIAL_PARAMS[0], this.materialName);
		
		List<Material> materialList = materialservice.getMaterialList(params);

		JSONArray json = new JSONArray();
		for(Material material:materialList){
			JSONObject jo = new JSONObject();
			try {
				jo.put("materialCode",material.getMaterialCode());
				jo.put("materialName", material.getMaterialName());
				jo.put("materialType", material.getMaterialType());
				jo.put("materialIngredient",material.getMaterialIngredient());
				json.put(jo);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		setMaterialListAjax(json.toString());
		System.out.println(json.toString());
		return SUCCESS;
	}
	
	//==========================================================================
	private final static String UPLOADDIR = "/upload"; 
	private List<File> file;
	private List<String> fileFileName;
	private List<String> fileContentType;
	private String designPicURL = "";
	
	public List<File> getFile() {
	        return file;
	}
	public void setFile(List<File> file) {
	        this.file = file;
	}
	public List<String> getFileFileName() {
	        return fileFileName;
	}
	public void setFileFileName(List<String> fileFileName) {
	        this.fileFileName = fileFileName;
	}
	public List<String> getFileContentType() {
	        return fileContentType;
	}
	public void setFileContentType(List<String> fileContentType) {
	        this.fileContentType = fileContentType;
	}
	public String getDesignPicURL() {
		return designPicURL;
	}

	public void setDesignPicURL(String designPicURL) {
		this.designPicURL = designPicURL;
	}
	
	public String showUpload(){
		return SUCCESS;
	}
	public String upload() throws IOException{
		System.out.println(this.getFileFileName());  
        for (int i = 0; i < file.size(); i++) {   
            //循环上传每个文件   
            uploadFile(i);
        }
		return SUCCESS;
	}
    //执行上传功能   
    private void uploadFile(int i) throws FileNotFoundException, IOException {   
        try {   
            InputStream in = new FileInputStream(file.get(i));   
            String dir = ServletActionContext.getRequest().getRealPath(UPLOADDIR);
            
            File fileLocation = new File(dir);  
            //此处也可以在应用根目录手动建立目标上传目录  
            if(!fileLocation.exists()){  
                boolean isCreated  = fileLocation.mkdir();  
                if(!isCreated) {  
                    //目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。  
                    return;  
                }  
            }
            String fileName=this.getFileFileName().get(i);  
            File uploadFile = new File(dir, fileName);   
            
            setDesignPicURL(fileName);
            System.out.println(dir+"/"+fileName);
            
            OutputStream out = new FileOutputStream(uploadFile);   
            byte[] buffer = new byte[1024 * 1024];   
            int length;   
            while ((length = in.read(buffer)) > 0) {   
                out.write(buffer, 0, length);   
            }   
            in.close();   
            out.close();   
        } catch (FileNotFoundException ex) {   
            System.out.println("上传失败!");  
            ex.printStackTrace();   
        } catch (IOException ex) {   
            System.out.println("上传失败!");  
            ex.printStackTrace();   
        }   
    }   
}

