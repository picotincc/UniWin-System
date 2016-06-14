package productManage.dao.lhj;

import java.util.List;

import productManage.model.lhj.Vendor;

public interface VendorDao {

	public void add(Vendor vendor);
	
	public void update(Vendor vendor);
	
	public Vendor getVendorById(String vendorId);
	
	public Vendor getVendorByName(String vendorName);
	
	public List<Vendor> getVendorList();
}
