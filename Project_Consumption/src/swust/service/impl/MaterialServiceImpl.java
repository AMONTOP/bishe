package swust.service.impl;

import java.util.List;

import swust.dao.MaterialCategoryDao;
import swust.dao.MaterialDao;
import swust.model.Material;
import swust.model.MaterialCategory;
import swust.service.MaterialService;

public class MaterialServiceImpl implements MaterialService{
	private MaterialDao materialDao;
	private MaterialCategoryDao materialCategoryDao;
	@Override
	public List<Material> getAllMaterials() {
		List<Material> materials = materialDao.getAllMaterials();
		List<MaterialCategory> materialCategories = materialCategoryDao.getAllMaterialCategorys();
		return materials;
	}

	@Override
	public void addMaterial(Material material) {
		materialDao.addMaterial(material);
	}

	@Override
	public void delMaterial(Integer id) {
		materialDao.delMaterial(id);
	}

	@Override
	public void updateMaterial(Material material) {
		materialDao.updateMaterial(material);
	}

	@Override
	public Material getMaterial(Integer id) {
		return materialDao.getMaterial(id);
	}

	@Override
	public List<Material> getMaterialByName(String materialName) {
		return materialDao.getMaterialByName(materialName);
	}

	public MaterialDao getMaterialDao() {
		return materialDao;
	}

	public void setMaterialDao(MaterialDao materialDao) {
		this.materialDao = materialDao;
	}

	public MaterialCategoryDao getMaterialCategoryDao() {
		return materialCategoryDao;
	}

	public void setMaterialCategoryDao(MaterialCategoryDao materialCategoryDao) {
		this.materialCategoryDao = materialCategoryDao;
	}


	
}
