package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.AccountPayDao;
import swust.model.AccountPay;

public class AccountPayDaoImpl extends BaseDao implements AccountPayDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<AccountPay> getAllAccountPays() {
		Query query = sessionFactory.openSession().createQuery(
				"from AccountPay");
		List<AccountPay> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addAccountPay(AccountPay accountPay) {
		Session session = sessionFactory.openSession();
		session.save(accountPay);
		session.close();
	}

	@Override
	public void delAccountPay(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete AccountPay a where a.payId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateAccountPay(AccountPay accountPay) {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String payId = reqeust.getParameter("payId");// 字符串
														// Session
		Session session = getSessionFactory().openSession();
		String hql = ("update AccountPay c set c.payDate = ?,c.employee.empId = ?,c.payMoney = ?,c.supplier.supplierId=?,c.project.proId=?,c.accountInfo.accountInfoId=?,c.payStatus=?,c.payDept=?,c.payItem=? where c.payId =?");
		Query query = sessionFactory.openSession().createQuery(hql); //
		query.setParameter(0, accountPay.getPayDate());
		query.setParameter(1, accountPay.getEmployee().getEmpId());
		query.setParameter(2, accountPay.getPayMoney());
		query.setParameter(3, accountPay.getSupplier().getSupplierId());
		query.setParameter(4, accountPay.getProject().getProId());
		query.setParameter(5, accountPay.getAccountInfo().getAccountInfoId());
		query.setParameter(6, accountPay.getPayStatus());
		query.setParameter(7, accountPay.getPayDept());
		query.setParameter(8, accountPay.getPayItem());
		query.setParameter(9, accountPay.getPayId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public AccountPay getAccountPay(Integer id) {
		AccountPay accountPay = (AccountPay) sessionFactory.openSession()
				.createQuery("from AccountPay c where c.payId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return accountPay;
	}

}
