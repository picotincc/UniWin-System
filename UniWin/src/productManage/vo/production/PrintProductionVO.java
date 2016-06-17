package productManage.vo.production;

import java.util.List;

import org.springframework.stereotype.Component;

import productManage.model.yk.Orders;

@Component
public class PrintProductionVO {
	private ProductionVO productionVO;
	private List<OrderMaterialDetailVO> materialDetails;
	private String otherComment;
	/**
	 * 工艺要求
	 */
	private String techniqueComment;
	/**
	 * BOM录入确认情况
	 */
	private String BOMRegistered;
	public PrintProductionVO() {}
	
	public PrintProductionVO(ProductionVO productionVO, List<OrderMaterialDetailVO> materialDetails,
			String otherComment, String techniqueComment, String bOMRegistered) {
		super();
		this.productionVO = productionVO;
		this.materialDetails = materialDetails;
		this.otherComment = otherComment;
		this.techniqueComment = techniqueComment;
		BOMRegistered = bOMRegistered;
	}

	public ProductionVO getProductionVO() {
		return productionVO;
	}
	public void setProductionVO(ProductionVO productionVO) {
		this.productionVO = productionVO;
	}
	public List<OrderMaterialDetailVO> getMaterialDetails() {
		return materialDetails;
	}
	public void setMaterialDetails(List<OrderMaterialDetailVO> materialDetails) {
		this.materialDetails = materialDetails;
	}
	public String getOtherComment() {
		return otherComment;
	}
	public void setOtherComment(String otherComment) {
		this.otherComment = otherComment;
	}
	public String getTechniqueComment() {
		return techniqueComment;
	}
	public void setTechniqueComment(String techniqueComment) {
		this.techniqueComment = techniqueComment;
	}
	public String getBOMRegistered() {
		return BOMRegistered;
	}
	public void setBOMRegistered(String bOMRegistered) {
		BOMRegistered = bOMRegistered;
	}
	
}
