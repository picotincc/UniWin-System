package productManage.vo.listManage;

import java.util.Iterator;
import java.util.Set;

import org.springframework.stereotype.Component;

import productManage.model.cs.OutSource;
import productManage.model.tyc.Purchase;
import productManage.model.yk.Orders;

@Component
public class TechniquePhaseVO {
	//暂时默认采购单完成状态为 ：完成
	
	private int outsourceID;                            //外发单id
	private String outsourceCode;                       //外发单编号
	private String orderPriority;                       //订单优先级
	private String designTechProcedure_finished;					//工序已完成
	private String designTechProcedure_unfinished;                  //工序未完成
	private String designCode;							//款号
	private String designName;							//款式名称
	private String designPicURL;						//图片
	private String techCode;                                 //款式工艺单编号
	private String finishDate;                          //外发交期
	private String isInWarehouse;                       //面料进度
	private String techPhaseStartingTime;               //工艺开始时间        ----------    未完成       ----------------
	private String userName;                            //工艺负责人
	
	public TechniquePhaseVO(){
		
	}
	
	public TechniquePhaseVO(OutSource outsource){
		outsourceID = outsource.getOutsourceID();
		outsourceCode = outsource.getOutsourceCode();
		if(getOrders(outsource) == null){
			orderPriority = "暂无";
		}
		else{
		orderPriority = getOrders(outsource).getOrderPriority();
		}
		setProcedure(outsource.getDesign().getDesignTechProcedure());
		designCode = outsource.getDesign().getDesignCode();
		designName = outsource.getDesign().getDesignName();
		designPicURL = outsource.getDesign().getDesignPicURL();
		techCode = outsource.getDesign().getTechnique().getTechCode();
		finishDate = outsource.getFinishDate().toString();
		//面料进度
		isInWarehouse = setClothState(outsource);
		if(outsource.getTechniquePhase() != null){
			if(outsource.getTechniquePhase().getTechPhaseStartingTime() == null){
				techPhaseStartingTime = null;
			}
			else{
		        techPhaseStartingTime = outsource.getTechniquePhase().getTechPhaseStartingTime().toString();
			}
		}
		userName = outsource.getDesign().getTechnique().getUser().getUserName();
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
	
	//工序分割
	public void setProcedure(String procedure){
		String state = "工艺";
		int a = procedure.indexOf(state);
		if(a>=0){
			designTechProcedure_finished = procedure.substring(0,a+state.length());
			designTechProcedure_unfinished = procedure.substring(a+state.length(),procedure.length());
		}
		else{
			designTechProcedure_finished = "";
			designTechProcedure_unfinished="";
		}
	}
	
	public String setClothState(OutSource outsource){
	int isOK = 0;   //面料进度状态  1表示部分到货，2表示已到货，0表示未到货
	Set<Purchase> purchaseList = outsource.getProduction().getPurchase();
	Iterator<Purchase> it = purchaseList.iterator();
	while(it.hasNext()){
		if(it.next().getPurchaseState().equals("完成")){
			isOK=1;
		}
		else if(isOK == 1){
			return "部分到货";
		}
	}
	if(isOK == 0){
		return "未到货";
	}
	else{
		return "已到货";
	}
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


	public String getDesignTechProcedure_finished() {
		return designTechProcedure_finished;
	}

	public void setDesignTechProcedure_finished(String designTechProcedure_finished) {
		this.designTechProcedure_finished = designTechProcedure_finished;
	}

	public String getDesignTechProcedure_unfinished() {
		return designTechProcedure_unfinished;
	}

	public void setDesignTechProcedure_unfinished(String designTechProcedure_unfinished) {
		this.designTechProcedure_unfinished = designTechProcedure_unfinished;
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

	public String getTechCode() {
		return techCode;
	}

	public void setTechCode(String techCode) {
		this.techCode = techCode;
	}

	public String getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	public String getIsInWarehouse() {
		return isInWarehouse;
	}

	public void setIsInWarehouse(String isInWarehouse) {
		this.isInWarehouse = isInWarehouse;
	}

	public String getTechPhaseStartingTime() {
		return techPhaseStartingTime;
	}

	public void setTechPhaseStartingTime(String techPhaseStartingTime) {
		this.techPhaseStartingTime = techPhaseStartingTime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
