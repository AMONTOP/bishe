package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.SupplierMaterialDao;
import swust.model.SupplierMaterial;

public class SupplierMaterialDaoImpl extends BaseDao implements
		SupplierMaterialDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<SupplierMaterial> getAllSupplierMaterials() {
		Query query = sessionFactory.openSession().createQuery(
				"from SupplierMaterial");
		List<SupplierMaterial> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addSupplierMaterial(SupplierMaterial supplier) {
		Session session = sessionFactory.openSession();
		session.save(supplier);
		session.close();
	}

	@Override
	public void delSupplierMaterial(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete SupplierMaterial o where o.supplierMaterialId="
								+ id).executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateSupplierMaterial(SupplierMaterial supplierMaterial) {
		Session session = getSessionFactory().openSession();
		String hql = ("update SupplierMaterial b set b.supplier.supplierId = ?,b.material.materialId = ?,b.price = ?,remark = ? where b.supplierMaterialId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, supplierMaterial.getSupplier().getSupplierId());
		query.setParameter(1, supplierMaterial.getMaterial().getMaterialId());
		query.setParameter(2, supplierMaterial.getPrice());
		query.setParameter(3, supplierMaterial.getRemark());
		query.setParameter(4, supplierMaterial.getSupplierMaterialId());
		query.executeUpdate();
		session.close();

	}

	@Override
	public SupplierMaterial getSupplierMaterial(Integer id) {
		SupplierMaterial supplierMaterial = (SupplierMaterial) sessionFactory
				.openSession()
				.createQuery(
						"from SupplierMaterial p where p.supplierMaterialId ="
								+ id).uniqueResult();
		sessionFactory.openSession().close();
		return supplierMaterial;
	}

	public List<SupplierMaterial> getSupplierMaterialByRemark() {
		String remark = "0";
		List<SupplierMaterial> supplierMaterial = (List<SupplierMaterial>) sessionFactory
				.openSession()
				.createQuery(
						"from SupplierMaterial p where p.remark ='" + remark
								+ "'").list();
		sessionFactory.openSession().close();
		return supplierMaterial;
	}

	@Override
	public List<SupplierMaterial> getSupplierMaterialByMaterials(
			String materialName) {
		List<SupplierMaterial> supplierMaterial = (List<SupplierMaterial>) sessionFactory
				.openSession()
				.createQuery(
						"from SupplierMaterial p where p.material.materialName like"
								+ "'%" + materialName + "%'").list();
		sessionFactory.openSession().close();
		return supplierMaterial;
	}

}
