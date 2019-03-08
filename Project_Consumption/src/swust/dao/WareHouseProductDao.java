package swust.dao;

import java.util.List;

import swust.model.WareHouseProduct;

public interface WareHouseProductDao {
	// 查询所有
	public List<WareHouseProduct> getAllWareHouseProducts();

	// 添加
	public void addWareHouseProduct(WareHouseProduct wareHouseProduct);

	// 删除用户
	// public void delWareHouseProduct(Integer id);

	// 修改用户
	// public void updateWareHouseProduct(WareHouseProduct product);

	// 单个查询
	// public WareHouseProduct getWareHouseProduct(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<WareHouseProduct> getWareHouseProductByWare(Integer wareId);

	public void updateWareHouseProduct(WareHouseProduct wareHouseProduct);

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
