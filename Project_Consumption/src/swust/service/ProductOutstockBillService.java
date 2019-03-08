package swust.service;

import java.io.File;
import java.util.List;

import swust.model.Product;
import swust.model.ProductOutstockBill;

public interface ProductOutstockBillService {
	// 查询所有
	public List<ProductOutstockBill> getAllProductOutstockBills();

	// 添加用户
	public void addProductOutstockBill(ProductOutstockBill productOutstockBill);

	// 删除用户
	public void delProductOutstockBill(Integer id);

	// 修改用户
	public void updateProductOutstockBill(
			ProductOutstockBill productOutstockBill);

	// 单个查询
	public ProductOutstockBill getProductOutstockBill(Integer id);

	public List<ProductOutstockBill> getProductOutstockBillByBillState(
			Integer id);

	public List<ProductOutstockBill> getBillNoByOnly();

	public List<ProductOutstockBill> getSimpleByBillNo(String billNo);

	public List<Product> getProductDistinct(String billNo);

	public void addToupdateProductOutstockBill(
			ProductOutstockBill productOutstockBill);

	public void updateProductOutstockBillProduct(
			ProductOutstockBill productOutstockBill);

	public void importExcel(File billproductExcel,
			String billproductExcelFileName);
}
