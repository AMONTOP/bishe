package swust.service.impl;

import java.util.List;

import swust.dao.MaterialCategoryDao;
import swust.model.MaterialCategory;
import swust.service.MaterialCategoryService;

public class MaterialCategoryServiceImpl implements MaterialCategoryService {
	private MaterialCategoryDao materialCategoryDao;
	@Override
	public List<MaterialCategory> getAllMaterialCategorys() {
		List<MaterialCategory> materialCategorys = materialCategoryDao.getAllMaterialCategorys();
		return materialCategorys;
	}

	@Override
	public void addMaterialCategory(MaterialCategory materialCategory) {
		materialCategoryDao.addMaterialCategory(materialCategory);
	}

	@Override
	public void delMaterialCategory(Integer id) {
		materialCategoryDao.delMaterialCategory(id);
	}

	@Override
	public void updateMaterialCategory(MaterialCategory materialCategory) {
		materialCategoryDao.updateMaterialCategory(materialCategory);
	}

	@Override
	public MaterialCategory getMaterialCategory(Integer id) {
		return materialCategoryDao.getMaterialCategory(id);
	}

	@Override
	public List<MaterialCategory> getMaterialCategoryByName(String categoryName) {
		return materialCategoryDao.getMaterialCategoryByName(categoryName);
	}

	public MaterialCategoryDao getMaterialCategoryDao() {
		return materialCategoryDao;
	}

	public void setMaterialCategoryDao(MaterialCategoryDao materialCategoryDao) {
		this.materialCategoryDao = materialCategoryDao;
	}
}
