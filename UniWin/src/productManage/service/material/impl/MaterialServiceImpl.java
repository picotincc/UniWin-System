package productManage.service.material.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.BaseDao;
import productManage.dao.lhj.MaterialDao;
import productManage.dao.lhj.SupplyDao;
import productManage.dao.lhj.WarehouseDao;
import productManage.dao.wjx.StoreDao;
import productManage.model.cs.Processor;
import productManage.model.lhj.Material;
import productManage.model.lhj.Supply;
import productManage.model.lhj.WareHouse;
import productManage.model.wjx.Store;
import productManage.service.PageService;
import productManage.service.material.MaterialService;
import productManage.vo.PageBean;
import productManage.vo.material.ApplyConstants;
import productManage.vo.material.MaterialConstants;
import productManage.vo.process.ProcessConstants;
import productManage.vo.technique.TechniqueConstants;

@Service
public class MaterialServiceImpl implements MaterialService{

	@Autowired
	private MaterialDao materialdao;
	@Autowired
	private WarehouseDao warehousedao;
	@Autowired
	private BaseDao basedao;
	@Autowired
	private PageService pageservice;
	
	@Override
	public void addMaterial(Material material) {
		// TODO Auto-generated method stub
		materialdao.add(material);
	}
	

	@Override
	public void addSupply(Supply supply) {
		// TODO Auto-generated method stub
		basedao.save(supply);
	}

	@Override
	public void addStore(Store store) {
		// TODO Auto-generated method stub
		basedao.save(store);
	}

	@Override
	public PageBean queryMaterial(int pageSize, int page, Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql="select material from Material as material ";
		String materialName = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[0]);
		if (materialName != null) {
			hql += "where ";
			hql += "material.materialName like '%" + materialName + "%' ";
		}
		
		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		List<Material> materialList = pageBean.getList();
		pageBean.setList(materialList);
		return pageBean;
	}
	
	
	public Material getMaterialByCode(String materialCode){
		return materialdao.getMaterialByMaterialCode(materialCode);
	}
	
	public List<Material> getMaterialByKey(String key){
		return materialdao.getMaterialByKey(key);
	}

	@Override
	public void updateMaterial(Material material) {
		// TODO Auto-generated method stub
		materialdao.update(material);
	}

	@Override
	public PageBean queryApply(int pageSize, int page,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql="select apply from Materialapply as apply";
		String materialApplyCode = (String)params.get(ApplyConstants.SEARCH_APPLY_PARAMS[0]);
		String materialApplyDate = (String)params.get(ApplyConstants.SEARCH_APPLY_PARAMS[1]);

		if((!(materialApplyCode.equals("")))&&(!(materialApplyDate.equals("")))){
			hql+=" where ";
			hql+="apply.materialApplyCode like '%"+materialApplyCode+"%'"+" and apply.matrialApplyDate like '%"+materialApplyDate+"%'";
		}
		else{
			if(!(materialApplyCode.equals(""))){
				hql+=" where ";
				hql+="apply.materialApplyCode like '%"+materialApplyCode+"%'";
			}
			if(!(materialApplyDate.equals(""))){
				hql+=" where ";
				hql+="apply.matrialApplyDate like '%"+materialApplyDate+"%'";
			}
		}
			
		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		return pageBean;
	}

	@Override
	public List<Material> getMaterialList(Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql="select material from Material as material ";
		String materialName = (String)params.get(MaterialConstants.SEARCH_MATERIAL_PARAMS[0]);
		if (materialName != null) {
			hql += "where ";
			hql += "material.materialName like '%" + materialName + "%' ";
		}
		
		List<Material> materialList = materialdao.getMaterialList(hql);
		return materialList;
	}


	@Override
	public WareHouse getWarehouseByLocation(String location) {
		// TODO Auto-generated method stub
		WareHouse warehouse = warehousedao.getWarehouseByLocation(location);
		return warehouse;
	}


	@Override
	public List<WareHouse> getWareHouseList() {
		// TODO Auto-generated method stub
		List<WareHouse> list = warehousedao.getWarehouseList();
		return list;
	}


	@Override
	public List<Material> getFuliaoMaterial() {
		// TODO Auto-generated method stub
		String hql="select material from Material as material where material.materialType='辅料'";
		return materialdao.getMaterialList(hql);
	}

	

}
