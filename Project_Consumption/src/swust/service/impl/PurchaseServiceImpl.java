package swust.service.impl;

import java.util.List;

import swust.dao.PurchaseDao;
import swust.model.Purchase;
import swust.service.PurchaseService;

public class PurchaseServiceImpl implements PurchaseService {
	private PurchaseDao purchaseDao;

	@Override
	public List<Purchase> getAllPurchases() {
		List<Purchase> purchases = purchaseDao.getAllPurchases();
		return purchases;
	}

	@Override
	public void addPurchase(Purchase purchase) {
		purchaseDao.addPurchase(purchase);
	}

	@Override
	public void delPurchase(Integer id) {
		purchaseDao.delPurchase(id);
	}

	@Override
	public void updatePurchase(Purchase purchase) {
		purchaseDao.updatePurchase(purchase);
	}

	@Override
	public Purchase getPurchase(Integer id) {
		return purchaseDao.getPurchase(id);
	}

	@Override
	public List<Purchase> getPurchaseByName(String purchaseName) {
		return purchaseDao.getPurchaseByName(purchaseName);
	}

	public PurchaseDao getPurchaseDao() {
		return purchaseDao;
	}

	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}

}
