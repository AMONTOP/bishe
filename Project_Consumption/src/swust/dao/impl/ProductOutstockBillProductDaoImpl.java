package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ProductOutstockBillProductDao;
import swust.model.ProductOutstockBillProduct;

public class ProductOutstockBillProductDaoImpl implements ProductOutstockBillProductDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public List<ProductOutstockBillProduct> getAllProductOutstockBillProducts() {
		Query query = sessionFactory.openSession().createQuery("from ProductOutstockBillProduct");
		List<ProductOutstockBillProduct> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addProductOutstockBillProduct(
			ProductOutstockBillProduct productOutstockBillProduct) {
		Session session = sessionFactory.openSession();
		session.save(productOutstockBillProduct);
		session.close();
	}

	@Override
	public void delProductOutstockBillProduct(Integer id) {
		sessionFactory.openSession().createQuery("delete ProductOutstockBillProduct p where p.billMaterialId="+id).executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateProductOutstockBillProduct(ProductOutstockBillProduct productOutstockBillProduct) {
		Session session = getSessionFactory().openSession();
        String hql = ("update ProductOutstockBillProduct c set c.productOutstockBill.billId = ?,c.product.productId = ?,c.quantity = ?,c.remark = ? where c.billProductId = ?");  
        Query query = sessionFactory.openSession().createQuery(hql);
        query.setParameter(0, productOutstockBillProduct.getProductOutstockBill().getBillId());
        query.setParameter(1, productOutstockBillProduct.getProduct().getProductId());
        query.setParameter(2, productOutstockBillProduct.getQuantity());
        query.setParameter(3, productOutstockBillProduct.getRemark());
        query.setParameter(4, productOutstockBillProduct.getBillProductId());
        query.executeUpdate();  
        session.close();
		
	}
	@Override
	public ProductOutstockBillProduct getProductOutstockBillProduct(Integer id) {
		ProductOutstockBillProduct productOutstockBillProduct = (ProductOutstockBillProduct)sessionFactory.openSession().createQuery("from ProductOutstockBillProduct p where p.billMaterialId ="+id).uniqueResult();
		sessionFactory.openSession().close();
		return productOutstockBillProduct;
	}
}
