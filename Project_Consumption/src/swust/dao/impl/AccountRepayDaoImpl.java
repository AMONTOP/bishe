package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.AccountRepayDao;
import swust.model.AccountRepay;

public class AccountRepayDaoImpl extends BaseDao implements AccountRepayDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<AccountRepay> getAllAccountRepays() {
		Query query = sessionFactory.openSession().createQuery(
				"from AccountRepay");
		List<AccountRepay> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addAccountRepay(AccountRepay accountRepay) {
		Session session = sessionFactory.openSession();
		session.save(accountRepay);
		session.close();
	}

	@Override
	public void delAccountRepay(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete AccountRepay a where a.repayId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateAccountRepay(AccountRepay accountRepay) {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String repayId = reqeust.getParameter("repayId");// 字符串
															// Session
		Session session = getSessionFactory().openSession();
		String hql = ("update AccountRepay c set c.employee.empId = ?,c.repayMoney = ?,c.supplier.supplierId = ?,c.accountInfo.accountInfoId=?,c.repayStatus=? where c.repayId =?");
		Query query = sessionFactory.openSession().createQuery(hql); //
		query.setParameter(0, accountRepay.getEmployee().getEmpId());
		query.setParameter(1, accountRepay.getRepayMoney());
		query.setParameter(2, accountRepay.getSupplier().getSupplierId());
		query.setParameter(3, accountRepay.getAccountInfo().getAccountInfoId());
		query.setParameter(4, accountRepay.getRepayStatus());
		query.setParameter(5, accountRepay.getRepayId());
		query.executeUpdate();
		session.close();

	}

	@Override
	public AccountRepay getAccountRepay(Integer id) {
		AccountRepay accountRepay = (AccountRepay) sessionFactory.openSession()
				.createQuery("from AccountRepay c where c.repayId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return accountRepay;
	}

}
