package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.SalaryDao;
import swust.model.Salary;

public class SalaryDaoImpl extends BaseDao implements SalaryDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Salary> getAllSalarys() {
		Query query = sessionFactory.openSession().createQuery("from Salary");
		List<Salary> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addSalary(Salary Salary) {
		Session session = sessionFactory.openSession();
		session.save(Salary);
		session.close();
	}

	@Override
	public void delSalary(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete Salary c where c.sid=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateSalary(Salary Salary) {
		/*HttpServletRequest reqeust = ServletActionContext.getRequest();
		String sid = reqeust.getParameter("sid");// 字符串 Session
		Session session = getSessionFactory().openSession();
		System.out.println(Salary.getSalaryName());
		String hql = ("update Salary c set c.SalaryName = ?,c.contact = ?,c.contactPhone = ?,c.address=?,c.postcode=?,c.email=?,c.corporation=?,c.telephone=? where c.sid = ?");
		Query query = sessionFactory.openSession().createQuery(hql); //
		System.out.println(sid);
		query.setParameter(0, Salary.getSalaryName());
		query.setParameter(1, Salary.getContact());
		query.setParameter(2, Salary.getContactPhone());
		query.setParameter(3, Salary.getAddress());
		query.setParameter(4, Salary.getPostcode());
		query.setParameter(5, Salary.getEmail());
		query.setParameter(6, Salary.getCorporation());
		query.setParameter(7, Salary.getTelephone());
		query.setParameter(8, Salary.getsid());
		query.executeUpdate();
		session.close();*/
	}

	@Override
	public Salary getSalary(Integer id) {
		return (Salary) sessionFactory.openSession()
				.createQuery("from Salary c where c.sid =" + id)
				.uniqueResult();
	}

	public List<Salary> getSalaryByProId(Integer id){
		Query query = sessionFactory.openSession().createQuery("from Salary s where s.projectTask.project.proId ="+id);
		List<Salary> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

}
