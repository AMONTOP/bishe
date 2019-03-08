package swust.service;

import java.util.List;

import swust.model.WareHouseProduct;

public interface WareHouseProductService {
	public List<WareHouseProduct> getAllWareHouseProducts();

	public List<WareHouseProduct> getWareHouseProductByWare(Integer wareId);

	public void updateWareHouseProduct(WareHouseProduct wareHouseProduct);

	public void addWareHouseProduct(WareHouseProduct wareHouseProduct);

	public List<WareHouseProduct> getOnlyWareHouseProducts(Integer wareId);

	public void updateOnlyWareHouseProduct(WareHouseProduct wareHouseProduct);

	public void addToWareHouseProduct(WareHouseProduct wareHouseProduct);

	public List<WareHouseProduct> existWareHouseProduct(
			WareHouseProduct wareHouseProduct);

	public List<WareHouseProduct> productOnlyWareHouseProduct(Integer wareId);

	public List<WareHouseProduct> quantityHouseProducts(Integer wareId,
			Integer productId);

	public void minusWareHouseProduct(WareHouseProduct wareHouseProduct);
}
