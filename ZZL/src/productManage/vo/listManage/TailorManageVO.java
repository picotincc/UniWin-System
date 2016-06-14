package productManage.vo.listManage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;

import productManage.model.cs.OutSource;
import productManage.model.tyc.Purchase;
import productManage.model.yk.Orders;
import productManage.model.zky.Tailor;

public class TailorManageVO {

	private int outsourceID;                            //外发单id
	private String outsourceCode;                       //外发单编号
	private String orderPriority;                       //订单优先级
	private String designTechProcedure_finished;					//工序已完成
	private String designTechProcedure_unfinished;                    //工序未完成
	private String designCode;							//款号
	private String designName;							//款式名称
	private String designPicURL;						//图片
	private String source;                              //来源
	private String referenceOutDate;                      //预约外发时间 = 参考外发时间
	private String tailorModelName;                      //排版员工                    ------------  问题：一个生产单对应多个裁剪单？？？  ----------------
	private String tailorTailorName;                     //裁减员工
	private String isInWarehouse;                       //面料进度
	private String tailorStartingTime;                  //裁剪开始时间
	public TailorManageVO(){
		
	}
	public TailorManageVO(OutSource outsource){
		outsourceID = outsource.getOutsourceID();
		outsourceCode = outsource.getOutsourceCode();
		if(getOrders(outsource) == null){
			orderPriority = "暂缺";
		}
		else{
		orderPriority = getOrders(outsource).getOrderPriority();
		}
		setProcedure(outsource.getDesign().getDesignTechProcedure());
		designCode = outsource.getDesign().getDesignCode();
		designName = outsource.getDesign().getDesignName();
		designPicURL = outsource.getDesign().getDesignPicURL();
		source = getSources(outsource);
		if(outsource.getReferenceOutDate()!=null){
		referenceOutDate = outsource.getReferenceOutDate().toString();
		}
		if(getTailor(outsource) == null ){
			tailorTailorName = "无";
		}
		else{
		if( getTailor(outsource).getTailor()!=null){
		tailorTailorName = getTailor(outsource).getTailor().getUserName();
		}
		else{
			tailorTailorName = "无";
		}
		}
		if(getTailor(outsource) == null){
			tailorModelName = "无";
		}
		else{
		if(getTailor(outsource).getTailormodelmaker()!=null){
		tailorModelName = getTailor(outsource).getTailormodelmaker().getUserName();
		}
		else{
			tailorModelName = "无";
		}
		}
		isInWarehouse = setClothState(outsource);
		if(getTailor(outsource).getTailorStartingTime() != null){
			tailorStartingTime = getTailor(outsource).getTailorStartingTime().toString();
		}
	}
	
	public Tailor getTailor(OutSource outsource){
		Set<Tailor> set = outsource.getProduction().getTailors();
		Iterator<Tailor> it = set.iterator();
		while(it.hasNext()){
			return it.next();
		}
		return null;
	}
	
	//工序分割
		public void setProcedure(String procedure){
			String state = "裁剪";
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
	
	//面料进度
	public String setClothState(OutSource outsource){
		int isOK = 0;   //面料进度状态  1表示部分到货，2表示已到货，0表示未到货
		Set<Purchase> purchaseList = outsource.getProduction().getPurchase();
		Iterator<Purchase> it = purchaseList.iterator();
		while(it.hasNext()){
			if(it.next().getPurchaseState().equals("采购完成（自有）")){
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
	
	//获取优先级
		public Orders getOrders(OutSource outsource){
			Set<Orders> orders = outsource.getProduction().getOrders();
			Iterator<Orders> it = orders.iterator();
			while(it.hasNext()){
				return it.next();
			}
			return null;
		}
	//获取来源
		public String getSources(OutSource outsource){
			StringBuffer sources = new StringBuffer();
			Set<Orders> orders = outsource.getProduction().getOrders();
			Iterator<Orders> it = orders.iterator();
			while(it.hasNext()){
				sources.append(it.next().getCustomer().getCustomerBrandName()+"\n");
			}
			return sources.toString();
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
		public String getSource() {
			return source;
		}
		public void setSource(String source) {
			this.source = source;
		}
		public String getReferenceOutDate() {
			return referenceOutDate;
		}
		public void setReferenceOutDate(String referenceOutDate) {
			this.referenceOutDate = referenceOutDate;
		}
		public String getTailorModelName() {
			return tailorModelName;
		}
		public void setTailorModelName(String tailorModelName) {
			this.tailorModelName = tailorModelName;
		}
		public String getTailorTailorName() {
			return tailorTailorName;
		}
		public void setTailorTailorName(String tailorTailorName) {
			this.tailorTailorName = tailorTailorName;
		}
		public String getIsInWarehouse() {
			return isInWarehouse;
		}
		public void setIsInWarehouse(String isInWarehouse) {
			this.isInWarehouse = isInWarehouse;
		}
		public String getTailorStartingTime() {
			return tailorStartingTime;
		}
		public void setTailorStartingTime(String tailorStartingTime) {
			this.tailorStartingTime = tailorStartingTime;
		}
	
}
