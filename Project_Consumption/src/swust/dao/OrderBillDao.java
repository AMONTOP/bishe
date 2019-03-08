package swust.dao;

import java.math.BigDecimal;
import java.util.List;

import swust.model.OrderBill;

public interface OrderBillDao {
	// 查询所有
	public List<OrderBill> getAllOrderBills();

	// 添加用户
	public void addOrderBill(OrderBill orderBill);

	// 删除用户
	public void delOrderBill(Integer id);

	// 修改用户
	public void updateOrderBill(OrderBill orderBill);

	public void updateOrderBillByMoney(Integer billId, BigDecimal billAmount);
	
	public void updateOtherOrderBill(OrderBill orderBill);

	// 单个查询
	public OrderBill getOrderBill(Integer id);

	// 单个查询(根据订单编号模糊)
	public List<OrderBill> getOrderBillByNo(String billNo);

	public List<OrderBill> getOrderBillByBillState(Integer id);

}
