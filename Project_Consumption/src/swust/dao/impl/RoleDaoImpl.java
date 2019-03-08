package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import swust.dao.RoleDao;
import swust.model.Role;

public class RoleDaoImpl extends BaseDao implements RoleDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Role> getAllRoles() {
		Query query = sessionFactory.openSession().createQuery("from Role");
		List<Role> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public Role getRole(Integer id) {
		return (Role) sessionFactory.openSession()
				.createQuery("from Role c where c.roleId =" + id)
				.uniqueResult();
	}

}
