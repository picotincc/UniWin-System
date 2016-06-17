package productManage.action.production;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import productManage.action.PageAction;
import productManage.service.production.ProductionService;
import productManage.vo.PageBean;
import productManage.vo.production.AbnormalParameterVO;
import productManage.vo.production.PrintProductionVO;
import productManage.vo.production.ProductionConstants;
import productManage.vo.production.ProductionVO;

@Controller
public class ProductionAction extends PageAction {
	@Autowired
	private ProductionService productionService;

	private String designCode;
	private String customerBrand;
	private String customerRepresentative;
	private String accessoryState;
	private String productionPriority;
	private String orderDate;
	/**
	 * 排单状态
	 */
	private String productionState;
	private String designNewOld;
	////////////////////////////////////
	private ProductionVO productionVO;
	private String productionCode;
	///////////////////////////////////
	private List<AbnormalParameterVO> abnormalParams;
	///////////////////////////////////
	private PrintProductionVO printVO;

	@Override
	public String queryPage() throws Exception {
		if (request.getSession().getAttribute("account") != null) {
			this.designCode = null;
			this.customerBrand = null;
			this.customerRepresentative = null;
			this.productionPriority = null;
			this.orderDate = null;
			this.productionState = null;
			this.designNewOld = null;
			this.accessoryState = null;
			return queryPageWithParams();
		} else {
			return "failed";
		}
	}

	public String queryPageWithParams() throws Exception {
		if (request.getSession().getAttribute("account") != null) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(ProductionConstants.SEARCH_PRODUCTION_PARAMS[0], this.designCode);
			params.put(ProductionConstants.SEARCH_PRODUCTION_PARAMS[1], this.customerBrand);
			params.put(ProductionConstants.SEARCH_PRODUCTION_PARAMS[2], this.customerRepresentative);
			params.put(ProductionConstants.SEARCH_PRODUCTION_PARAMS[3], this.productionPriority);
			params.put(ProductionConstants.SEARCH_PRODUCTION_PARAMS[4], this.orderDate);
			params.put(ProductionConstants.SEARCH_PRODUCTION_PARAMS[5], this.productionState);
			params.put(ProductionConstants.SEARCH_PRODUCTION_PARAMS[6], this.designNewOld);
			params.put(ProductionConstants.SEARCH_PRODUCTION_PARAMS[7], this.accessoryState);
			try {
				this.pageBean = productionService.queryProductions(this.rowsPerPage, this.page, params);
			} catch (Exception e) {
				e.printStackTrace();
				this.pageBean = new PageBean();
				return ERROR;
			}
			return SUCCESS;
		} else {
			return "failed";
		}
	}

	public String queryProduction() {
		if (request.getSession().getAttribute("account") != null) {
			try {
				this.productionVO = productionService.queryProduction(this.productionCode);
			} catch (Exception e) {
				e.printStackTrace();
				return ERROR;
			}
			return SUCCESS;
		} else {
			return "failed";
		}
	}

	public String modifyPriority() {
		if (request.getSession().getAttribute("account") != null) {
			ProductionVO vo = new ProductionVO();
			vo.setProductionCode(this.productionVO.getProductionCode());
			vo.setProductionPriority(this.getProductionPriority());
			try {
				if (!productionService.modifyProduction(vo).equals("SUCCESS")) {
					return ERROR;
				}
			} catch (Exception e) {
				e.printStackTrace();
				return ERROR;
			}
			return this.queryProduction();
		} else {
			return "failed";
		}
	}

	public String queryAbnormal() {
		if (request.getSession().getAttribute("account") != null) {
			try {
				this.abnormalParams = productionService.queryAbnormalOrders();
			} catch (Exception e) {
				e.printStackTrace();
				return ERROR;
			}
			return SUCCESS;
		} else {
			return "failed";
		}
	}

	public String printProduction() {
		if (request.getSession().getAttribute("account") != null) {
			try {
				this.printVO = productionService.printProduction(this.productionCode);
			} catch (Exception e) {
				e.printStackTrace();
				return ERROR;
			}
			return SUCCESS;
		} else {
			return "failed";
		}
	}

	/**
	 * 判断输入是否在有效数组中
	 * 
	 * @param input
	 * @param validStrings
	 * @return 若有效：返回原输出；若无效：返回空字符串
	 */
	private String isValid(String input, String[] validStrings) {
		Boolean isValid = false;
		for (String temp : validStrings) {
			if (temp.equals(input)) {
				isValid = true;
				break;
			}
		}
		if (!isValid) {
			input = "";
		}
		return input;
	}

	public String getDesignCode() {
		return designCode;
	}

	public void setDesignCode(String designCode) {
		this.designCode = designCode;
		this.page = 1;// 若查询条件发生变化，从第一页开始
	}

	public String getCustomerBrand() {
		return customerBrand;
	}

	public void setCustomerBrand(String customerBrand) {
		this.customerBrand = customerBrand;
		this.page = 1;// 若查询条件发生变化，从第一页开始
	}

	public String getCustomerRepresentative() {
		return customerRepresentative;
	}

	public void setCustomerRepresentative(String customerRepresentative) {
		this.customerRepresentative = customerRepresentative;
		this.page = 1;// 若查询条件发生变化，从第一页开始
	}

	public String getProductionPriority() {
		return productionPriority;
	}

	public void setProductionPriority(String productionPriority) {
		this.productionPriority = this.isValid(productionPriority, ProductionConstants.PRODUCTION_PRIORITY);
		this.page = 1;// 若查询条件发生变化，从第一页开始
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
		this.page = 1;// 若查询条件发生变化，从第一页开始
	}

	public String getProductionState() {
		return productionState;
	}

	public void setProductionState(String productionState) {
		this.productionState = this.isValid(productionState, ProductionConstants.PRODUCTION_STATE);
		this.page = 1;// 若查询条件发生变化，从第一页开始
	}

	public String getDesignNewOld() {
		return designNewOld;
	}

	public void setDesignNewOld(String designNewOld) {
		this.designNewOld = this.isValid(designNewOld, ProductionConstants.DESIGN_NEW_OLD);
		this.page = 1;// 若查询条件发生变化，从第一页开始
	}

	public String getAccessoryState() {
		return accessoryState;
	}

	public void setAccessoryState(String accessoryState) {
		this.accessoryState = this.isValid(accessoryState, ProductionConstants.ACCESSORY_STATE);
		this.page = 1;// 若查询条件发生变化，从第一页开始
	}

	public ProductionVO getProductionVO() {
		return productionVO;
	}

	public void setProductionVO(ProductionVO productionVO) {
		this.productionVO = productionVO;
	}

	public String getProductionCode() {
		return productionCode;
	}

	public void setProductionCode(String productionCode) {
		this.productionCode = productionCode;
	}

	public List<AbnormalParameterVO> getAbnormalParams() {
		return abnormalParams;
	}

	public void setAbnormalParams(List<AbnormalParameterVO> abnormalParams) {
		this.abnormalParams = abnormalParams;
	}

	public PrintProductionVO getPrintVO() {
		return printVO;
	}

	public void setPrintVO(PrintProductionVO printVO) {
		this.printVO = printVO;
	}

}
