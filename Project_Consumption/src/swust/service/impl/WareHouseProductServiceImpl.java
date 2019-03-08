package swust.service.impl;

import java.util.List;

import swust.dao.WareHouseProductDao;
import swust.model.WareHouseProduct;
import swust.service.WareHouseProductService;

public class WareHouseProductServiceImpl implements WareHouseProductService {
	private WareHouseProductDao wareHouseProductDao;

	@Override
	public List<WareHouseProduct> getAllWareHouseProducts() {
		List<WareHouseProduct> wareHouseProducts = wareHouseProductDao
				.getAllWareHouseProducts();
		return wareHouseProducts;
	}

	@Override
	public List<WareHouseProduct> getWareHouseProductByWare(Integer wareId) {
		List<WareHouseProduct> wareHouseProducts = wareHouseProductDao
				.getWareHouseProductByWare(wareId);
		return wareHouseProducts;
	}

	@Override
	public void addWareHouseProduct(WareHouseProduct wareHouseProduct) {
		wareHouseProductDao.addWareHouseProduct(wareHouseProduct);
	}

	public void updateWareHouseProduct(WareHouseProduct wareHouseProduct) {
		wareHouseProductDao.updateWareHouseProduct(wareHouseProduct);
	}

	public WareHouseProductDao getWareHouseProductDao() {
		return wareHouseProductDao;
	}

	public void setWareHouseProductDao(WareHouseProductDao wareHouseProductDao) {
		this.wareHouseProductDao = wareHouseProductDao;
	}

	@Override
	public List<WareHouseProduct> getOnlyWareHouseProducts(Integer wareId) {
		List<WareHouseProduct> wareHouseProducts = wareHouseProductDao
				.getOnlyWareHouseProducts(wareId);
		return wareHouseProducts;
	}

	@Override
	public void updateOnlyWareHouseProduct(WareHouseProduct wareHouseProduct) {
		wareHouseProductDao.updateOnlyWareHouseProduct(wareHouseProduct);
	}

	@Override
	public void addToWareHouseProduct(WareHouseProduct wareHouseProduct) {
		wareHouseProductDao.addToWareHouseProduct(wareHouseProduct);
	}

	public void minusWareHouseProduct(WareHouseProduct wareHouseProduct) {
		wareHouseProductDao.minusWareHouseProduct(wareHouseProduct);
	}

	public List<WareHouseProduct> existWareHouseProduct(
			WareHouseProduct wareHouseProduct) {
		List<WareHouseProduct> list = wareHouseProductDao
				.existWareHouseProduct(wareHouseProduct);
		return list;
	}

	@Override
	public List<WareHouseProduct> productOnlyWareHouseProduct(Integer wareId) {
		List<WareHouseProduct> list = wareHouseProductDao
				.productOnlyWareHouseProduct(wareId);
		return list;
	}

	@Override
	public List<WareHouseProduct> quantityHouseProducts(Integer wareId,
			Integer productId) {
		List<WareHouseProduct> list = wareHouseProductDao
				.quantityHouseProducts(wareId, productId);
		return list;
	}
}
