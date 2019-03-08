package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import swust.dao.PermissionDao;
import swust.model.Permission;

public class PermissionDaoImpl extends BaseDao implements PermissionDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Permission> getAllPermissions() {
		Query query = sessionFactory.openSession().createQuery(
				"from Permission");
		List<Permission> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public Permission getPermission(Integer id) {
		return (Permission) sessionFactory.openSession()
				.createQuery("from Permission c where c.permissionId =" + id)
				.uniqueResult();
	}

}
