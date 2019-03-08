package swust.dao;

import java.util.List;

import swust.model.Purchase;

public interface PurchaseDao {
	// 查询所有
	public List<Purchase> getAllPurchases();

	// 添加用户
	public void addPurchase(Purchase purchase);

	// 删除用户
	public void delPurchase(Integer id);

	// 修改用户
	public void updatePurchase(Purchase purchase);

	// 单个查询
	public Purchase getPurchase(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<Purchase> getPurchaseByName(String purchaseName);
}
