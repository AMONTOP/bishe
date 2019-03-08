package swust.service;

import java.util.List;

import swust.model.ProductMaterial;

public interface ProductMaterialService {
	// 查询所有
	public List<ProductMaterial> getAllProductMaterials();

	// 添加用户
	public void addProductMaterial(ProductMaterial productMaterial);

	// 删除用户
	public void delProductMaterial(Integer id);

	// 修改用户
	public void updateProductMaterial(ProductMaterial productMaterial);

	// 单个查询
	public ProductMaterial getProductMaterial(Integer id);

	public List<ProductMaterial> getPMByProductId(Integer id);
}
