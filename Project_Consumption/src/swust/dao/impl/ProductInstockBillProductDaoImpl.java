package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ProductInstockBillProductDao;
import swust.model.ProductInstockBillProduct;



public class ProductInstockBillProductDaoImpl implements ProductInstockBillProductDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public List<ProductInstockBillProduct> getAllProductInstockBillProducts() {
		Query query = sessionFactory.openSession().createQuery("from ProductInstockBillProduct");
		List<ProductInstockBillProduct> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addProductInstockBillProduct(
			ProductInstockBillProduct productInstockBillProduct) {
		Session session = sessionFactory.openSession();
		session.save(productInstockBillProduct);
		session.close();
	}

	@Override
	public void delProductInstockBillProduct(Integer id) {
		sessionFactory.openSession().createQuery("delete ProductInstockBillProduct p where p.billProductId="+id).executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateProductInstockBillProduct(ProductInstockBillProduct productInstockBillProduct) {
		Session session = getSessionFactory().openSession();
        String hql = ("update ProductInstockBillProduct c set c.productInstockBill.billId = ?,c.product.productId = ?,c.quantity = ?,c.remark = ? where c.billProductId = ?");  
        Query query = sessionFactory.openSession().createQuery(hql);
        query.setParameter(0, productInstockBillProduct.getProductInstockBill().getBillId());
        query.setParameter(1, productInstockBillProduct.getProduct().getProductId());
        query.setParameter(2, productInstockBillProduct.getQuantity());
        query.setParameter(3, productInstockBillProduct.getRemark());
        query.setParameter(4, productInstockBillProduct.getBillProductId());
        query.executeUpdate();  
        session.close();
		
	}
	@Override
	public ProductInstockBillProduct getProductInstockBillProduct(Integer id) {
		ProductInstockBillProduct productInstockBillProduct = (ProductInstockBillProduct)sessionFactory.openSession().createQuery("from ProductInstockBillProduct p where p.billProductId ="+id).uniqueResult();
		sessionFactory.openSession().close();
		return productInstockBillProduct;
	}
}
