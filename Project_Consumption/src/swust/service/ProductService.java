package swust.service;

import java.io.File;
import java.util.List;

import swust.model.Product;

public interface ProductService {
	// 查询所有
	public List<Product> getAllProducts();

	// 添加用户
	public void addProduct(Product product);

	// 删除用户
	public void delProduct(Integer id);

	// 修改用户
	public void updateProduct(Product product);

	// 单个查询
	public Product getProduct(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<Product> getProductByName(String productName);

	public void importExcel(File productExcel, String productExcelFileName);
}
