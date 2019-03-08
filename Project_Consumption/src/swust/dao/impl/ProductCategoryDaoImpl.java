package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ProductCategoryDao;
import swust.model.ProductCategory;


public class ProductCategoryDaoImpl extends BaseDao implements ProductCategoryDao {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public List<ProductCategory> getAllProductCategorys() {
		Query query = sessionFactory.openSession().createQuery("from ProductCategory");
		List<ProductCategory> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addProductCategory(ProductCategory productCategory) {
		Session session = sessionFactory.openSession();
		session.save(productCategory);
		session.close();
	}

	@Override
	public void delProductCategory(Integer id) {
		sessionFactory.openSession().createQuery("delete ProductCategory p where p.categoryId="+id).executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateProductCategory(ProductCategory productCategory) {
//		HttpServletRequest reqeust= ServletActionContext.getRequest();
//		String productId=reqeust.getParameter("productId");//字符串	
		Session session = getSessionFactory().openSession();
        String hql = ("update ProductCategory p set p.categoryName = ? where p.categoryId = ?");  
        Query query = sessionFactory.openSession().createQuery(hql);
        query.setParameter(0, productCategory.getCategoryName());
        query.setParameter(1, productCategory.getCategoryId());
        query.executeUpdate();   
        session.close();
	}

	@Override
	public ProductCategory getProductCategory(Integer id) {
		ProductCategory productCategory =  (ProductCategory)sessionFactory.openSession().createQuery("from ProductCategory p where p.categoryId ="+id).uniqueResult();
		sessionFactory.openSession().close();
		return productCategory;
	}
	@Override
	public List<ProductCategory> getProductCategoryByName(String categoryName) {
		List<ProductCategory> list =  sessionFactory.openSession().createQuery("from ProductCategory p where p.categoryName like"+ "'%" + categoryName + "%'").list();
		sessionFactory.openSession().close();
		return list;
	}

}
