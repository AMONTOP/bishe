package swust.dao;

import java.util.List;

import swust.model.MwareHouseMaterial;

public interface MwareHouseMaterialDao {
	// 查询所有
	public List<MwareHouseMaterial> getAllMwareHouseMaterials();

	// 添加
	public void addMwareHouseMaterial(MwareHouseMaterial wareHouseMaterial);

	// 删除用户
	// public void delMwareHouseMaterial(Integer id);

	// 修改用户
	// public void updateMwareHouseMaterial(MwareHouseMaterial material);

	// 单个查询
	// public MwareHouseMaterial getMwareHouseMaterial(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<MwareHouseMaterial> getMwareHouseMaterialByWare(Integer wareId);

	public void updateMwareHouseMaterial(MwareHouseMaterial wareHouseMaterial);

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
