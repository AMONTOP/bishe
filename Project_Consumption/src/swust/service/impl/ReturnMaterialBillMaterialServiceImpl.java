package swust.service.impl;

import java.util.List;

import swust.dao.MaterialDao;
import swust.dao.ReturnMaterialBillDao;
import swust.dao.ReturnMaterialBillMaterialDao;
import swust.model.ReturnMaterialBillMaterial;
import swust.service.ReturnMaterialBillMaterialService;

public class ReturnMaterialBillMaterialServiceImpl implements
		ReturnMaterialBillMaterialService {
	private ReturnMaterialBillDao returnMaterialBillDao;
	private MaterialDao materialDao;
	private ReturnMaterialBillMaterialDao returnMaterialBillMaterialDao;

	@Override
	public List<ReturnMaterialBillMaterial> getAllReturnMaterialBillMaterials() {
		List<ReturnMaterialBillMaterial> returnMaterialBillMaterials = returnMaterialBillMaterialDao
				.getAllReturnMaterialBillMaterials();
		return returnMaterialBillMaterials;
	}

	@Override
	public void addReturnMaterialBillMaterial(
			ReturnMaterialBillMaterial returnMaterialBillMaterial) {
		returnMaterialBillMaterialDao
				.addReturnMaterialBillMaterial(returnMaterialBillMaterial);
	}

	@Override
	public void delReturnMaterialBillMaterial(Integer id) {
		returnMaterialBillMaterialDao.delReturnMaterialBillMaterial(id);
	}

	@Override
	public void updateReturnMaterialBillMaterial(
			ReturnMaterialBillMaterial returnMaterialBillMaterial) {
		returnMaterialBillMaterialDao
				.updateReturnMaterialBillMaterial(returnMaterialBillMaterial);
	}

	@Override
	public ReturnMaterialBillMaterial getReturnMaterialBillMaterial(Integer id) {
		return returnMaterialBillMaterialDao.getReturnMaterialBillMaterial(id);
	}

	public List<ReturnMaterialBillMaterial> getByBillId(Integer id) {
		return returnMaterialBillMaterialDao.getByBillId(id);
	}

	public ReturnMaterialBillDao getReturnMaterialBillDao() {
		return returnMaterialBillDao;
	}

	public void setReturnMaterialBillDao(
			ReturnMaterialBillDao ReturnMaterialBillDao) {
		this.returnMaterialBillDao = ReturnMaterialBillDao;
	}

	public MaterialDao getMaterialDao() {
		return materialDao;
	}

	public void setMaterialDao(MaterialDao materialDao) {
		this.materialDao = materialDao;
	}

	public ReturnMaterialBillMaterialDao getReturnMaterialBillMaterialDao() {
		return returnMaterialBillMaterialDao;
	}

	public void setReturnMaterialBillMaterialDao(
			ReturnMaterialBillMaterialDao returnMaterialBillMaterialDao) {
		this.returnMaterialBillMaterialDao = returnMaterialBillMaterialDao;
	}

}
