package productManage.vo.tailor;

public class TailorDetailVO {
	private int tailorID;
	private String startTime;
	private String finishTime;
	private int actualXS=-1;
	private int actualS=-1;
	private int actualM=-1;
	private int actualL=-1;
	private int actualXL=-1;
	private int actualXXL=-1;
	
	public TailorDetailVO(){}
	
	public TailorDetailVO(int tailorID,String startTime, String finishTime, int actualXS, int actualS, int actualM, int actualL,
			int actualXL, int actualXXL) {
		super();
		this.tailorID=tailorID;
		this.startTime = startTime;
		this.finishTime = finishTime;
		this.actualXS = actualXS;
		this.actualS = actualS;
		this.actualM = actualM;
		this.actualL = actualL;
		this.actualXL = actualXL;
		this.actualXXL = actualXXL;
	}
	
	public int getTailorID() {
		return tailorID;
	}

	public void setTailorID(int tailorID) {
		this.tailorID = tailorID;
	}

	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
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
	
}
