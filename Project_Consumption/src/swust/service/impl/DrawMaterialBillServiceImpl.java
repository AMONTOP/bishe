package swust.service.impl;

import java.util.List;

import swust.dao.DrawMaterialBillDao;
import swust.model.DrawMaterialBill;
import swust.service.DrawMaterialBillService;

public class DrawMaterialBillServiceImpl implements DrawMaterialBillService {
	private DrawMaterialBillDao drawMaterialBillDao;

	@Override
	public List<DrawMaterialBill> getAllDrawMaterialBills() {
		List<DrawMaterialBill> drawMaterialBills = drawMaterialBillDao
				.getAllDrawMaterialBills();
		return drawMaterialBills;
	}

	@Override
	public void addDrawMaterialBill(DrawMaterialBill drawMaterialBill) {
		drawMaterialBillDao.addDrawMaterialBill(drawMaterialBill);
	}

	@Override
	public void delDrawMaterialBill(Integer id) {
		drawMaterialBillDao.delDrawMaterialBill(id);
	}

	@Override
	public void updateDrawMaterialBill(DrawMaterialBill drawMaterialBill) {
		drawMaterialBillDao.updateDrawMaterialBill(drawMaterialBill);
	}

	@Override
	public DrawMaterialBill getDrawMaterialBill(Integer id) {
		return drawMaterialBillDao.getDrawMaterialBill(id);
	}

	@Override
	public List<DrawMaterialBill> getDrawMaterialBillByBillState(Integer id) {
		return drawMaterialBillDao.getDrawMaterialBillByBillState(id);
	}

	public DrawMaterialBillDao getDrawMaterialBillDao() {
		return drawMaterialBillDao;
	}

	public void setDrawMaterialBillDao(DrawMaterialBillDao drawMaterialBillDao) {
		this.drawMaterialBillDao = drawMaterialBillDao;
	}

	public List<DrawMaterialBill> getDrawMaterialBillByNo(String billNo) {
		return drawMaterialBillDao.getDrawMaterialBillByNo(billNo);
	}

}
