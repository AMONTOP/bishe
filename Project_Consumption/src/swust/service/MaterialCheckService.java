package swust.service;

import java.util.List;

import swust.model.MaterialCheck;

public interface MaterialCheckService {
	// 查询所有
	public List<MaterialCheck> getAllMaterialChecks();

	// 添加用户
	public void addMaterialCheck(MaterialCheck materialCheck);

	// 删除用户
	public void delMaterialCheck(Integer id);

	// 修改用户
	public void updateMaterialCheck(MaterialCheck materialCheck);

	// 单个查询
	public MaterialCheck getMaterialCheck(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<MaterialCheck> getMaterialCheckByBillId(Integer id);

	public List<MaterialCheck> getMaterialCheckByState(Integer id);
}
