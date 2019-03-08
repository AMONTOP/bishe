package swust.service.impl;

import java.util.List;

import swust.dao.ProductOutstockBillDao;
import swust.dao.ProductOutstockBillProductDao;
import swust.dao.ProductDao;
import swust.model.ProductOutstockBillProduct;
import swust.service.ProductOutstockBillProductService;


public class ProductOutstockBillProductServiceImpl implements ProductOutstockBillProductService {
	private ProductOutstockBillDao productOutstockBillDao;
	private ProductDao productDao;
	private ProductOutstockBillProductDao productOutstockBillProductDao;
	@Override
	public List<ProductOutstockBillProduct> getAllProductOutstockBillProducts() {
		List<ProductOutstockBillProduct> productOutstockBillProducts = productOutstockBillProductDao.getAllProductOutstockBillProducts();
		return productOutstockBillProducts;
	}

	@Override
	public void addProductOutstockBillProduct(ProductOutstockBillProduct productOutstockBillProduct) {
		productOutstockBillProductDao.addProductOutstockBillProduct(productOutstockBillProduct);
	}

	@Override
	public void delProductOutstockBillProduct(Integer id) {
		productOutstockBillProductDao.delProductOutstockBillProduct(id);
	}

	@Override
	public void updateProductOutstockBillProduct(ProductOutstockBillProduct productOutstockBillProduct) {
		productOutstockBillProductDao.updateProductOutstockBillProduct(productOutstockBillProduct);
	}
	
	@Override
	public ProductOutstockBillProduct getProductOutstockBillProduct(Integer id) {
		return productOutstockBillProductDao.getProductOutstockBillProduct(id);
	}

	public ProductOutstockBillDao getProductOutstockBillDao() {
		return productOutstockBillDao;
	}

	public void setProductOutstockBillDao(ProductOutstockBillDao productOutstockBillDao) {
		this.productOutstockBillDao = productOutstockBillDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public ProductOutstockBillProductDao getProductOutstockBillProductDao() {
		return productOutstockBillProductDao;
	}

	public void setProductOutstockBillProductDao(
			ProductOutstockBillProductDao productOutstockBillProductDao) {
		this.productOutstockBillProductDao = productOutstockBillProductDao;
	}

	

}
