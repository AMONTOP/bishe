package swust.service;

import java.util.List;

import swust.model.ReturnMaterialBillMaterial;

public interface ReturnMaterialBillMaterialService {
	// 查询所有
	public List<ReturnMaterialBillMaterial> getAllReturnMaterialBillMaterials();

	// 添加用户
	public void addReturnMaterialBillMaterial(
			ReturnMaterialBillMaterial returnMaterialBillMaterial);

	// 删除用户
	public void delReturnMaterialBillMaterial(Integer id);

	// 修改用户
	public void updateReturnMaterialBillMaterial(
			ReturnMaterialBillMaterial returnMaterialBillMaterial);

	// 单个查询
	public ReturnMaterialBillMaterial getReturnMaterialBillMaterial(Integer id);

	public List<ReturnMaterialBillMaterial> getByBillId(Integer id);
}
