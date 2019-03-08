package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.EmployeeRoleDao;
import swust.model.EmployeeRole;

public class EmployeeRoleDaoImpl extends BaseDao implements EmployeeRoleDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<EmployeeRole> getAllEmployeeRoles() {
		Query query = sessionFactory.openSession().createQuery(
				"from EmployeeRole");
		List<EmployeeRole> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addEmployeeRole(EmployeeRole employeeRole) {
		Session session = sessionFactory.openSession();
		session.save(employeeRole);
		session.close();
	}

	@Override
	public void delEmployeeRole(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete EmployeeRole m where m.employeeRoleId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateEmployeeRole(EmployeeRole employeeRole) {
		Session session = getSessionFactory().openSession();
		String hql = ("update EmployeeRole m set m.employee.empId=?,m.role.roleId=? where m.employeeRoleId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, employeeRole.getEmployee().getEmpId());
		query.setParameter(1, employeeRole.getRole().getRoleId());
		query.setParameter(2, employeeRole.getEmployeeRoleId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public EmployeeRole getEmployeeRole(Integer id) {
		EmployeeRole employeeRole = (EmployeeRole) sessionFactory
				.openSession()
				.createQuery(
						"from EmployeeRole m where m.employee.empId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return employeeRole;
	}

	@Override
	public List<EmployeeRole> getEmployeeRoleByName(String name) {
		List<EmployeeRole> lists = (List<EmployeeRole>) sessionFactory
				.openSession()
				.createQuery(
						"from EmployeeRole m where m.employee.name like" + "'%"
								+ name + "%'").list();
		sessionFactory.openSession().close();
		return lists;
	}

}
