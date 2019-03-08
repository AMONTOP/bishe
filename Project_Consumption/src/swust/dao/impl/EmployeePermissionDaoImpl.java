package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.EmployeePermissionDao;
import swust.model.EmployeePermission;

public class EmployeePermissionDaoImpl extends BaseDao implements
		EmployeePermissionDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<EmployeePermission> getAllEmployeePermissions() {
		Query query = sessionFactory.openSession().createQuery(
				"from EmployeePermission");
		List<EmployeePermission> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addEmployeePermission(EmployeePermission employeePermission) {
		Session session = sessionFactory.openSession();
		session.save(employeePermission);
		session.close();
	}

	@Override
	public void delEmployeePermission(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete EmployeePermission c where c.rolePermissionId="
								+ id).executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateEmployeePermission(EmployeePermission employeePermission) {
		/*
		 * HttpServletRequest reqeust = ServletActionContext.getRequest();
		 * String employeePermissionId = reqeust
		 * .getParameter("employeePermissionId");// 字符串 Session session =
		 * getSessionFactory().openSession();
		 * System.out.println(employeePermission.getEmployeePermissionName());
		 * String hql = (
		 * "update EmployeePermission c set c.employeePermissionName = ?,c.contact = ?,c.contactPhone = ? where c.employeePermissionId = ?"
		 * ); Query query = sessionFactory.openSession().createQuery(hql); //
		 * System.out.println(employeePermissionId); query.setParameter(0,
		 * employeePermission.getEmployeePermissionName());
		 * query.setParameter(1, employeePermission.getContact());
		 * query.setParameter(2, employeePermission.getContactPhone());
		 * query.setParameter(3, employeePermission.getEmployeePermissionId());
		 * query.executeUpdate(); session.close();
		 */

	}

	@Override
	public EmployeePermission getEmployeePermission(Integer id) {
		return (EmployeePermission) sessionFactory
				.openSession()
				.createQuery(
						"from EmployeePermission c where c.rolePermissionId ="
								+ id).uniqueResult();
	}

	@Override
	public List<EmployeePermission> getEmployeePermissionByRole(Integer roleId) {
		return (List<EmployeePermission>) sessionFactory
				.openSession()
				.createQuery(
						"from EmployeePermission e where e.role.roleId="
								+ roleId).list();
	}

}
