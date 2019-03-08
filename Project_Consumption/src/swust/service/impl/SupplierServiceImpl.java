package swust.service.impl;

import java.util.List;

import swust.dao.SupplierDao;
import swust.model.Supplier;
import swust.service.SupplierService;

public class SupplierServiceImpl implements SupplierService {
	private SupplierDao supplierDao;
	@Override
	public List<Supplier> getAllSuppliers() {
		List<Supplier> suppliers = supplierDao.getAllSuppliers();       
        return suppliers;
	}

	@Override
	public void addSupplier(Supplier supplier) {
		supplierDao.addSupplier(supplier);
	}

	@Override
	public void delSupplier(Integer id) {
		supplierDao.delSupplier(id);
	}

	@Override
	public void updateSupplier(Supplier supplier) {
		supplierDao.updateSupplier(supplier);
	}

		
	@Override
	public Supplier getSupplier(Integer id) {
		return supplierDao.getSupplier(id);
	}
	
	@Override
	public List<Supplier> getSupplierByName(String supplierName) {
		return supplierDao.getSupplierByName(supplierName);
	}
	public SupplierDao getSupplierDao() {
		return supplierDao;
	}

	public void setSupplierDao(SupplierDao supplierDao) {
		this.supplierDao = supplierDao;
	}

	

	
}
