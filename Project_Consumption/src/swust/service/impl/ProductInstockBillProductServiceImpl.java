package swust.service.impl;

import java.util.List;

import swust.dao.ProductInstockBillDao;
import swust.dao.ProductInstockBillProductDao;
import swust.dao.ProductDao;
import swust.model.ProductInstockBillProduct;
import swust.service.ProductInstockBillProductService;


public class ProductInstockBillProductServiceImpl implements ProductInstockBillProductService {
	private ProductInstockBillDao productInstockBillDao;
	private ProductDao productDao;
	private ProductInstockBillProductDao productInstockBillProductDao;
	@Override
	public List<ProductInstockBillProduct> getAllProductInstockBillProducts() {
		List<ProductInstockBillProduct> productInstockBillProducts = productInstockBillProductDao.getAllProductInstockBillProducts();
		return productInstockBillProducts;
	}

	@Override
	public void addProductInstockBillProduct(ProductInstockBillProduct productInstockBillProduct) {
		productInstockBillProductDao.addProductInstockBillProduct(productInstockBillProduct);
	}

	@Override
	public void delProductInstockBillProduct(Integer id) {
		productInstockBillProductDao.delProductInstockBillProduct(id);
	}

	@Override
	public void updateProductInstockBillProduct(ProductInstockBillProduct productInstockBillProduct) {
		productInstockBillProductDao.updateProductInstockBillProduct(productInstockBillProduct);
	}
	
	@Override
	public ProductInstockBillProduct getProductInstockBillProduct(Integer id) {
		return productInstockBillProductDao.getProductInstockBillProduct(id);
	}

	public ProductInstockBillDao getProductInstockBillDao() {
		return productInstockBillDao;
	}

	public void setProductInstockBillDao(ProductInstockBillDao productInstockBillDao) {
		this.productInstockBillDao = productInstockBillDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public ProductInstockBillProductDao getProductInstockBillProductDao() {
		return productInstockBillProductDao;
	}

	public void setProductInstockBillProductDao(
			ProductInstockBillProductDao productInstockBillProductDao) {
		this.productInstockBillProductDao = productInstockBillProductDao;
	}

	

}
