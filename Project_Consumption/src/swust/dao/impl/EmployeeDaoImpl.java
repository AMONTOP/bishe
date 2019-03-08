package swust.dao.impl;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.EmployeeDao;
import swust.model.Employee;
import swust.util.Md5;

public class EmployeeDaoImpl extends BaseDao implements EmployeeDao {
	private SessionFactory sessionFactory;
	Md5 md5 = new Md5();

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Employee getByUsernameAndPassword(Employee employee) {
		System.out.println(employee.getUserName());
		System.out.println(employee.getUserPass());
		try {
			return (Employee) sessionFactory
					.openSession()
					.createQuery(
							"from Employee c where c.userName = '"
									+ employee.getUserName() + "'"
									+ "and c.userPass ='"
									+ md5.EncoderByMd5(employee.getUserPass())
									+ "'").uniqueResult();
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public List<Employee> getAllEmployees() {
		Query query = sessionFactory.openSession().createQuery("from Employee");
		List<Employee> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	public void addEmployee(Employee employee) {
		Session session = sessionFactory.openSession();
		session.save(employee);
		session.close();
	}

	public void delEmployee(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete Employee m where m.empId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	public void updateEmployee(Employee employee) {
		Session session = getSessionFactory().openSession();
		String hql = ("update Employee m set m.name = ?,m.sex=?,m.mobile=?,m.email=? where m.empId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, employee.getName());
		query.setParameter(1, employee.getSex());
		query.setParameter(2, employee.getMobile());
		query.setParameter(3, employee.getEmail());
		query.setParameter(4, employee.getEmpId());
		query.executeUpdate();
		session.close();

	}

	public Employee getEmployee(Integer id) {
		Employee employee = (Employee) sessionFactory.openSession()
				.createQuery("from Employee m where m.empId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return employee;
	}

	public List<Employee> getEmployeeByName(String name) {
		List<Employee> lists = (List<Employee>) sessionFactory
				.openSession()
				.createQuery(
						"from Employee m where m.name like" + "'%" + name
								+ "%'").list();
		sessionFactory.openSession().close();
		return lists;
	}
}
