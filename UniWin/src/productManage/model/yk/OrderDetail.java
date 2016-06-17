package productManage.model.yk;
/**
 * @author yukuai
 * @date 创建时间2016-02-27
 */
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import productManage.model.zky.Production;
import productManage.model.zky.Tailor;

@Entity
@Table(name="orderdetail")                      //客户订单颜色表

public class OrderDetail {
	@Id                                         //编号
	private int orderDetailID;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = false)
	@JoinColumn(name = "orderID")               //客户订单
	private Orders order; 
	
	@Column(name="orderColor")                  //客户订单颜色
	private String orderColor;
	
	@Column(name="orderXS")                     //客户订单XS码
	private int orderXS;
	
	@Column(name="orderS")                      //客户订单S码
	private int orderS;
	
	@Column(name="orderM")                      //客户订单M码
	private int orderM;
	
	@Column(name="orderL")                      //客户订单L码
	private int orderL;
	
	@Column(name="orderXL")                     //客户订单XL码
	private int orderXL;
	
	@Column(name="orderXXL")                    //客户订单XXL码
	private int orderXXL;
	
	@OneToOne(mappedBy="orderDetail",targetEntity=Tailor.class)
	private Tailor tailor;
	
	@Transient
	private int totalNum;                       //合计件数
	
	public OrderDetail(){
		super();
	}
	
	public OrderDetail(int orderDetailID, Orders order, String orderColor,
			int orderXS, int orderS, int orderM, int orderL, int orderXL,
			int orderXXL, int totalNum) {
		super();
		this.orderDetailID = orderDetailID;
		this.order = order;
		this.orderColor = orderColor;
		this.orderXS = orderXS;
		this.orderS = orderS;
		this.orderM = orderM;
		this.orderL = orderL;
		this.orderXL = orderXL;
		this.orderXXL = orderXXL;
		this.totalNum = totalNum;
	}

	public int getOrderDetailID(){
		return orderDetailID;
	}
	
	public String getOrderColor(){
		return orderColor;
	}
	
	public int getOrderXS(){
		return orderXS;
	}
	
	public int getOrderS(){
		return orderS;
	}
	
	public int getOrderM(){
		return orderM;
	}
	
	public int getOrderL(){
		return orderL;
	}
	
	public int getOrderXL(){
		return orderXL;
	}
	
	public int getOrderXXL(){
		return orderXXL;
	}

	public void setOrderColor(String orderColor){
		this.orderColor = orderColor;
	}
	
	public void setOrderXS(int orderXS){
		this.orderXS = orderXS;
	}
	
	public void getOrderS(int orderS){
		this.orderS = orderS;
	}
	
	public void setOrderM(int orderM){
		this.orderM = orderM;
	}
	
	public void setOrderL(int orderL){
		this.orderL = orderL;
	}
	
	public void setOrderXL(int orderXL){
		this.orderXL = orderXL;
	}
	
	public void setOrderXXL(int orderXXL){
		this.orderXXL = orderXXL;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public int getTotalNum() {
		return orderXS+orderS+orderM+orderL+orderXL+orderXXL;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public void setOrderS(int orderS) {
		this.orderS = orderS;
	}

	public Tailor getTailor() {
		return tailor;
	}

	public void setTailor(Tailor tailor) {
		this.tailor = tailor;
	}
	
}
