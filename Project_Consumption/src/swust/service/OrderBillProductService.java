package swust.service;

import java.util.List;

import swust.model.OrderBillProduct;

public interface OrderBillProductService {
	// 查询所有
	public List<OrderBillProduct> getAllOrderBillProducts();

	// 添加用户
	public void addOrderBillProduct(OrderBillProduct orderBill);

	// 删除用户
	public void delOrderBillProduct(Integer id);

	// 修改用户
	public void updateOrderBillProduct(OrderBillProduct orderBill);

	// 单个查询
	public OrderBillProduct getOrderBillProduct(Integer id);

	public List<OrderBillProduct> getOrderBillProductByNo(Integer billId);

	public List<OrderBillProduct> getProductByProductName(String productName);
	
	public List<OrderBillProduct> getByBillId(Integer id);
}
