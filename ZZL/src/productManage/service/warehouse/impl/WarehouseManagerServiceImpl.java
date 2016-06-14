package productManage.service.warehouse.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.lhj.MaterialDao;
import productManage.dao.lhj.MaterialapplyDao;
import productManage.dao.lhj.WarehouseDao;
import productManage.dao.wjx.MaterialInputDao;
import productManage.dao.wjx.MaterialOutputDao;
import productManage.dao.wjx.StoreDao;
import productManage.model.lhj.Material;
import productManage.model.lhj.Materialapply;
import productManage.model.lhj.WareHouse;
import productManage.model.wjx.MaterialInput;
import productManage.model.wjx.MaterialOutput;
import productManage.model.wjx.Store;
import productManage.service.PageService;
import productManage.service.warehouse.WarehouseManagerService;
import productManage.vo.PageBean;

/**
 * @author WHQ
 * @date 2016-03-02
 */
@Service
public class WarehouseManagerServiceImpl implements WarehouseManagerService {

	@Autowired
	PageService pageService;
	
    @Autowired
    MaterialInputDao materialInputDao;
    @Autowired
    MaterialOutputDao materialOutputDao;
    @Autowired
    StoreDao storeDao;
    @Autowired
    MaterialapplyDao materialApplyDao;
    @Autowired
    MaterialDao materialDao;
    @Autowired
    WarehouseDao warehouseDao;
    
    @Override
    public PageBean getMaterialInList(String id, String ClouthStyleId,
            String style, String purcharseId,int page, int rowsPerPage) {
        
        return null;
    }
    @Override
    public List<Material> getMaterialOutList(String id, String ClouthStyleId,
            String MaterialName, String preOrderId) {
        
        return null;
    }

//	@Override
//	public List<Material> getMaterialInList(String id, String ClouthStyleId,
//			String style, String purcharseId) {
//
//		return null;
//	}

//	@Override
//	public List<Material> getMaterialOutList(String id, String ClouthStyleId,
//			String MaterialName, String preOrderId) {
//		return null;
//	}
	
    @Override
    public List<MaterialInput> getMaterialInputList(
            Calendar date) {
		java.sql.Date dateSql = new java.sql.Date(date.getTime().getTime());
		System.out.println("2:"+dateSql.toString());
		return materialInputDao.getMaterialInputByDate(dateSql);

	}

	@Override
	public int MaterialInput(Material material, int number) {
		return 0;
	}
	
    @Override
    public PageBean getMaterialInputList(Calendar calendar,int page,int rowsPerPage) {
		if(calendar == null){
			String hql = "select date_format(m.materialInputDate,'%Y-%m-%d') as materialInputDate,sum(m.materialInputVol) as total from MaterialInput as m group by materialInputDate";
			PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
			return result;
		}else{
			SimpleDateFormat sdp = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdp.format(calendar.getTimeInMillis());
			String hql = "select date_format(m.materialInputDate,'%Y-%m-%d') as materialInputDate,sum(m.materialInputVol) as total from MaterialInput as m group by materialInputDate having materialInputDate = '"+date+"'";
			System.out.println(hql);
			PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
			System.out.println(result.getList());
			return result;
		}
    }

	@Override
	public int MaterialOutput(Material material, int number) {
		// TODO Auto-generated method stub
		return 0;
	}

//	@Override
//	public List<MaterialInput> getMaterialInputList(Date date) {
//		// TODO Auto-generated method stub
//		return null;
//	}

//	@Override
//	public List<MaterialInput> getAllMaterialInputList() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public PageBean getAllOutStores(int page, int rowsPerPage) {
//		String hql = "select ma.materialApplyCode,s.material.materialCode,s.material.materialName,s.warehouse.location,s.remainVol,s.warehouse.remain,ma.materialApplyVol,s.warehouse.warehouseid from Store as s,Materialapply as ma where s.material.materialCode = ma.material.materialCode";
		String hql = "select ma.materialApplyCode,ma.materialApplyVol,s from Store as s,Materialapply as ma where s.material = ma.material";
		System.out.println(hql);
		PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
		return result;
	}
	
	public PageBean getAllInStores(int page,int rowsPerpage){
		String hql="from Store";
		PageBean result=pageService.queryForPage(hql,rowsPerpage,page);
		return result;
	}
	
	 
	
	@Override
	public PageBean getStoresByFilter(int page, int rowsPerPage, Map filter) {
		String hql = "select ma.materialApplyCode,ma.materialApplyVol,s from Store as s,Materialapply as ma where s.material = ma.material ";
		String materialCode = (String) filter.get("materialCode");
		String materialName = (String) filter.get("materialName");
		String materialApplyCode = (String) filter.get("materialApplyCode");
		String designCode = (String) filter.get("designCode");
		if(!(materialCode.equals("") || materialCode==null)){
			hql+="and s.material.materialCode like '%"+materialCode+"%' ";
		}
		if(!(materialName.equals("") || materialName==null)){
			hql+="and s.material.materialName like '%"+materialName+"%' ";
		}
		if(!(materialApplyCode.equals("") || materialApplyCode==null)){
			hql+="and ma.materialApplyCode like '%"+materialApplyCode+"%' ";
		}
		if(!(designCode.equals("") || designCode==null)){
			hql+="and s.material.materialCode IN (select b.material.materialCode from Design as d , Bom as b where d.designID = b.design.designID and d.designCode like '%"+designCode+"%')";
		}
		System.out.println(hql);
		PageBean pageBean = pageService.queryForPage(hql, rowsPerPage, page);
		return pageBean;
	}

	@Override
	public List<WareHouse> getTest() {

		return storeDao.getTest();
	}

	@Override
	public PageBean getMaterialOutputList(Calendar calendar, int page,
			int rowsPerPage) {
		if (calendar == null) {
			String hql = "select date_format(m.materialOutputDate,'%Y-%m-%d') as materialOutputDate,sum(m.materialOutputVol) as total from MaterialOutput as m group by materialOutputDate";
			PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
			return result;
		} else {
			SimpleDateFormat sdp = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdp.format(calendar.getTimeInMillis());
			String hql = "select date_format(m.materialOutputDate,'%Y-%m-%d') as materialOutputDate,sum(m.materialOutputVol) as total from MaterialOutput as m group by materialOutputDate having materialOutputDate = '"
					+ date + "'";
			System.out.println(hql);
			PageBean result = pageService.queryForPage(hql, rowsPerPage, page);
			System.out.println(result.getList());
			return result;
		}
	}

	@Override
	public List<MaterialOutput> getMaterialOutputList(Calendar date) {
		java.sql.Date dateSql = new java.sql.Date(date.getTime().getTime());
		System.out.println("2:" + dateSql.toString());
		return materialOutputDao.getMaterialOutputList(dateSql);
	}

	@Override
	public Store getStore(String material, int warehouse) {
		return storeDao.getStore(material, warehouse);
	}

	@Override
	public Materialapply getMaterialApplyByCode(String materialApplyCode) {
		return materialApplyDao.getMaterialApplyByCode(materialApplyCode);
	}

	@Override
	public MaterialOutput addMaterialOutput(MaterialOutput materialOutput) {
		return materialOutputDao.addMaterialOutput(materialOutput);
	}

	@Override
	public Store updateStore(Store store) {
		return storeDao.updateStore(store);
	}

	@Override
	public List<MaterialOutput> getMaterialOutputs(
			String materialApplyCode, String materialCode, int warehouseId) {
		return materialOutputDao.getMaterialOutputList(materialApplyCode,
				materialCode, warehouseId);
	}

	@Override
	public List<Store> getAllStore(){
		return storeDao.getAllStoreInfos();
	}
	
	@Override
	 public MaterialInput addMaterialInput(MaterialInput materialInput){
		return materialInputDao.addMaterialInput(materialInput);
	}
	@Override
	public Material getMaterialByCode(String code) {
		return materialDao.getMaterialByMaterialCode(code);
	}
	@Override
	public WareHouse getWarehouseById(int id) {
		return warehouseDao.getWarehouseById(id);
	}

}
