package swust.service.impl;

import java.util.List;

import swust.dao.SupplierDao;
import swust.dao.SupplierMaterialDao;
import swust.dao.MaterialDao;
import swust.model.SupplierMaterial;
import swust.service.SupplierMaterialService;

public class SupplierMaterialServiceImpl implements SupplierMaterialService {
	private SupplierDao supplierDao;
	private MaterialDao materialDao;
	private SupplierMaterialDao supplierMaterialDao;
	@Override
	public List<SupplierMaterial> getAllSupplierMaterials() {
		List<SupplierMaterial> supplierMaterials = supplierMaterialDao.getAllSupplierMaterials();
		return supplierMaterials;
	}

	@Override
	public void addSupplierMaterial(SupplierMaterial supplierMaterial) {
		supplierMaterialDao.addSupplierMaterial(supplierMaterial);
		
	}

	@Override
	public void delSupplierMaterial(Integer id) {
		supplierMaterialDao.delSupplierMaterial(id);
	}

	@Override
	public void updateSupplierMaterial(SupplierMaterial supplierMaterial) {
		supplierMaterialDao.updateSupplierMaterial(supplierMaterial);
		
	}

	@Override
	public SupplierMaterial getSupplierMaterial(Integer id) {
		return supplierMaterialDao.getSupplierMaterial(id);
	}

	@Override
	public List<SupplierMaterial> getSupplierMaterialByRemark() {
		return supplierMaterialDao.getSupplierMaterialByRemark();
	}

	@Override
	public List<SupplierMaterial> getSupplierMaterialByMaterials(String materialName) {
		return supplierMaterialDao.getSupplierMaterialByMaterials(materialName);
	}
	
	public SupplierDao getSupplierDao() {
		return supplierDao;
	}

	public void setSupplierDao(SupplierDao supplierDao) {
		this.supplierDao = supplierDao;
	}

	public MaterialDao getMaterialDao() {
		return materialDao;
	}

	public void setMaterialDao(MaterialDao materialDao) {
		this.materialDao = materialDao;
	}

	public SupplierMaterialDao getSupplierMaterialDao() {
		return supplierMaterialDao;
	}

	public void setSupplierMaterialDao(SupplierMaterialDao supplierMaterialDao) {
		this.supplierMaterialDao = supplierMaterialDao;
	}



	
	
}
