package swust.dao;

import java.util.List;

import swust.model.Product;
import swust.model.ProductInstockBill;

public interface ProductInstockBillDao {
	// 查询所有
	public List<ProductInstockBill> getAllProductInstockBills();

	// 添加用户
	public void addProductInstockBill(ProductInstockBill productInstockBill);

	// 删除用户
	public void delProductInstockBill(Integer id);

	// 修改用户
	public void updateProductInstockBill(ProductInstockBill productInstockBill);

	// 单个查询
	public ProductInstockBill getProductInstockBill(Integer id);

	public List<ProductInstockBill> getProductInstockBillByBillState(Integer id);

	public List<ProductInstockBill> getBillNoByOnly();

	public List<ProductInstockBill> getSimpleByBillNo(String billNo);

	public List<Product> getProductDistinct(String billNo);

	public void addToupdateProductInstockBill(
			ProductInstockBill productInstockBill);

	public void updateProductInstockBillProduct(
			ProductInstockBill productInstockBill);

	public void addToProductCheck(ProductInstockBill productInstockBill);

}
