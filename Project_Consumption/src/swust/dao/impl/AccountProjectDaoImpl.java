package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.AccountProjectDao;
import swust.model.AccountProject;

public class AccountProjectDaoImpl extends BaseDao implements AccountProjectDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<AccountProject> getAllAccountProjects() {
		Query query = sessionFactory.openSession().createQuery(
				"from AccountProject");
		List<AccountProject> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addAccountProject(AccountProject accountProject) {
		Session session = sessionFactory.openSession();
		session.save(accountProject);
		session.close();
	}

	@Override
	public void delAccountProject(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete AccountProject a where a.accountId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateAccountProject(AccountProject accountProject) {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String accountId = reqeust.getParameter("accountId");// 字符串
		// Session
		Session session = getSessionFactory().openSession();
		String hql = ("update AccountProject c set c.accountName = ?,c.project.proId = ?,c.employee.empId = ?,c.accountMoney=?,c.accountDept=?,c.remark=?,c.adate=? where c.accountId =?");
		Query query = sessionFactory.openSession().createQuery(hql); //
		query.setParameter(0, accountProject.getAccountName());
		query.setParameter(1, accountProject.getProject().getProId());
		query.setParameter(2, accountProject.getEmployee().getEmpId());
		query.setParameter(3, accountProject.getAccountMoney());
		query.setParameter(4, accountProject.getAccountDept());
		query.setParameter(5, accountProject.getRemark());
		query.setParameter(6, accountProject.getAdate());
		query.setParameter(7, accountProject.getAccountId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public AccountProject getAccountProject(Integer id) {
		AccountProject accountProject = (AccountProject) sessionFactory
				.openSession()
				.createQuery("from AccountProject c where c.accountId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return accountProject;
	}

}
