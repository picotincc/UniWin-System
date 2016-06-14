package productManage.vo.listManage;

import java.util.Date;
import java.util.Iterator;
import java.util.Set;

import org.springframework.stereotype.Component;

import productManage.model.cs.OutSource;
import productManage.model.yk.Orders;

@Component
public class OutSourceManageVO {
private int outsourceID;                            //外发单id
private String outsourceCode;                       //外发单编号
private String orderPriority;                       //订单优先级
private String designTechProcedure_finished;					//工序
private String designTechProcedure_unfinished;	
private String designCode;							//款号
private String designName;							//款式名称
private String designPicURL;						//图片
private String actualOutDate;                         //实际外发时间
private String referenceOutDate;                      //参考外发时间
private String outState;                            //外发状态
private String userName;                              //外发负责人

public OutSourceManageVO(){
	
}

public OutSourceManageVO(OutSource outsource){
	//通过外发单生成vo
	outsourceID = outsource.getOutsourceID();
	outsourceCode = outsource.getOutsourceCode();
	this.orderPriority = getOrderPriority(outsource);
	setProcedure(outsource.getDesign().getDesignTechProcedure());
	designCode = outsource.getDesign().getDesignCode();
	designName = outsource.getDesign().getDesignName();
	designPicURL = outsource.getDesign().getDesignPicURL();
	actualOutDate = outsource.getActualOutDate().toString();
	referenceOutDate = outsource.getReferenceOutDate().toString();
	outState = outsource.getOutsourceState();
	userName = outsource.getUser().getUserName();
}


//工序分割
public void setProcedure(String procedure){
	String state = "外发";
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

//获取优先级     (获取最高)   第一时间  普通
public String getOrderPriority(OutSource outsource){
	Set<Orders> orders = outsource.getProduction().getOrders();
	Iterator<Orders> it = orders.iterator();
	while(it.hasNext()){
		if((it.next().getOrderPriority()).equals("第一时间")){
			return "第一时间";
		};
	}
	return "普通";
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
public String getActualOutDate() {
	return actualOutDate;
}
public void setActualOutDate(String actualOutDate) {
	this.actualOutDate = actualOutDate;
}
public String getReferenceOutDate() {
	return referenceOutDate;
}
public void setReferenceOutDate(String referenceOutDate) {
	this.referenceOutDate = referenceOutDate;
}
public String getOutState() {
	return outState;
}
public void setOutState(String outState) {
	this.outState = outState;
}

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

}
