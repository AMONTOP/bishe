package swust.service.impl;

import java.util.List;

import swust.dao.MwareHouseMaterialDao;
import swust.model.MwareHouseMaterial;
import swust.service.MwareHouseMaterialService;

public class MwareHouseMaterialServiceImpl implements MwareHouseMaterialService {
	private MwareHouseMaterialDao wareHouseMaterialDao;

	@Override
	public List<MwareHouseMaterial> getAllMwareHouseMaterials() {
		List<MwareHouseMaterial> wareHouseMaterials = wareHouseMaterialDao
				.getAllMwareHouseMaterials();
		return wareHouseMaterials;
	}

	@Override
	public List<MwareHouseMaterial> getMwareHouseMaterialByWare(Integer wareId) {
		List<MwareHouseMaterial> wareHouseMaterials = wareHouseMaterialDao
				.getMwareHouseMaterialByWare(wareId);
		return wareHouseMaterials;
	}

	@Override
	public void addMwareHouseMaterial(MwareHouseMaterial wareHouseMaterial) {
		wareHouseMaterialDao.addMwareHouseMaterial(wareHouseMaterial);
	}

	public void updateMwareHouseMaterial(MwareHouseMaterial wareHouseMaterial) {
		wareHouseMaterialDao.updateMwareHouseMaterial(wareHouseMaterial);
	}

	public MwareHouseMaterialDao getMwareHouseMaterialDao() {
		return wareHouseMaterialDao;
	}

	public void setMwareHouseMaterialDao(
			MwareHouseMaterialDao wareHouseMaterialDao) {
		this.wareHouseMaterialDao = wareHouseMaterialDao;
	}

	public void minusMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		wareHouseMaterialDao.minusMwareHouseMaterial(mwareHouseMaterial);
	}

	@Override
	public List<MwareHouseMaterial> getOnlyMwareHouseMaterials(Integer wareId) {
		List<MwareHouseMaterial> wareHouseMaterials = wareHouseMaterialDao
				.getOnlyMwareHouseMaterials(wareId);
		return wareHouseMaterials;
	}

	@Override
	public void updateOnlyMwareHouseMaterial(
			MwareHouseMaterial wareHouseMaterial) {
		wareHouseMaterialDao.updateOnlyMwareHouseMaterial(wareHouseMaterial);
	}

	@Override
	public void addToMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		wareHouseMaterialDao.addToMwareHouseMaterial(mwareHouseMaterial);
	}

	@Override
	public void addTo2MwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		wareHouseMaterialDao.addTo2MwareHouseMaterial(mwareHouseMaterial);
	}

	public List<MwareHouseMaterial> existMwareHouseMaterial(
			MwareHouseMaterial wareHouseMaterial) {
		List<MwareHouseMaterial> list = wareHouseMaterialDao
				.existMwareHouseMaterial(wareHouseMaterial);
		return list;
	}

	@Override
	public List<MwareHouseMaterial> quantityHouseMaterials(Integer wareId,
			Integer productId) {
		List<MwareHouseMaterial> list = wareHouseMaterialDao
				.quantityHouseMaterials(wareId, productId);
		return list;
	}

	@Override
	public List<MwareHouseMaterial> materialOnlyMwareHouseMaterial(
			Integer wareId) {
		List<MwareHouseMaterial> list = wareHouseMaterialDao
				.materialOnlyMwareHouseMaterial(wareId);
		return list;
	}

	@Override
	public List<MwareHouseMaterial> getByMaterialId() {
		List<MwareHouseMaterial> list = wareHouseMaterialDao.getByMaterialId();
		return list;
	}

	public MwareHouseMaterial getById(Integer id) {
		return wareHouseMaterialDao.getById(id);
	}
}
