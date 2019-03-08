package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ProjectDao;
import swust.model.Project;

public class ProjectDaoImpl extends BaseDao implements ProjectDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Project> getAllProjects() {
		Query query = sessionFactory.openSession().createQuery("from Project");
		List<Project> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addProject(Project project) {
		Session session = sessionFactory.openSession();
		session.save(project);
		session.close();
	}

	@Override
	public void delProject(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete Project c where c.proId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateProject(Project project) {
		Session session = getSessionFactory().openSession();
		String hql = ("update Project p set p.proNo = ?,p.proName = ?,p.employee.empId = ?,p.percent = ?,p.startDate = ?,p.endDate = ?,p.text = ?,p.remark=?  where p.proId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, project.getProNo());
		query.setParameter(1, project.getProName());
		query.setParameter(2, project.getEmployee().getEmpId());
		query.setParameter(3, project.getPercent());
		query.setParameter(4, project.getStartDate());
		query.setParameter(5, project.getEndDate());
		query.setParameter(6, project.getText());
		query.setParameter(7, project.getRemark());
		query.setParameter(8, project.getProId());
		query.executeUpdate();
		session.close();
	}

	public void updatePreProject(Project project) {
		Session session = getSessionFactory().openSession();
		String hql = ("update Project b set b.percent = ? where b.proId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, "100");
		query.setParameter(1, project.getProId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public Project getProject(Integer id) {
		Project project = (Project) sessionFactory.openSession()
				.createQuery("from Project c where c.proId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return project;
	}

	@Override
	public List<Project> getProjectByName(String proName) {
		List<Project> projects = (List<Project>) sessionFactory
				.openSession()
				.createQuery(
						"from Project c where c.proName like" + "'%" + proName
								+ "%'").list();
		sessionFactory.openSession().close();
		return projects;
	}

	@Override
	public List<Project> getProjectByRemark() {
		List<Project> projects = (List<Project>) sessionFactory.openSession()
				.createQuery("from Project c where c.remark =" + "'承包'").list();
		sessionFactory.openSession().close();
		return projects;
	}

	@Override
	public List<Project> getProjectByRemarkSJ() {
		List<Project> projects = (List<Project>) sessionFactory.openSession()
				.createQuery("from Project c where c.remark =" + "'设计'").list();
		sessionFactory.openSession().close();
		return projects;
	}

}
