package swust.service.impl;

import java.util.List;

import swust.dao.UselessProductDao;
import swust.model.UselessProduct;
import swust.service.UselessProductService;

public class UselessProductServiceImpl implements UselessProductService {
	private UselessProductDao uselessProductDao;

	@Override
	public List<UselessProduct> getAllUselessProducts() {
		List<UselessProduct> uselessProducts = uselessProductDao
				.getAllUselessProducts();
		return uselessProducts;
	}

	@Override
	public void addUselessProduct(UselessProduct uselessProduct) {
		uselessProductDao.addUselessProduct(uselessProduct);
	}

	@Override
	public void delUselessProduct(Integer id) {
		uselessProductDao.delUselessProduct(id);
	}

	@Override
	public void updateUselessProduct(UselessProduct uselessProduct) {
		uselessProductDao.updateUselessProduct(uselessProduct);

	}

	@Override
	public UselessProduct getUselessProduct(Integer id) {
		return uselessProductDao.getUselessProduct(id);
	}

	public UselessProductDao getUselessProductDao() {
		return uselessProductDao;
	}

	public void setUselessProductDao(UselessProductDao uselessProductDao) {
		this.uselessProductDao = uselessProductDao;
	}

}
