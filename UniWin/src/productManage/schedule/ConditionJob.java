package productManage.schedule;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import productManage.service.conditionSheets.ConditionService;

public class ConditionJob extends QuartzJobBean {
	
	//判断作业是否执行的旗标
	private boolean isRunning = false;
	//该作业类所依赖的业务逻辑组件
	private ConditionService conditionService;
	public void setConditionService(ConditionService conditionService){
		this.conditionService = conditionService;
	}
	public ConditionService getConditionService(){
		return conditionService;
	}
	
	//定义任务执行体
	public void executeInternal(JobExecutionContext ctx) throws JobExecutionException{
		if(!isRunning){
			isRunning = true;
			//调用业务逻辑方法
			conditionService.autoCondition();
			isRunning = false;
		}
	}

}
