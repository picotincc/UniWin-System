package productManage.model.yk;
/**
 * @author yukuai
 * @date 创建时间2016-02-27
 */
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import productManage.model.lhj.Supply;

@Entity
@Table(name="ordermaterialdetail")              //客户订单物料详情表

public class OrderMaterialDetail {
	@Id                                         //编号
	private int orderMaterialID;
	
	@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH}, optional = false)
	@JoinColumn(name = "orderID")               //客户订单
	private Orders order; 
	
	@OneToOne(targetEntity=Supply.class)
	@JoinColumn(name="supplyID",referencedColumnName="supplyId",unique=true)
	private Supply supply;                      //供应表
	
	
	@Column(name="orderMaterialAttr")           //物料属性
	private String orderMaterialAttr;
	
	@Column(name="orderVol")                    //订购数量
	private int orderVol;
	
	@Column(name="orderComment")                //备注说明
	private String orderComment;
	
	public OrderMaterialDetail(){
		super();
	}
	
	public OrderMaterialDetail(int orderMaterialID, Orders order,
			Supply supply, String orderMaterialAttr, int orderVol,
			String orderComment) {
		super();
		this.orderMaterialID = orderMaterialID;
		this.order = order;
		this.supply = supply;
		this.orderMaterialAttr = orderMaterialAttr;
		this.orderVol = orderVol;
		this.orderComment = orderComment;
	}

	public int getOrderMaterialID(){
		return orderMaterialID;
	}
	
	public String getOrderMaterialAttr(){
		return orderMaterialAttr;
	}
	
	public int getOrderVol(){
		return orderVol;
	}
	
	public String getOrderComment(){
		return orderComment;
	}

	public void setOrderMaterialAttr(String orderMaterialAttr){
		this.orderMaterialAttr = orderMaterialAttr;
	}
	
	public void setOrderVol(int orderVol){
		this.orderVol = orderVol;
	}
	
	public void setOrderComment(String orderComment){
		this.orderComment = orderComment;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public Supply getSupply() {
		return supply;
	}

	public void setSupply(Supply supply) {
		this.supply = supply;
	}
	
}
