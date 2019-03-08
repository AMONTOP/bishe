package swust.service.impl;

import java.util.List;

import swust.dao.MaterialCheckDao;
import swust.dao.MaterialDao;
import swust.model.Material;
import swust.model.MaterialCheck;
import swust.service.MaterialCheckService;

public class MaterialCheckServiceImpl implements MaterialCheckService {
	private MaterialDao materialDao;
	private MaterialCheckDao materialCheckDao;

	@Override
	public List<MaterialCheck> getAllMaterialChecks() {
		List<MaterialCheck> materialChecks = materialCheckDao
				.getAllMaterialChecks();
		List<Material> materials = materialDao.getAllMaterials();
		return materialChecks;
	}

	@Override
	public void addMaterialCheck(MaterialCheck materialCheck) {
		materialCheckDao.addMaterialCheck(materialCheck);
	}

	@Override
	public void delMaterialCheck(Integer id) {
		materialCheckDao.delMaterialCheck(id);
	}

	@Override
	public void updateMaterialCheck(MaterialCheck materialCheck) {
		materialCheckDao.updateMaterialCheck(materialCheck);
	}

	@Override
	public MaterialCheck getMaterialCheck(Integer id) {
		return materialCheckDao.getMaterialCheck(id);
	}

	@Override
	public List<MaterialCheck> getMaterialCheckByBillId(Integer id) {
		return materialCheckDao.getMaterialCheckByBillId(id);
	}

	public MaterialDao getMaterialDao() {
		return materialDao;
	}

	public void setMaterialDao(MaterialDao materialDao) {
		this.materialDao = materialDao;
	}

	public MaterialCheckDao getMaterialCheckDao() {
		return materialCheckDao;
	}

	public void setMaterialCheckDao(MaterialCheckDao materialCheckDao) {
		this.materialCheckDao = materialCheckDao;
	}

	@Override
	public List<MaterialCheck> getMaterialCheckByState(Integer id) {
		return materialCheckDao.getMaterialCheckByState(id);
	}

}
