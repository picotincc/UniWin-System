package productManage.vo.production;

import org.springframework.stereotype.Component;

@Component
public class OrderDetailVO {
	private String color;
	private int XS;
	private int S;
	private int M;
	private int L;
	private int XL;
	private int XXL;
	private int total;
	private int actualXS;
	private int actualS;
	private int actualM;
	private int actualL;
	private int actualXL;
	private int actualXXL;
	private int actualTotal;
	public OrderDetailVO(){}
	
	public OrderDetailVO(String color, int xS, int s, int m, int l, int xL, int xXL, int total, int actualXS,
			int actualS, int actualM, int actualL, int actualXL, int actualXXL, int actualTotal) {
		super();
		this.color = color;
		XS = xS;
		S = s;
		M = m;
		L = l;
		XL = xL;
		XXL = xXL;
		this.total = total;
		this.actualXS = actualXS;
		this.actualS = actualS;
		this.actualM = actualM;
		this.actualL = actualL;
		this.actualXL = actualXL;
		this.actualXXL = actualXXL;
		this.actualTotal = actualTotal;
	}

	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getXS() {
		return XS;
	}
	public void setXS(int xS) {
		XS = xS;
	}
	public int getS() {
		return S;
	}
	public void setS(int s) {
		S = s;
	}
	public int getM() {
		return M;
	}
	public void setM(int m) {
		M = m;
	}
	public int getL() {
		return L;
	}
	public void setL(int l) {
		L = l;
	}
	public int getXL() {
		return XL;
	}
	public void setXL(int xL) {
		XL = xL;
	}
	public int getXXL() {
		return XXL;
	}
	public void setXXL(int xXL) {
		XXL = xXL;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getActualXS() {
		return actualXS;
	}
	public void setActualXS(int actualXS) {
		this.actualXS = actualXS;
	}
	public int getActualS() {
		return actualS;
	}
	public void setActualS(int actualS) {
		this.actualS = actualS;
	}
	public int getActualM() {
		return actualM;
	}
	public void setActualM(int actualM) {
		this.actualM = actualM;
	}
	public int getActualL() {
		return actualL;
	}
	public void setActualL(int actualL) {
		this.actualL = actualL;
	}
	public int getActualXL() {
		return actualXL;
	}
	public void setActualXL(int actualXL) {
		this.actualXL = actualXL;
	}
	public int getActualXXL() {
		return actualXXL;
	}
	public void setActualXXL(int actualXXL) {
		this.actualXXL = actualXXL;
	}
	public int getActualTotal() {
		return actualTotal;
	}
	public void setActualTotal(int actualTotal) {
		this.actualTotal = actualTotal;
	}
	
}
