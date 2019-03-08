package swust.service.impl;

import java.util.List;

import swust.dao.ReturnMaterialBillDao;
import swust.model.ReturnMaterialBill;
import swust.service.ReturnMaterialBillService;

public class ReturnMaterialBillServiceImpl implements ReturnMaterialBillService {
	private ReturnMaterialBillDao returnMaterialBillDao;

	@Override
	public List<ReturnMaterialBill> getAllReturnMaterialBills() {
		List<ReturnMaterialBill> returnMaterialBills = returnMaterialBillDao
				.getAllReturnMaterialBills();
		return returnMaterialBills;
	}

	@Override
	public void addReturnMaterialBill(ReturnMaterialBill returnMaterialBill) {
		returnMaterialBillDao.addReturnMaterialBill(returnMaterialBill);
	}

	@Override
	public void delReturnMaterialBill(Integer id) {
		returnMaterialBillDao.delReturnMaterialBill(id);
	}

	@Override
	public void updateReturnMaterialBill(ReturnMaterialBill returnMaterialBill) {
		returnMaterialBillDao.updateReturnMaterialBill(returnMaterialBill);
	}

	@Override
	public ReturnMaterialBill getReturnMaterialBill(Integer id) {
		return returnMaterialBillDao.getReturnMaterialBill(id);
	}

	@Override
	public List<ReturnMaterialBill> getReturnMaterialBillByBillState(Integer id) {
		return returnMaterialBillDao.getReturnMaterialBillByBillState(id);
	}

	public ReturnMaterialBillDao getReturnMaterialBillDao() {
		return returnMaterialBillDao;
	}

	public void setReturnMaterialBillDao(
			ReturnMaterialBillDao returnMaterialBillDao) {
		this.returnMaterialBillDao = returnMaterialBillDao;
	}

	public ReturnMaterialBill getReturnMaterialBillByNo(String billNo) {
		return returnMaterialBillDao.getReturnMaterialBillByNo(billNo);
	}

}
