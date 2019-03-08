package swust.service;

import java.util.List;

import swust.model.MwareHouseMaterial;

public interface MwareHouseMaterialService {
	public List<MwareHouseMaterial> getAllMwareHouseMaterials();

	public List<MwareHouseMaterial> getMwareHouseMaterialByWare(Integer wareId);

	public void updateMwareHouseMaterial(MwareHouseMaterial wareHouseMaterial);

	public void addMwareHouseMaterial(MwareHouseMaterial wareHouseMaterial);

	public List<MwareHouseMaterial> getOnlyMwareHouseMaterials(Integer wareId);

	public void updateOnlyMwareHouseMaterial(
			MwareHouseMaterial wareHouseMaterial);

	public void addToMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial);

	public void addTo2MwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial);

	public List<MwareHouseMaterial> existMwareHouseMaterial(
			MwareHouseMaterial wareHouseMaterial);

	public List<MwareHouseMaterial> materialOnlyMwareHouseMaterial(
			Integer wareId);

	public List<MwareHouseMaterial> quantityHouseMaterials(Integer wareId,
			Integer materialId);

	public List<MwareHouseMaterial> getByMaterialId();

	public void minusMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial);

	public MwareHouseMaterial getById(Integer id);
}
