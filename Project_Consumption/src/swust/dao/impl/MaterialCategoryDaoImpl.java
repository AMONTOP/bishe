package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.MaterialCategoryDao;
import swust.model.MaterialCategory;


public class MaterialCategoryDaoImpl extends BaseDao implements MaterialCategoryDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<MaterialCategory> getAllMaterialCategorys() {
		Query query = sessionFactory.openSession().createQuery("from MaterialCategory");
		List<MaterialCategory> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	public void addMaterialCategory(MaterialCategory materialCategory) {
		Session session = sessionFactory.openSession();
		session.save(materialCategory);
		session.close();
	}

	public void delMaterialCategory(Integer id) {
		sessionFactory.openSession().createQuery("delete MaterialCategory m where m.categoryId="+id).executeUpdate();
		sessionFactory.openSession().close();
	}

	public void updateMaterialCategory(MaterialCategory materialCategory) {
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String categoryId=reqeust.getParameter("categoryId");//字符串	
		Session session = getSessionFactory().openSession();
		String hql = ("update MaterialCategory m set m.categoryName = ? where m.categoryId = ?");  
        Query query = sessionFactory.openSession().createQuery(hql);
        query.setParameter(0, materialCategory.getCategoryName());
        query.setParameter(1, materialCategory.getCategoryId());
        query.executeUpdate();   
        session.close();
		
	}

	public MaterialCategory getMaterialCategory(Integer id) {
		MaterialCategory materialCategory = (MaterialCategory)sessionFactory.openSession().createQuery("from MaterialCategory m where m.categoryId ="+id).uniqueResult();
		sessionFactory.openSession().close();
		return materialCategory;
	}

	public List<MaterialCategory> getMaterialCategoryByName(String categoryName) {
		List<MaterialCategory> lists = (List<MaterialCategory>) sessionFactory.openSession().createQuery("from MaterialCategory m where m.categoryName like"+ "'%" + categoryName + "%'").list();
		sessionFactory.openSession().close();
		return lists;
	}
}
