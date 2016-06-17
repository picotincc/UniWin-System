package productManage.service.ListManage;
import java.util.List;

import productManage.model.cs.OutSource;
import productManage.model.cs.OutSourceDetail;
import productManage.model.tms.Design;
import productManage.model.yk.Orders;
import productManage.vo.PageBean;
/**
 * 
 * @author tz
 *  外发阶段排单
 */

public interface OutSourcePhaseService {
public List<OutSource> getAllOutSource();
public List<OutSource> getOutSourceByKeys();//按条件查询查询
public Design getDesignByOutSource(); // 通过外发单查询款式
public Orders getOrderByOutSource(); //通过外发单查询订单
public List<OutSource> getOutSourceByOutSourceID(int outSourceID);//按照款式查询

/*************/
public PageBean getAllOutSourceInOutward(int page, int rowsPerPage);
public List<OutSourceDetail> getOutSourceDetailByID(int outsourceID);
public OutSource getOutSourceByID(int outsourceID);
public PageBean inquireOutSourceInOutward(String hql,String orderPriority,int page, int rowsPerPage);
}
