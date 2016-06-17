package productManage.service.conditionSheets.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.BaseDao;
import productManage.model.tms.Technique;
import productManage.model.tyc.Purchase;
import productManage.model.wy.AbnormalParameter;
import productManage.model.yrd.ModelCondition;
import productManage.model.yrd.PhaseCondition;
import productManage.model.yrd.TechniqueCondition;
import productManage.model.zky.Production;
import productManage.service.conditionSheets.ConditionService;
import productManage.service.conditionSheets.ModelConditionService;
import productManage.service.conditionSheets.PhaseConditionService;
import productManage.service.conditionSheets.TechniqueConditionService;
import productManage.vo.production.AbnormalParameterVO;
import productManage.vo.production.ProductionConstants;

@Service
public class ConditionServiceImpl implements ConditionService{
	
	@Autowired
	BaseDao baseDao;
	@Autowired
	private TechniqueConditionService techniqueConditionService;
	@Autowired
	private ModelConditionService modelConditionService;
	@Autowired
	private PhaseConditionService phaseConditionService;
	
	@Override
	public void autoCondition(){
		//获取当前日期
		Date now = new Date();
		Date currentTime = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy-mm-dd");
		String currentDate = dateFormat.format(now);
		try{
			currentTime = dateFormat.parse(dateFormat.format(new Date()));                   //Date类型的日期
		}catch(ParseException e){
			e.printStackTrace();
		}
		
		//工艺单积压
		int countOfTechnique = 0; 
		List technique = baseDao.getAllList(Technique.class);
		for(Object t : technique){
			if(((Technique) t).getTechDate().getTime() >= 24 * 3600000){
				countOfTechnique++;
			}
		}
		//将结果写入工艺单积压表中
		TechniqueCondition techniqueCondition = new TechniqueCondition();
		techniqueCondition.setTechConditionDate(currentTime);
		techniqueCondition.setTechConditionVol(countOfTechnique);
		techniqueConditionService.addTechniqueCondition(techniqueCondition);
		
		//制版单积压
		int countOfModel = 0;
//		List technique = baseDao.getAllList(Technique.class);
		for(Object t : technique){
			if(((Technique) t).getTechModelFinish()== 0 && (new Date().getTime()           //TechModelFinish标识制版状态（0,1）
					- ((Technique) t).getTechDate().getTime() >= 24 * 3600000)){
				countOfModel++;
			}			
		}
		//将结果写入制版单积压表中
		ModelCondition modelCondition = new ModelCondition();
		modelCondition.setModelConditionDate(currentTime);
		modelCondition.setModelConditionVol(countOfModel);
		modelConditionService.addModelCondition(modelCondition);
		
		//各环节订单积压情况
		List purchases = baseDao.getAllList(Purchase.class);
		List<Purchase> shellPurchases = new ArrayList<Purchase>();
		//找到面料采购单
		for(Object p : purchases){
			if(((Purchase) p).getPurchaseType().equals(ProductionConstants.PURCHASE_TYPE[0])){
				shellPurchases.add((Purchase) p);                                                
			}
		}
		ArrayList<AbnormalParameterVO> results = new ArrayList<AbnormalParameterVO>();
		for(String abState : ProductionConstants.ABNORMAL_STATES){
			AbnormalParameterVO temp = new AbnormalParameterVO();
			temp.setParamName(abState);
			results.add(temp);
		}
		List abParams = baseDao.getAllList(AbnormalParameter.class);
		// 根据数据库中各异常参数标准时间建立results表
		for(AbnormalParameterVO vo : results){
			for(Object abParam : abParams){
				if(vo.getParamName().equals(((AbnormalParameter)abParam).getAbParaName()) ){
					vo.setStandardTime(((AbnormalParameter) abParam).getAbParaValue());
					break;
				}
			}
		}
		// 根据不同的阶段，为每个异常参数项计算总单数；注意其中的case需与productionconstants中对应
		for(AbnormalParameterVO abvo : results){
			int count = 0;                        //积压数量
			switch(abvo.getParamName()){
			case "计划采购——电话订购":				
				count = 0;
				for(Purchase p : shellPurchases){
					if(p.getPurchaseState().equals("待电话订购")&&(new Date().getTime()
							- p.getScheduledPurchaseDate().getTime() >= abvo.getStandardTime() * 3600000)){
						count++;
					}
				}
				//将结果写入环节积压表中
				PhaseCondition phaseCondition = new PhaseCondition();
				phaseCondition.setPhaseName("计划采购——电话订购");
				phaseCondition.setPhasesConditionDate(currentTime);
				phaseCondition.setPhasesConditionVol(count);
				phaseConditionService.addPhaseCondition(phaseCondition);
				break;
			case "电话订购——传码单":
				count = 0;
				for(Purchase p : shellPurchases){
					if(p.getPurchaseState().equals("待传码单")&&(new Date().getTime()
							- p.getPhoneOrderTime().getTime() >= abvo.getStandardTime() * 3600000)){
						count++;
					}
				}
				//将结果写入环节积压表中
				PhaseCondition phaseCondition2 = new PhaseCondition();
				phaseCondition2.setPhaseName("电话订购——传码单");
				phaseCondition2.setPhasesConditionDate(currentTime);
				phaseCondition2.setPhasesConditionVol(count);
				phaseConditionService.addPhaseCondition(phaseCondition2);
				break;
			case "传码单——财务付款":
				count = 0;
				for(Purchase p : shellPurchases){
					if(p.getPurchaseState().equals("待财务对账")&&(new Date().getTime()
							- p.getFaxTime().getTime() >= abvo.getStandardTime() * 3600000)){
						count++;
					}
				}
				//将结果写入环节积压表中
				PhaseCondition phaseCondition3 = new PhaseCondition();
				phaseCondition3.setPhaseName("传码单——财务付款");
				phaseCondition3.setPhasesConditionDate(currentTime);
				phaseCondition3.setPhasesConditionVol(count);
				phaseConditionService.addPhaseCondition(phaseCondition3);
				break;
			case "财务付款——核对面料":
				count++;
				for(Purchase p : shellPurchases){
					if(p.getPurchaseState().equals("待核对面料")&&(new Date().getTime()
							- p.getFinanceCheckTime().getTime() >= abvo.getStandardTime() * 3600000 )){
						count++;
					}
				}
				//将结果写入环节积压表中
				PhaseCondition phaseCondition4 = new PhaseCondition();
				phaseCondition4.setPhaseName("财务付款——核对面料");
				phaseCondition4.setPhasesConditionDate(currentTime);
				phaseCondition4.setPhasesConditionVol(count);
				phaseConditionService.addPhaseCondition(phaseCondition4);
				break;
			case "面料齐备——裁剪/工艺":
				count = 0;
				for(Purchase p : shellPurchases){
					if(p.getPurchaseState().equals("面料齐备")&&(new Date().getTime()
							- p.getMaterialCheckTime().getTime() >= abvo.getStandardTime() * 3600000)){
						Production production = p.getProduction();
						if(production != null && production.getProductionProgress().equals("采购中")){
							count++;
						}
					}
				}
				//将结果写入环节积压表中
				PhaseCondition phaseCondition5 = new PhaseCondition();
				phaseCondition5.setPhaseName("面料齐备——裁剪/工艺");
				phaseCondition5.setPhasesConditionDate(currentTime);
				phaseCondition5.setPhasesConditionVol(count);
				phaseConditionService.addPhaseCondition(phaseCondition5);
				break;
			case "裁剪/工艺——外发":   
				count = 0;
				List productions = baseDao.getAllList(Production.class);
				for(Object p : productions){
					if(((Production) p).getProductionProgress().equals("裁剪/工艺阶段")&&(new Date().getTime()
							- ((Production) p).getpProcessTime().getTime() >= abvo.getStandardTime() * 3600000)){
						count++;
					}
				}
				//将结果写入环节积压表中
				PhaseCondition phaseCondition6 = new PhaseCondition();
				phaseCondition6.setPhaseName("裁剪/工艺——外发");
				phaseCondition6.setPhasesConditionDate(currentTime);
				phaseCondition6.setPhasesConditionVol(count);
				phaseConditionService.addPhaseCondition(phaseCondition6);
				break;
			default:
				break;
			}
		}
	}

}
