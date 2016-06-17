package productManage.dao.wjx;

import java.util.List;

import productManage.model.lhj.Material;
import productManage.model.lhj.WareHouse;
import productManage.model.wjx.Store;

public interface StoreDao {
    public Store updateStore(Store store);
    public List<Store> getStoreByMaterial(Material material);
    public List<Store> getAllStoreInfos();
    /**
     * 根据Store的联合主键获取Store
     * @param material
     * @param warehouse
     * @return
     */
    public Store getStore(String material,int warehouse);
    public List<WareHouse> getTest();
}
