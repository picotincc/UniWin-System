package productManage.vo.listManage;

import java.util.Iterator;
import java.util.Set;

import productManage.model.cs.OutSource;
import productManage.model.yk.Orders;

public class OutSourceVO {//开始排单中外发单信息
	private int outsourceID;                            //外发单id
	private String outsourceCode;                       //外发单编号
	private String orderPriority;                       //订单优先级
	private String designTechProcedure;					//工序
	private String designCode;							//款号
	private String designName;							//款式名称
	private String designPicURL;						//图片
	private String finishDate;                          //外发交期
	private String manageState;                         //排单状态 （未排单）
	
	public OutSourceVO(){
		
	}
	
	public OutSourceVO(OutSource outsource){
		outsourceID = outsource.getOutsourceID();
		outsourceCode = outsource.getOutsourceCode();
		if(getOrders(outsource) == null){
			this.orderPriority = "暂缺";
		}
		else{
		this.orderPriority = getOrders(outsource).getOrderPriority();
		}
		designTechProcedure = outsource.getDesign().getDesignTechProcedure();
		designCode = outsource.getDesign().getDesignCode();
		designName = outsource.getDesign().getDesignName();
		designPicURL = outsource.getDesign().getDesignPicURL();
		if(outsource.getReferenceOutDate() != null){
		finishDate = outsource.getReferenceOutDate().toString();
		}
		manageState = outsource.getProduction().getProductionState();
	}
	
	//获取优先级
	public Orders getOrders(OutSource outsource){
		Set<Orders> orders = outsource.getProduction().getOrders();
		Iterator<Orders> it = orders.iterator();
		while(it.hasNext()){
			return it.next();
		}
		return null;
	}
	
	public String getDesignTechProcedure() {
		return designTechProcedure;
	}

	public void setDesignTechProcedure(String designTechProcedure) {
		this.designTechProcedure = designTechProcedure;
	}
	
	public int getOutsourceID() {
		return outsourceID;
	}
	public void setOutsourceID(int outsourceID) {
		this.outsourceID = outsourceID;
	}
	public String getOutsourceCode() {
		return outsourceCode;
	}
	public void setOutsourceCode(String outsourceCode) {
		this.outsourceCode = outsourceCode;
	}
	public String getOrderPriority() {
		return orderPriority;
	}
	public void setOrderPriority(String orderPriority) {
		this.orderPriority = orderPriority;
	}
	public String getDesignCode() {
		return designCode;
	}
	public void setDesignCode(String designCode) {
		this.designCode = designCode;
	}
	public String getDesignName() {
		return designName;
	}
	public void setDesignName(String designName) {
		this.designName = designName;
	}
	public String getDesignPicURL() {
		return designPicURL;
	}
	public void setDesignPicURL(String designPicURL) {
		this.designPicURL = designPicURL;
	}
	public String getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}
	public String getManageState() {
		return manageState;
	}
	public void setManageState(String manageState) {
		this.manageState = manageState;
	}

	
	
}
