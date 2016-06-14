package productManage.service.orders.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;







import productManage.dao.wcy.OrderDetailDAO;
import productManage.model.yk.OrderDetail;
import productManage.model.yk.OrderMaterialDetail;
import productManage.service.orders.OrderDetailService;
@Service
public class OrderDetailServiceImpl implements OrderDetailService{

	@Autowired
	private OrderDetailDAO orderDetailDao;
	
	@Override
	public void save(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		orderDetailDao.save(orderDetail);
	}

	@Override
	public void update(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		orderDetailDao.update(orderDetail);
	}

	@Override
	public OrderDetail getOrderDetail(int orderID) {
		// TODO Auto-generated method stub
		return orderDetailDao.getOrderDetail(orderID);
	}

	@Override
	public List<OrderDetail> getAll() {
		// TODO Auto-generated method stub
		return orderDetailDao.getAll();
	}
	
	public void SaveOrderMaterailDetail(OrderMaterialDetail orderMaterialDetail){
		 orderDetailDao.SaveOrderMaterailDetail(orderMaterialDetail);
	}

}
