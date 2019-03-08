package swust.service.impl;

import java.util.List;

import swust.dao.ProductCheckDao;
import swust.dao.ProductDao;
import swust.model.Product;
import swust.model.ProductCheck;
import swust.service.ProductCheckService;

public class ProductCheckServiceImpl implements ProductCheckService {
	private ProductDao productDao;
	private ProductCheckDao productCheckDao;

	@Override
	public List<ProductCheck> getAllProductChecks() {
		List<ProductCheck> productChecks = productCheckDao
				.getAllProductChecks();
		List<Product> products = productDao.getAllProducts();
		return productChecks;
	}

	@Override
	public void addProductCheck(ProductCheck productCheck) {
		productCheckDao.addProductCheck(productCheck);
	}

	@Override
	public void delProductCheck(Integer id) {
		productCheckDao.delProductCheck(id);
	}

	@Override
	public void updateProductCheck(ProductCheck productCheck) {
		productCheckDao.updateProductCheck(productCheck);
	}

	@Override
	public ProductCheck getProductCheck(Integer id) {
		return productCheckDao.getProductCheck(id);
	}

	@Override
	public List<ProductCheck> getProductCheckByBillId(Integer id) {
		return productCheckDao.getProductCheckByBillId(id);
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public ProductCheckDao getProductCheckDao() {
		return productCheckDao;
	}

	public void setProductCheckDao(ProductCheckDao productCheckDao) {
		this.productCheckDao = productCheckDao;
	}

	@Override
	public List<ProductCheck> getProductCheckByState(Integer id) {
		return productCheckDao.getProductCheckByState(id);
	}

}
