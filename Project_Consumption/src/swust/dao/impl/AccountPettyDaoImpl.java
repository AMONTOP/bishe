package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.AccountPettyDao;
import swust.model.AccountPetty;

public class AccountPettyDaoImpl extends BaseDao implements AccountPettyDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<AccountPetty> getAllAccountPettys() {
		Query query = sessionFactory.openSession().createQuery(
				"from AccountPetty");
		List<AccountPetty> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addAccountPetty(AccountPetty accountPetty) {
		Session session = sessionFactory.openSession();
		session.save(accountPetty);
		session.close();
	}

	@Override
	public void delAccountPetty(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete AccountPetty a where a.accountPettyId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateAccountPetty(AccountPetty accountPetty) {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String payId = reqeust.getParameter("payId");// 字符串 // Session
		Session session = getSessionFactory().openSession();
		String hql = ("update AccountPetty c set c.employee.empId = ?,c.project.proId=?,c.pettyDept=?,c.pettyMoney=?,c.pettyStatus=?,c.useDate=? where c.accountPettyId =?");
		Query query = sessionFactory.openSession().createQuery(hql); //
		query.setParameter(0, accountPetty.getEmployee().getEmpId());
		query.setParameter(1, accountPetty.getProject().getProId());
		query.setParameter(2, accountPetty.getPettyDept());
		query.setParameter(3, accountPetty.getPettyMoney());
		query.setParameter(4, accountPetty.getPettyStatus());
		query.setParameter(5, accountPetty.getUseDate());
		query.setParameter(6, accountPetty.getAccountPettyId());
		query.executeUpdate();
		session.close();

	}

	@Override
	public AccountPetty getAccountPetty(Integer id) {
		AccountPetty accountPetty = (AccountPetty) sessionFactory
				.openSession()
				.createQuery(
						"from AccountPetty c where c.accountPettyId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return accountPetty;
	}

}
