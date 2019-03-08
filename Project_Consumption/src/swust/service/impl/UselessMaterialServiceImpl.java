package swust.service.impl;

import java.util.List;

import swust.dao.UselessMaterialDao;
import swust.model.UselessMaterial;
import swust.service.UselessMaterialService;

public class UselessMaterialServiceImpl implements UselessMaterialService {
	private UselessMaterialDao uselessMaterialDao;

	@Override
	public List<UselessMaterial> getAllUselessMaterials() {
		List<UselessMaterial> uselessMaterials = uselessMaterialDao
				.getAllUselessMaterials();
		return uselessMaterials;
	}

	@Override
	public void addUselessMaterial(UselessMaterial uselessMaterial) {
		uselessMaterialDao.addUselessMaterial(uselessMaterial);
	}

	@Override
	public void delUselessMaterial(Integer id) {
		uselessMaterialDao.delUselessMaterial(id);
	}

	@Override
	public void updateUselessMaterial(UselessMaterial uselessMaterial) {
		uselessMaterialDao.updateUselessMaterial(uselessMaterial);

	}

	@Override
	public UselessMaterial getUselessMaterial(Integer id) {
		return uselessMaterialDao.getUselessMaterial(id);
	}

	public UselessMaterialDao getUselessMaterialDao() {
		return uselessMaterialDao;
	}

	public void setUselessMaterialDao(UselessMaterialDao uselessMaterialDao) {
		this.uselessMaterialDao = uselessMaterialDao;
	}

}
