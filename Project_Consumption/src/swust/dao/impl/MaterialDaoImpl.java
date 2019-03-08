package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.MaterialDao;
import swust.model.Material;

public class MaterialDaoImpl extends BaseDao implements MaterialDao {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public List<Material> getAllMaterials() {
		Query query = sessionFactory.openSession().createQuery("from Material");
		List<Material> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addMaterial(Material material) {
		Session session = sessionFactory.openSession();
		session.save(material);
		session.close();
	}

	@Override
	public void delMaterial(Integer id) {
		sessionFactory.openSession().createQuery("delete Material m where m.materialId="+id).executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateMaterial(Material material) {
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String materialId=reqeust.getParameter("materialId");//字符串	
		Session session = getSessionFactory().openSession();
        String hql = ("update Material m set m.materialNo = ?,m.materialName = ?,m.unit = ?,m.spec = ?,m.cost = ?,m.materialCategory.categoryId=? where m.materialId = ?");  
        Query query = sessionFactory.openSession().createQuery(hql);
        query.setParameter(0, material.getMaterialNo());
        query.setParameter(1, material.getMaterialName());
        query.setParameter(2, material.getUnit());
        query.setParameter(3, material.getSpec());
        query.setParameter(4, material.getCost());
        query.setParameter(5, material.getMaterialCategory().getCategoryId());        
        query.setParameter(6, material.getMaterialId());
        query.executeUpdate(); 
        session.close();
	}

	@Override
	public Material getMaterial(Integer id) {
		Material material = (Material)sessionFactory.openSession().createQuery("from Material m where m.materialId ="+id).uniqueResult();
		sessionFactory.openSession().close();
		return material;
	}

	@Override
	public List<Material> getMaterialByName(String materialName) {
		List<Material> lists = (List<Material>) sessionFactory.openSession().createQuery("from Material m where m.materialName like"+ "'%" + materialName + "%'").list();
		sessionFactory.openSession().close();
		return lists;
	}
	
}
