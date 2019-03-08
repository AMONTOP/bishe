package swust.dao;

import java.util.List;

import swust.model.ProductCheck;

public interface ProductCheckDao {
	// 查询所有
	public List<ProductCheck> getAllProductChecks();

	// 添加用户
	public void addProductCheck(ProductCheck productCheck);

	// 删除用户
	public void delProductCheck(Integer id);

	// 修改用户
	public void updateProductCheck(ProductCheck productCheck);

	// 单个查询
	public ProductCheck getProductCheck(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<ProductCheck> getProductCheckByBillId(Integer id);

	public List<ProductCheck> getProductCheckByState(Integer id);
}
