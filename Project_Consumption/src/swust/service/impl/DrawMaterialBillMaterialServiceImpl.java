package swust.service.impl;

import java.util.List;

import swust.dao.DrawMaterialBillDao;
import swust.dao.DrawMaterialBillMaterialDao;
import swust.dao.MaterialDao;
import swust.model.DrawMaterialBillMaterial;
import swust.service.DrawMaterialBillMaterialService;


public class DrawMaterialBillMaterialServiceImpl implements DrawMaterialBillMaterialService {
	private DrawMaterialBillDao drawMaterialBillDao;
	private MaterialDao materialDao;
	private DrawMaterialBillMaterialDao drawMaterialBillMaterialDao;
	@Override
	public List<DrawMaterialBillMaterial> getAllDrawMaterialBillMaterials() {
		List<DrawMaterialBillMaterial> drawMaterialBillMaterials = drawMaterialBillMaterialDao.getAllDrawMaterialBillMaterials();
		return drawMaterialBillMaterials;
	}

	@Override
	public void addDrawMaterialBillMaterial(DrawMaterialBillMaterial drawMaterialBillMaterial) {
		drawMaterialBillMaterialDao.addDrawMaterialBillMaterial(drawMaterialBillMaterial);
	}

	@Override
	public void delDrawMaterialBillMaterial(Integer id) {
		drawMaterialBillMaterialDao.delDrawMaterialBillMaterial(id);
	}

	@Override
	public void updateDrawMaterialBillMaterial(DrawMaterialBillMaterial drawMaterialBillMaterial) {
		drawMaterialBillMaterialDao.updateDrawMaterialBillMaterial(drawMaterialBillMaterial);
	}
	
	@Override
	public DrawMaterialBillMaterial getDrawMaterialBillMaterial(Integer id) {
		return drawMaterialBillMaterialDao.getDrawMaterialBillMaterial(id);
	}

	public DrawMaterialBillDao getDrawMaterialBillDao() {
		return drawMaterialBillDao;
	}

	public void setDrawMaterialBillDao(DrawMaterialBillDao drawMaterialBillDao) {
		this.drawMaterialBillDao = drawMaterialBillDao;
	}

	public MaterialDao getMaterialDao() {
		return materialDao;
	}

	public void setMaterialDao(MaterialDao materialDao) {
		this.materialDao = materialDao;
	}

	public DrawMaterialBillMaterialDao getDrawMaterialBillMaterialDao() {
		return drawMaterialBillMaterialDao;
	}

	public void setDrawMaterialBillMaterialDao(
			DrawMaterialBillMaterialDao drawMaterialBillMaterialDao) {
		this.drawMaterialBillMaterialDao = drawMaterialBillMaterialDao;
	}

	public List<DrawMaterialBillMaterial> getByBillId(Integer id){
		return drawMaterialBillMaterialDao.getByBillId(id);
	}

}
