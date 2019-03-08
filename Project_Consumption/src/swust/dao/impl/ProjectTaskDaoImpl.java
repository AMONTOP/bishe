package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ProjectTaskDao;
import swust.model.ProjectTask;

public class ProjectTaskDaoImpl extends BaseDao implements ProjectTaskDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<ProjectTask> getAllProjectTasks() {
		Query query = sessionFactory.openSession().createQuery(
				"from ProjectTask");
		List<ProjectTask> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addProjectTask(ProjectTask projectTask) {
		Session session = sessionFactory.openSession();
		session.save(projectTask);

		String hql = ("update Project p set p.percent = ? where p.proId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, projectTask.getProject().getPercent());
		query.setParameter(1, projectTask.getProject().getProId());
		query.executeUpdate();

		session.close();

	}

	@Override
	public void delProjectTask(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete ProjectTask c where c.taskId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateProjectTask(ProjectTask projectTask) {
		/*
		 * Session session = getSessionFactory().openSession(); String hql = (
		 * "update ProjectTask b set b.billNo = ?,b.salesman = ?,b.client.clientId = ?,b.billTime = ?,b.billAmount = ?,b.billState=?,b.deliveryAt=?,b.deliveryBy=? where b.billId = ?"
		 * ); Query query = sessionFactory.openSession().createQuery(hql);
		 * query.setParameter(0, orderBill.getBillNo()); query.setParameter(1,
		 * orderBill.getSalesman()); query.setParameter(2,
		 * orderBill.getClient().getClientId()); query.setParameter(3,
		 * orderBill.getBillTime()); query.setParameter(4,
		 * orderBill.getBillAmount()); query.setParameter(5,
		 * orderBill.getBillState()); query.setParameter(6,
		 * orderBill.getDeliveryAt()); query.setParameter(7,
		 * orderBill.getDeliveryBy()); query.setParameter(8,
		 * orderBill.getBillId()); query.executeUpdate(); session.close();
		 */

	}

	@Override
	public List<ProjectTask> getProjectTask(Integer id) {
		List<ProjectTask> projectTask = (List<ProjectTask>) sessionFactory
				.openSession()
				.createQuery("from ProjectTask b where b.project.proId =" + id)
				.list();
		sessionFactory.openSession().close();
		return projectTask;
	}
	
	public List<ProjectTask> getProjectTaskByEmp(Integer id){
		List<ProjectTask> projectTask = (List<ProjectTask>) sessionFactory
				.openSession()
				.createQuery("from ProjectTask b where b.employee.empId =" + id)
				.list();
		sessionFactory.openSession().close();
		return projectTask;
	}

}
