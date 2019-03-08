package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ProductMaterialDao;
import swust.model.ProductMaterial;

public class ProductMaterialDaoImpl extends BaseDao implements
		ProductMaterialDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<ProductMaterial> getAllProductMaterials() {
		Query query = sessionFactory.openSession().createQuery(
				"from ProductMaterial");
		List<ProductMaterial> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addProductMaterial(ProductMaterial productMaterial) {
		Session session = sessionFactory.openSession();
		session.save(productMaterial);
		session.close();
	}

	@Override
	public void delProductMaterial(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete ProductMaterial p where p.productMaterialId="
								+ id).executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateProductMaterial(ProductMaterial productMaterial) {
		Session session = getSessionFactory().openSession();
		String hql = ("update ProductMaterial p set p.product.productId = ?,p.material.materialId = ?,p.quantity = ? where p.productMaterialId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, productMaterial.getProduct().getProductId());
		query.setParameter(1, productMaterial.getMaterial().getMaterialId());
		query.setParameter(2, productMaterial.getQuantity());
		query.setParameter(3, productMaterial.getProductMaterialId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public ProductMaterial getProductMaterial(Integer id) {
		ProductMaterial productMaterial = (ProductMaterial) sessionFactory
				.openSession()
				.createQuery(
						"from ProductMaterial p where p.productMaterialId ="
								+ id).uniqueResult();
		sessionFactory.openSession().close();
		return productMaterial;
	}

	@Override
	public List<ProductMaterial> getPMByProductId(Integer id) {
		List<ProductMaterial> productMaterial = sessionFactory
				.openSession()
				.createQuery(
						"from ProductMaterial p where p.product.productId ="
								+ id).list();
		sessionFactory.openSession().close();
		return productMaterial;
	}

}
