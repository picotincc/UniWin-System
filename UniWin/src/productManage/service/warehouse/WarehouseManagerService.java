package productManage.service.warehouse;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import productManage.model.lhj.Material;
import productManage.model.lhj.Materialapply;
import productManage.model.lhj.WareHouse;
import productManage.model.wjx.MaterialInput;
import productManage.model.wjx.MaterialOutput;
import productManage.model.wjx.Store;
import productManage.vo.PageBean;

/**
 * @author WHQ
 * @date 2016-03-02
 */

public interface WarehouseManagerService {

    public PageBean getMaterialInList(String id,String ClouthStyleId, String style,String purcharseId,int page, int rowsPerPage);//入库时获取的物料列表
    public List<Material> getMaterialOutList(String id,String ClouthStyleId,String MaterialName ,String preOrderId);//出库时获取的物料列表
    public int MaterialInput(Material material,int  number);//物料入库修改仓储信息
    public int MaterialOutput(Material material,int number);///物料出库修改仓储信息
    public List<MaterialInput> getMaterialInputList(Calendar date);//根据时间获取入库单列表
    
    public PageBean getMaterialInputList(Calendar calendar,int page,int rowsPerPage);//获取所有入库单
    
    
    public List<WareHouse> getTest();
    
    /**
     * 获取出库单列表（list中的值是：时间+该日出库总数的数组）
     * @param date 根据时间筛选
     * @param page
     * @param rowsPerPage
     * @return
     */
    public PageBean getMaterialOutputList(Calendar date,int page, int rowsPerPage);
    /**
     * 获取仓库物料对应信息
     */
    public PageBean getAllOutStores(int page, int rowsPerPage);
    /**
     * wjx
     * 筛选outstores
     * @param page
     * @param rowsPerPage
     * @param filter
     * @return
     */
    
    public PageBean getAllInStores(int page, int rowsPerPage);
    /**
     * whq
     * 筛选instores
     * @param page
     * @param rowsPerPage
     * @param filter
     * @return
     */
    
    public PageBean getStoresByFilter(int page, int rowsPerPage, Map filter);
    /**
     * 获取出库单列表（list中的值即出库单）
     * @param date 根据日期筛选
     * @return
     */
    public List<MaterialOutput> getMaterialOutputList(Calendar date);
    /**
     * 根据联合主键获取Store
     * @param material
     * @param warehouse
     * @return
     */
    public Store getStore(String materialCode,int warehouseid);
    /**
     * 根据主键查找物料申请单
     */
    public Materialapply getMaterialApplyByCode(String materialApplyCode);
    /**
     * 新增出库单
     * @param materialOutput
     * @return
     */
    public MaterialOutput addMaterialOutput(MaterialOutput materialOutput);
    /**
     * 更新Store信息
     * @param store
     * @return
     */
    public Store updateStore(Store store);
    /**
     * 查询某个预订单下，某个物料从某个仓库出库的所有出库单
     * @param materialApplyCode
     * @param materialCode
     * @param warehouseId
     * @return
     */
    public List<MaterialOutput> getMaterialOutputs(String materialApplyCode,String materialCode,int warehouseId);
    
    public List<Store> getAllStore();
    
    public MaterialInput addMaterialInput(MaterialInput materialInput);
    
    public Material getMaterialByCode(String code);
    
    public WareHouse getWarehouseById(int id);
}
