package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.AccountInfoDao;
import swust.model.AccountInfo;

public class AccountInfoDaoImpl extends BaseDao implements AccountInfoDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<AccountInfo> getAllAccountInfos() {
		Query query = sessionFactory.openSession().createQuery(
				"from AccountInfo");
		List<AccountInfo> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addAccountInfo(AccountInfo accountInfo) {
		Session session = sessionFactory.openSession();
		session.save(accountInfo);
		session.close();
	}

	@Override
	public void delAccountInfo(Integer id) {
		sessionFactory
				.openSession()
				.createQuery("delete AccountInfo a where a.accountInfoId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateAccountInfo(AccountInfo accountInfo) {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String accountInfoId = reqeust.getParameter("accountInfoId");// 字符串 Session
		Session session = getSessionFactory().openSession();
		String hql = ("update AccountInfo c set c.infoName = ?,c.infoNo = ?,c.infoBank = ?,c.infoAddress=?,c.accountStatus=? where c.accountInfoId =?");
		Query query = sessionFactory.openSession().createQuery(hql); //
		query.setParameter(0, accountInfo.getInfoName());
		query.setParameter(1, accountInfo.getInfoNo());
		query.setParameter(2, accountInfo.getInfoBank());
		query.setParameter(3, accountInfo.getInfoAddress());
		query.setParameter(4, accountInfo.getAccountStatus());
		query.setParameter(5, accountInfo.getAccountInfoId());
		query.executeUpdate();
		session.close();

	}

	@Override
	public AccountInfo getAccountInfo(Integer id) {
		AccountInfo accountInfo = (AccountInfo) sessionFactory.openSession()
				.createQuery("from AccountInfo c where c.accountInfoId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return accountInfo;
	}

	@Override
	public List<AccountInfo> getAccountInfoByInfoName(String infoName) {
		List<AccountInfo> list = (List<AccountInfo>) sessionFactory
				.openSession()
				.createQuery(
						"from AccountInfo c where c.infoName like" + "'%"
								+ infoName + "%'").list();
		sessionFactory.openSession().close();
		return list;
	}

}
