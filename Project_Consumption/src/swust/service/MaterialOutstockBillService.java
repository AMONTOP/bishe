package swust.service;

import java.io.File;
import java.util.List;

import swust.model.Material;
import swust.model.MaterialOutstockBill;

public interface MaterialOutstockBillService {
	// 查询所有
	public List<MaterialOutstockBill> getAllMaterialOutstockBills();

	// 添加用户
	public void addMaterialOutstockBill(
			MaterialOutstockBill materialOutstockBill);

	// 删除用户
	public void delMaterialOutstockBill(Integer id);

	// 修改用户
	public void updateMaterialOutstockBill(
			MaterialOutstockBill materialOutstockBill);

	// 单个查询
	public MaterialOutstockBill getMaterialOutstockBill(Integer id);

	public List<MaterialOutstockBill> getMaterialOutstockBillByBillState(
			Integer id);

	public List<MaterialOutstockBill> getBillNoByOnly();

	public List<MaterialOutstockBill> getSimpleByBillNo(String billNo);

	public List<Material> getMaterialDistinct(String billNo);

	public void addToupdateMaterialOutstockBill(
			MaterialOutstockBill materialOutstockBill);

	public void updateMaterialOutstockBillMaterial(
			MaterialOutstockBill materialOutstockBill);

	public void importExcel(File billmaterialExcel,
			String billmaterialExcelFileName);
}
