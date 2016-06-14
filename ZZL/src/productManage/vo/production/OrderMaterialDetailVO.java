package productManage.vo.production;

import org.springframework.stereotype.Component;

import productManage.model.lhj.Material;
import productManage.model.lhj.Vendor;
import productManage.model.yk.OrderMaterialDetail;

@Component
public class OrderMaterialDetailVO {
	private String orderMaterialAttr;
	private String materialName;
	private String materialType;
	private String orderColorNum;
	private String vendorName;
	private String area;
	private String vendorPhone;
	private int orderVol;
	private String orderComment;
	public OrderMaterialDetailVO(){}
	
	public OrderMaterialDetailVO(String orderMaterialAttr, String materialName, String materialType,
			String orderColorNum, String vendorName, String area, String vendorPhone, int orderVol,
			String orderComment) {
		super();
		this.orderMaterialAttr = orderMaterialAttr;
		this.materialName = materialName;
		this.materialType = materialType;
		this.orderColorNum = orderColorNum;
		this.vendorName = vendorName;
		this.area = area;
		this.vendorPhone = vendorPhone;
		this.orderVol = orderVol;
		this.orderComment = orderComment;
	}
	
	public OrderMaterialDetailVO(OrderMaterialDetail detail,Material material,Vendor vendor){
		String empty="暂无";
		this.orderMaterialAttr = empty;
		this.materialName = empty;
		this.materialType = empty;
		this.orderColorNum = empty;
		this.vendorName = empty;
		this.area = empty;
		this.vendorPhone = empty;
		this.orderVol = 0;
		this.orderComment = empty;
		if(detail!=null){
			this.orderMaterialAttr=detail.getOrderMaterialAttr();
			this.orderVol=detail.getOrderVol();
			this.orderComment=detail.getOrderComment();
		}
		if(material!=null){
			this.materialName=material.getMaterialName();
			this.materialType=material.getMaterialType();
			this.orderColorNum=material.getColorCode();
		}
		if(vendor!=null){
			this.vendorName=vendor.getVendorName();
			this.vendorPhone=vendor.getVendorPhoneNum();
//			this.area=vendor.getVendorArea();
		}
		
	}

	public String getOrderMaterialAttr() {
		return orderMaterialAttr;
	}
	public void setOrderMaterialAttr(String orderMaterialAttr) {
		this.orderMaterialAttr = orderMaterialAttr;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public String getMaterialType() {
		return materialType;
	}
	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}
	public String getOrderColorNum() {
		return orderColorNum;
	}
	public void setOrderColorNum(String orderColorNum) {
		this.orderColorNum = orderColorNum;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getVendorPhone() {
		return vendorPhone;
	}
	public void setVendorPhone(String vendorPhone) {
		this.vendorPhone = vendorPhone;
	}
	public int getOrderVol() {
		return orderVol;
	}
	public void setOrderVol(int orderVol) {
		this.orderVol = orderVol;
	}
	public String getOrderComment() {
		return orderComment;
	}
	public void setOrderComment(String orderComment) {
		this.orderComment = orderComment;
	}
	
}
