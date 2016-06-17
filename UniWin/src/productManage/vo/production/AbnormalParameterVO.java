package productManage.vo.production;

import org.springframework.stereotype.Component;

/**
 * 异常积压订单参数
 * 
 * @author 克崽兽EX
 *
 */
@Component
public class AbnormalParameterVO {
	public static double DEFAULT_STANDARD_TIME=24.0;
	/**
	 * 积压环节名称
	 */
	private String paramName;
	private double standardTime=DEFAULT_STANDARD_TIME;
	/**
	 * 积压数量
	 */
	private int volume=0;

	public AbnormalParameterVO() {
	}

	public AbnormalParameterVO(String paramName,double standardTime){
		this.paramName=paramName;
		this.standardTime=standardTime;
	}
	public AbnormalParameterVO(String paramName, double standardTime, int volume) {
		super();
		this.paramName = paramName;
		this.standardTime = standardTime;
		this.volume = volume;
	}
	

	public String getParamName() {
		return paramName;
	}

	public void setParamName(String paramName) {
		this.paramName = paramName;
	}

	public double getStandardTime() {
		return standardTime;
	}

	public void setStandardTime(double standardTime) {
		this.standardTime = standardTime;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

}
