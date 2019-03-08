package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ProductDao;
import swust.model.Client;
import swust.model.Product;

public class ProductDaoImpl extends BaseDao implements ProductDao {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public List<Product> getAllProducts() {
		Query query = sessionFactory.openSession().createQuery("from Product");
		List<Product> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addProduct(Product product) {
		Session session = sessionFactory.openSession();
		session.save(product);
		session.close();
	}

	@Override
	public void delProduct(Integer id) {
		sessionFactory.openSession().createQuery("delete Product p where p.productId="+id).executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateProduct(Product product) {		
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String productId=reqeust.getParameter("productId");//字符串	
		Session session = getSessionFactory().openSession();
        String hql = ("update Product p set p.productNo = ?,p.productName = ?,p.unit = ?,p.spec = ?,p.price = ?,p.productCategory.categoryId=? where p.productId = ?");  
        Query query = sessionFactory.openSession().createQuery(hql);
        query.setParameter(0, product.getProductNo());
        query.setParameter(1, product.getProductName());
        query.setParameter(2, product.getUnit());
        query.setParameter(3, product.getSpec());
        query.setParameter(4, product.getPrice());
        query.setParameter(5, product.getProductCategory().getCategoryId());        
        query.setParameter(6, product.getProductId());
        query.executeUpdate(); 
        session.close();
	}

	@Override
	public Product getProduct(Integer id) {
		Product product = (Product)sessionFactory.openSession().createQuery("from Product p where p.productId ="+id).uniqueResult();
		sessionFactory.openSession().close();
		return product;
	}

	@Override
	public List<Product> getProductByName(String productName) {
		List<Product> lists = (List<Product>) sessionFactory.openSession().createQuery("from Product p where p.productName like"+ "'%" + productName + "%'").list();
		sessionFactory.openSession().close();
		return lists;
	}

}
