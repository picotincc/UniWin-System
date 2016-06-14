package productManage.service.impl;

import org.springframework.stereotype.Service;

import productManage.service.ProgressService;
@Service
public class ProgressServiceImp implements ProgressService{

	@Override
	public String inquiryProgressHql(String path,String inquiryProgress) {
		// TODO Auto-generated method stub
		//orders.inquiry.
		String hqlCondition = "";
		switch (inquiryProgress) {
			case "无":
				hqlCondition += " "+path+".shellOKTime is null";
				break;
			case "面料OK":
				hqlCondition += " "+path+".shellOKTime is not null and "+path+".accOKTime is null";
				break;
			case "辅料OK":
				hqlCondition += " "+path+".accOKTime is not null and "+path+".flowerOKTime is null";
				break;
			case "花型OK":
				hqlCondition += " "+path+".flowerOKTime is not null and "+path+".modelOKTime is null";
				break;
			case "版型OK":
				hqlCondition += " "+path+".modelOKTime is not null and "+path+".processOKTime is null";
				break;
			case "加工OK":
				hqlCondition += " "+path+".processOKTime is not null";
				break;
			default:
				break;
		}
		return hqlCondition;
	}

	@Override
	public String sampleOrderProgressHql(String path,String sampleOrderProgress) {
		// TODO Auto-generated method stub
		// orders.sampleOrders.sampleProcedure.
		String hqlCondition = "";
		switch (sampleOrderProgress) {
			case "无":
				hqlCondition += " "+path+".sampleProModelTime is null";
				break;
			case "待制版":
				hqlCondition += " "+path+".sampleProModelTime is not null and "+path+".sampleProMakeTime is null";
				break;
			case "待制作样衣":
				hqlCondition += " "+path+".sampleProMakeTime is not null and "+path+".sampleProConfirmTime is null";
				break;
			case "待确认样衣":
				hqlCondition += " "+path+".sampleProConfirmTime is not null and "+path+".sampleProGradingTime is null";
				break;
			case "待放码":
				hqlCondition += " "+path+".sampleProGradingTime is not null and "+path+".sampleProExamineTime is null";
				break;
			case "待审版":
				hqlCondition += " "+path+".sampleProExamineTime is not null and "+path+".sampleProFinishTime is null";
				break;
			case "完结":
				hqlCondition += " "+path+".sampleProFinishTime is not null";
				break;
			default:
				break;
		}
		return hqlCondition;
	}

	@Override
	public String productionProgressHql(String path,String productionProgress) {
		// TODO Auto-generated method stub
		return null;
	}

}
