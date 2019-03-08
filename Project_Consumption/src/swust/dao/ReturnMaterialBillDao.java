package swust.dao;

import java.util.List;

import swust.model.ReturnMaterialBill;

public interface ReturnMaterialBillDao {
	// 查询所有
	public List<ReturnMaterialBill> getAllReturnMaterialBills();

	// 添加用户
	public void addReturnMaterialBill(ReturnMaterialBill returnMaterialBill);

	// 删除用户
	public void delReturnMaterialBill(Integer id);

	// 修改用户
	public void updateReturnMaterialBill(ReturnMaterialBill returnMaterialBill);

	// 单个查询
	public ReturnMaterialBill getReturnMaterialBill(Integer id);

	public List<ReturnMaterialBill> getReturnMaterialBillByBillState(Integer id);

	public ReturnMaterialBill getReturnMaterialBillByNo(String billNo);
}
