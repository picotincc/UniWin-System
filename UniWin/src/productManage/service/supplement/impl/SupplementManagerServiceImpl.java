package productManage.service.supplement.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.szl.SupplementDao;
import productManage.dao.szl.SupplementMaterialDao;
import productManage.dao.wjx.StoreDao;
import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.model.szl.Supplement;
import productManage.model.szl.SupplementMaterial;
import productManage.model.tms.Design;
import productManage.model.tms.Technique;
import productManage.model.tyc.Purchase;
import productManage.model.wjx.Store;
import productManage.model.yk.Orders;
import productManage.model.yrd.Customer;
import productManage.model.zky.Production;
import productManage.service.PageService;
import productManage.service.supplement.SupplementManagerService;
import productManage.vo.PageBean;
import productManage.vo.process.OutSourceVO;
import productManage.vo.process.ProcessConstants;
import productManage.vo.production.ProductionConstants;
import productManage.vo.production.ProductionOListVO;
import productManage.vo.supplement.SupplementConstants;
import productManage.vo.supplement.SupplementDetailVO;
import productManage.vo.supplement.SupplementVO;

/**
 * @author SZL
 * @date 2016-3-24
 */

@Service
public class SupplementManagerServiceImpl implements SupplementManagerService{

	@Autowired
	PageService pageService;
	
	@Autowired
	private SupplementDao supplementDao;
	public void setSupplementDao(SupplementDao supplementDao){
		this.supplementDao=supplementDao;
	}
	public SupplementDao getSupplementDao(){
		return supplementDao;
	}
	@Autowired
	private SupplementMaterialDao supplementMaterialDao;
	public void setSupplementMaterialDao(SupplementMaterialDao supplementMaterialDao){
		this.supplementMaterialDao=supplementMaterialDao;
	}
	public SupplementMaterialDao getSupplementMaterialDao(){
		return supplementMaterialDao;
	}
	@Autowired
	private StoreDao storeDao;
	public void setStoreDao(StoreDao storeDao){
		this.storeDao=storeDao;
	}
	public StoreDao getStoreDao(){
		return storeDao;
	}
	@Override
	public PageBean getAllSupplement(int page,int rowsPerPage){
		
		String hql = "select supplement from Supplement as supplement";
		
    	PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
    	List<Supplement> supplementList= (List<Supplement>)result.getList();
    	List<SupplementVO> supplementListVO = packagingVO(supplementList);
    	
    	result.setList(supplementListVO);
        return result;
		
	}
	
	private List<SupplementVO> packagingVO(List<Supplement> supplementList) {
		List<SupplementVO> voList = new ArrayList<SupplementVO>();
		for(Supplement sp : supplementList){
			SupplementVO vo = new SupplementVO();
			
			Iterator it=sp.getProduction().getOrders().iterator();
			if(it.hasNext()){
				Orders orders=(Orders) it.next();
				vo.setDesignCode(orders.getDesign().getDesignCode());
				vo.setDesignName(orders.getDesign().getDesignName());  
			}
			vo.setSupplementCode(sp.getSupplementCode());
			vo.setSupplementDate(sp.getSupplementDate());
			vo.setSupplementState(sp.getSupplementState());
			vo.setUserName(sp.getUser().getUserName());
			
	List<SupplementMaterial> smList =supplementMaterialDao.getSupplementMaterialBySupplementID(sp.getSupplementID());
	
			List<String> vendorName=new ArrayList<String>();
			List<String> vendorPhoneNum=new ArrayList<String>();
			if(smList!=null){
			for(SupplementMaterial sm:smList){
				
				vendorName.add(sm.getSupply().getVendor().getVendorName());
				
			
				vendorPhoneNum.add(sm.getSupply().getVendor().getVendorMobileNum());
				
			}
			}
			vo.setVendorName(vendorName);
			vo.setVendorPhoneNum(vendorPhoneNum);
			
			voList.add(vo);
		}		
		return voList;
	}
	@Override
	public SupplementDetailVO getSupplementDetail(String supplementCode) {
		Supplement supplement=supplementDao.getSupplementByCode(supplementCode);
		SupplementDetailVO vo=new SupplementDetailVO();
		vo.setMaterialType(supplementMaterialDao.getMaterialType(supplement.getSupplementID()));
		vo.setProductionCode(supplement.getProduction().getProductionCode());
		List<SupplementMaterial> smList=supplementMaterialDao.getSupplementMaterialBySupplementID(supplement.getSupplementID());
		vo.setSmList(smList);
		
		Map<SupplementMaterial,List<Store>> storeMap=new HashMap<SupplementMaterial,List<Store>>();
		for(SupplementMaterial sm:smList){
			List<Store> storelist=storeDao.getStoreByMaterial(sm.getSupply().getMaterial());
			storeMap.put(sm, storelist);
		}
		vo.setStoreMap(storeMap);
		vo.setSupplementCode(supplementCode);
		vo.setSupplementComment(supplement.getSupplementComment());
		vo.setSupplementType(supplement.getSupplementType());
		vo.setUserName(supplement.getUser().getUserName());
		vo.setSupplementDate(supplement.getSupplementDate());
		return vo;
	}
	
	@Override
	public PageBean querySupplements(int pageSize, int page, Map<String, Object> params) {
		
//		String hql = "select supplement from Supplment as supplement "
//				+ "inner join supplement.production as production "
//				+ "inner join production.orders as orders "
//				+ "inner join orders.design as design "
//				+ "where supplement.supplementID > 0 ";
		String hql = "select supplement from Supplement as supplement "
				+ "where supplement.supplementID > 0 ";
		String designCode = (String) params.get(SupplementConstants.SEARCH_SUPPLEMENTS_PARAMS[0]);
		String supplementDate = (String) params.get(SupplementConstants.SEARCH_SUPPLEMENTS_PARAMS[1]);
		String materialType = (String) params.get(SupplementConstants.SEARCH_SUPPLEMENTS_PARAMS[2]);
		String vendorName = (String) params.get(SupplementConstants.SEARCH_SUPPLEMENTS_PARAMS[3]);
		String supplementState = (String) params.get(SupplementConstants.SEARCH_SUPPLEMENTS_PARAMS[4]);
		
		
		if( designCode != null ){
			hql = "select supplement from Supplement as supplement "
					+ "inner join supplement.production as production "
					+ "inner join production.orders as orders "
					+ "inner join orders.design as design "
					+ "where supplement.supplementID > 0 "
					+ "and design.designCode like '%" + designCode + "%' ";		
		}
		
		if( supplementDate != null ){
			hql = hql + "and supplement.supplementDate like '%" + supplementDate + "%' ";
		}
		
		if( supplementState != null ){
			hql = hql + "and supplement.supplementState like '%" + supplementState + "%' ";
		}
		
		if(( materialType != null )){
			hql = hql + "and supplement in (select sm.supplement from SupplementMaterial as sm inner join sm.supply as supply inner join supply.material as material "
					+ "where material.materialType like '%" + materialType + "%') ";
		}
		
		if(( vendorName != null )){
			hql = hql + "and supplement in (select sm.supplement from SupplementMaterial as sm inner join sm.supply as supply inner join supply.vendor as vendor "
					+ "where vendor.vendorName like '%" + vendorName + "%') ";
		}
		
		
		//System.out.println(hql);
		PageBean result = pageService.queryForPage(hql, pageSize, page);
		List<Supplement> supplementList= (List<Supplement>)result.getList();
    	List<SupplementVO> supplementListVO = packagingVO(supplementList);
    	
    	result.setList(supplementListVO);
		
		return result;
		
	}
	
	@Override
	public Supplement changeState(String supplementCode, String supplementState) {
		Supplement supplement = supplementDao.getSupplementByCode(supplementCode);
	//	if(supplement != null){
			supplement.setSupplementState(supplementState);
			supplementDao.update(supplement);
			return supplement;
	//	}
	//	return null;
	}


}
