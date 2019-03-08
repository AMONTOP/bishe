package swust.service.impl;

import java.util.List;

import swust.dao.ProductCategoryDao;
import swust.model.ProductCategory;
import swust.service.ProductCategoryService;

public class ProductCategoryServiceImpl implements ProductCategoryService {
	private ProductCategoryDao productCategoryDao;
	@Override
	public List<ProductCategory> getAllProductCategorys() {
		List<ProductCategory> productCategorys = productCategoryDao.getAllProductCategorys();
		return productCategorys;
	}

	@Override
	public void addProductCategory(ProductCategory productCategory) {
		productCategoryDao.addProductCategory(productCategory);
	}

	@Override
	public void delProductCategory(Integer id) {
		productCategoryDao.delProductCategory(id);
	}

	@Override
	public void updateProductCategory(ProductCategory productCategory) {
		productCategoryDao.updateProductCategory(productCategory);
	}

	@Override
	public ProductCategory getProductCategory(Integer id) {
		return productCategoryDao.getProductCategory(id);
	}

	@Override
	public List<ProductCategory> getProductCategoryByName(String categoryName) {
		return productCategoryDao.getProductCategoryByName(categoryName);
	}

	public ProductCategoryDao getProductCategoryDao() {
		return productCategoryDao;
	}

	public void setProductCategoryDao(ProductCategoryDao productCategoryDao) {
		this.productCategoryDao = productCategoryDao;
	}

	
	

}
