package productManage.dao.wjx;

import java.sql.Date;
import java.util.List;

import productManage.model.wjx.MaterialInput;

public interface MaterialInputDao {
    public MaterialInput addMaterialInput(MaterialInput materialinput);
    public List<MaterialInput> getAllList();
    public List<MaterialInput> getMaterialInputByDate(Date date);
}
