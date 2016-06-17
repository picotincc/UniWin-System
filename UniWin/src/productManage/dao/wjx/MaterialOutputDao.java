package productManage.dao.wjx;

import java.sql.Date;
import java.util.List;

import productManage.model.wjx.MaterialOutput;

public interface MaterialOutputDao {
    public MaterialOutput addMaterialOutput(MaterialOutput materialoutput);
    public List<MaterialOutput> getMaterialOutputList(Date date);
    public List<MaterialOutput> getMaterialOutputList(String materialApplyCode,String materialCode,int warehouseId);
}
