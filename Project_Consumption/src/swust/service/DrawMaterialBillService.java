package swust.service;

import java.util.List;

import swust.model.DrawMaterialBill;

public interface DrawMaterialBillService {
	// 查询所有
	public List<DrawMaterialBill> getAllDrawMaterialBills();

	// 添加用户
	public void addDrawMaterialBill(DrawMaterialBill drawMaterialBill);

	// 删除用户
	public void delDrawMaterialBill(Integer id);

	// 修改用户
	public void updateDrawMaterialBill(DrawMaterialBill drawMaterialBill);

	// 单个查询
	public DrawMaterialBill getDrawMaterialBill(Integer id);

	public List<DrawMaterialBill> getDrawMaterialBillByBillState(Integer id);

	public List<DrawMaterialBill> getDrawMaterialBillByNo(String billNo);

}
