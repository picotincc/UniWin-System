package productManage.service.supplement.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.szl.SupplementDao;
import productManage.dao.szl.SupplementMaterialDao;
import productManage.model.lhj.Material;
import productManage.model.lhj.Supply;
import productManage.model.szl.Supplement;
import productManage.model.szl.SupplementMaterial;
import productManage.service.PageService;
import productManage.service.supplement.SupplementCreateService;
import productManage.vo.PageBean;
import productManage.vo.supplement.SupplementConstants;
import productManage.vo.supplement.SupplementMaterialVO;

/**
 * @author SZL
 * @date 2016-3-23
 */

@Service
public class SupplementCreateServiceImpl implements SupplementCreateService{
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
	
	@Override
	public int createSupplement(Supplement supplement){
		return supplementDao.add(supplement);
	}
	@Override
	public void createSupplementMaterial(SupplementMaterial supplementMaterial){
		supplementMaterialDao.add(supplementMaterial);
	}
	@Override
	public List<SupplementMaterialVO> getLiningMaterial(String materialCode,String materialName,String shellAccessoryType){
		String hql = "select supply from Supply as supply inner join supply.material as material "
				+ "where supply.supplyId > 0 "
		+ "and material.materialType = '面料' ";//这句在物料数据完善时启用
		
		if(!(shellAccessoryType.equals("")) ){
			hql = hql+ "and material.shellAccessoryType like '%" + shellAccessoryType + "%' ";		
		}
		
		if( !(materialCode.equals(""))  ){
			hql = hql+ "and material.materialCode like '%" + materialCode + "%' ";		
		}
		
		if( !(materialName.equals("")) ){
			hql = hql+ "and material.materialName like '%" + materialName + "%' ";		
		}
		//System.out.println(hql);
		List<Supply> supplyList= supplementMaterialDao.getMaterialForSelect(hql);
		
		return packagingVO(supplyList);
		
	}
	@Override
	public List<SupplementMaterialVO> getAuxMaterial(String materialCode,String materialName,String shellAccessoryType){
		String hql = "select supply from Supply as supply inner join supply.material as material "
				+ "where supply.supplyId > 0 "
				+ "and material.materialType = '辅料' ";//这句在物料数据完善时启用
		
		if(!(shellAccessoryType.equals("")) ){
			hql = hql+ "and material.shellAccessoryType like '%" + shellAccessoryType + "%' ";		
		}
		
		if( !(materialCode.equals(""))  ){
			hql = hql+ "and material.materialCode like '%" + materialCode + "%' ";		
		}
		
		if( !(materialName.equals("")) ){
			hql = hql+ "and material.materialName like '%" + materialName + "%' ";		
		}
		//System.out.println(hql);
		List<Supply> supplyList= supplementMaterialDao.getMaterialForSelect(hql);
		
		return packagingVO(supplyList);
		
	}
	
	private List<SupplementMaterialVO> packagingVO(List<Supply> supplyList) {
		List<SupplementMaterialVO> voList = new ArrayList<SupplementMaterialVO>();
		for(Supply s : supplyList){
			//System.out.println(s.getSupplyId());
			SupplementMaterialVO vo = new SupplementMaterialVO();
			vo.setColorDescription(s.getMaterial().getColorDescription());
			vo.setMaterialCode(s.getMaterial().getMaterialCode());
			vo.setMaterialIngredient(s.getMaterial().getMaterialIngredient());
			vo.setMaterialName(s.getMaterial().getMaterialName());
			vo.setShellAccessoryType(s.getMaterial().getShellAccessoryType());
			vo.setVendorName(s.getVendor().getVendorName());
			vo.setSupplyId(s.getSupplyId());
			voList.add(vo);
		}
	
		return voList;
	}
	
}
