package productManage.service.material.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import productManage.dao.lhj.VendorDao;
import productManage.model.lhj.Material;
import productManage.model.lhj.Vendor;
import productManage.service.PageService;
import productManage.service.material.VendorService;
import productManage.vo.PageBean;
import productManage.vo.material.VendorConstants;

@Service
public class VendorServiceImpl implements VendorService{

	@Autowired
	private VendorDao vendordao;
	@Autowired
	private PageService pageservice;
	
	@Override
	public boolean addVendor(Vendor vendor) {
		// TODO Auto-generated method stub
		vendordao.add(vendor);
		return true;
	}

	public boolean updateVendor(Vendor vendor){
		vendordao.update(vendor);
		return true;
	}
	
	@Override
	public PageBean queryVendor(int pageSize, int page,
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		String hql="select vendor from Vendor as vendor ";
		String vendorName = (String)params.get(VendorConstants.SEARCH_VENDOR_PARAMS[0]);
		if (vendorName != null) {
			hql += "where ";
			hql += "vendor.vendorName like '%" + vendorName + "%' ";
		}
		
		PageBean pageBean = pageservice.queryForPage(hql, pageSize, page);
		List<Material> vendorList = pageBean.getList();
		pageBean.setList(vendorList);
		return pageBean;
	}
	
	public Vendor getVendorById(String vendorId){
		return vendordao.getVendorById(vendorId);
	}
	
	public Vendor getVendorByName(String vendorName){
		return vendordao.getVendorByName(vendorName);
	}

	@Override
	public List<Vendor> getVendorList() {
		// TODO Auto-generated method stub
		return vendordao.getVendorList();
	}

}
