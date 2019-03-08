package swust.dao;

import java.util.List;

import swust.model.UselessMaterial;

public interface UselessMaterialDao {
	// 查询所有
	public List<UselessMaterial> getAllUselessMaterials();

	// 添加用户
	public void addUselessMaterial(UselessMaterial uselessMaterial);

	// 删除用户
	public void delUselessMaterial(Integer id);

	// 修改用户
	public void updateUselessMaterial(UselessMaterial uselessMaterial);

	// 单个查询
	public UselessMaterial getUselessMaterial(Integer id);

}
