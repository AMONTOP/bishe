package swust.service.impl;

import java.util.List;

import swust.dao.OrderBillDao;
import swust.dao.OrderBillProductDao;
import swust.dao.ProductDao;
import swust.model.OrderBillProduct;
import swust.service.OrderBillProductService;

public class OrderBillProductServiceImpl implements OrderBillProductService {
	private OrderBillDao orderBillDao;
	private ProductDao productDao;
	private OrderBillProductDao orderBillProductDao;

	@Override
	public List<OrderBillProduct> getAllOrderBillProducts() {
		List<OrderBillProduct> orderBillProducts = orderBillProductDao
				.getAllOrderBillProducts();
		return orderBillProducts;
	}

	@Override
	public void addOrderBillProduct(OrderBillProduct orderBill) {
		orderBillProductDao.addOrderBillProduct(orderBill);

	}

	@Override
	public void delOrderBillProduct(Integer id) {
		orderBillProductDao.delOrderBillProduct(id);
	}

	@Override
	public void updateOrderBillProduct(OrderBillProduct orderBill) {
		orderBillProductDao.updateOrderBillProduct(orderBill);

	}

	@Override
	public OrderBillProduct getOrderBillProduct(Integer id) {
		return orderBillProductDao.getOrderBillProduct(id);
	}

	@Override
	public List<OrderBillProduct> getOrderBillProductByNo(Integer billId) {
		return orderBillProductDao.getOrderBillProductByNo(billId);
	}

	@Override
	public List<OrderBillProduct> getProductByProductName(String productName) {
		return orderBillProductDao.getProductByProductName(productName);
	}
	public List<OrderBillProduct> getByBillId(Integer id){
		return orderBillProductDao.getByBillId(id);
	}

	public OrderBillDao getOrderBillDao() {
		return orderBillDao;
	}

	public void setOrderBillDao(OrderBillDao orderBillDao) {
		this.orderBillDao = orderBillDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public OrderBillProductDao getOrderBillProductDao() {
		return orderBillProductDao;
	}

	public void setOrderBillProductDao(OrderBillProductDao orderBillProductDao) {
		this.orderBillProductDao = orderBillProductDao;
	}

}
