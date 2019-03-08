package swust.dao;

import java.util.List;

import swust.model.Material;
import swust.model.MaterialInstockBill;

public interface MaterialInstockBillDao {
	// 查询所有
	public List<MaterialInstockBill> getAllMaterialInstockBills();

	// 添加用户
	public void addMaterialInstockBill(MaterialInstockBill materialInstockBill);

	// 删除用户
	public void delMaterialInstockBill(Integer id);

	// 修改用户
	public void updateMaterialInstockBill(
			MaterialInstockBill materialInstockBill);

	// 单个查询
	public MaterialInstockBill getMaterialInstockBill(Integer id);

	public List<MaterialInstockBill> getMaterialInstockBillByBillState(
			Integer id);

	public List<MaterialInstockBill> getBillNoByOnly();

	public List<MaterialInstockBill> getSimpleByBillNo(String billNo);

	public List<Material> getMaterialDistinct(String billNo);

	public void addToupdateMaterialInstockBill(
			MaterialInstockBill materialInstockBill);

	public void updateMaterialInstockBillMaterial(
			MaterialInstockBill materialInstockBill);

	public void addToMaterialCheck(MaterialInstockBill materialInstockBill);

}
