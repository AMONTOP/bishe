package swust.service.impl;

import java.util.List;

import swust.dao.MaterialDao;
import swust.dao.ProductDao;
import swust.dao.ProductMaterialDao;
import swust.model.Material;
import swust.model.Product;
import swust.model.ProductMaterial;
import swust.service.ProductMaterialService;

public class ProductMaterialServiceImpl implements ProductMaterialService {
	private ProductDao productDao;
	private MaterialDao materialDao;
	private ProductMaterialDao productMaterialDao;

	@Override
	public List<ProductMaterial> getAllProductMaterials() {
		List<ProductMaterial> productMaterials = productMaterialDao
				.getAllProductMaterials();
		List<Product> products = productDao.getAllProducts();
		List<Material> materials = materialDao.getAllMaterials();
		return productMaterials;
	}

	@Override
	public void addProductMaterial(ProductMaterial productMaterial) {
		productMaterialDao.addProductMaterial(productMaterial);
	}

	@Override
	public void delProductMaterial(Integer id) {
		productMaterialDao.delProductMaterial(id);
	}

	@Override
	public void updateProductMaterial(ProductMaterial productMaterial) {
		productMaterialDao.updateProductMaterial(productMaterial);
	}

	@Override
	public List<ProductMaterial> getPMByProductId(Integer id) {
		return productMaterialDao.getPMByProductId(id);
	}

	@Override
	public ProductMaterial getProductMaterial(Integer id) {
		return productMaterialDao.getProductMaterial(id);
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public MaterialDao getMaterialDao() {
		return materialDao;
	}

	public void setMaterialDao(MaterialDao materialDao) {
		this.materialDao = materialDao;
	}

	public ProductMaterialDao getProductMaterialDao() {
		return productMaterialDao;
	}

	public void setProductMaterialDao(ProductMaterialDao productMaterialDao) {
		this.productMaterialDao = productMaterialDao;
	}

}
