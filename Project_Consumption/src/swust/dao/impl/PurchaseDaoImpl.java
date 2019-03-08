package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.PurchaseDao;
import swust.model.Purchase;

public class PurchaseDaoImpl extends BaseDao implements PurchaseDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Purchase> getAllPurchases() {
		Query query = sessionFactory.openSession().createQuery("from Purchase");
		List<Purchase> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addPurchase(Purchase purchase) {
		Session session = sessionFactory.openSession();
		session.save(purchase);
		session.close();
	}

	@Override
	public void delPurchase(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete Purchase c where c.purId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updatePurchase(Purchase purchase) {
		/*
		 * HttpServletRequest reqeust = ServletActionContext.getRequest();
		 * String purchaseId = reqeust.getParameter("purchaseId");// 字符串 Session
		 * Session session = getSessionFactory().openSession();
		 * System.out.println(purchase.getPurchaseName()); String hql = (
		 * "update Purchase c set c.purchaseName = ?,c.contact = ?,c.contactPhone = ?,c.address=?,c.postcode=?,c.email=?,c.corporation=?,c.telephone=? where c.purchaseId = ?"
		 * ); Query query = sessionFactory.openSession().createQuery(hql); //
		 * System.out.println(purchaseId); query.setParameter(0,
		 * purchase.getPurchaseName()); query.setParameter(1,
		 * purchase.getContact()); query.setParameter(2,
		 * purchase.getContactPhone()); query.setParameter(3,
		 * purchase.getAddress()); query.setParameter(4,
		 * purchase.getPostcode()); query.setParameter(5, purchase.getEmail());
		 * query.setParameter(6, purchase.getCorporation());
		 * query.setParameter(7, purchase.getTelephone()); query.setParameter(8,
		 * purchase.getPurchaseId()); query.executeUpdate(); session.close();
		 */
	}

	@Override
	public Purchase getPurchase(Integer id) {
		return (Purchase) sessionFactory.openSession()
				.createQuery("from Purchase c where c.purId =" + id)
				.uniqueResult();
	}

	@Override
	public List<Purchase> getPurchaseByName(String purchaseName) {
		return (List<Purchase>) sessionFactory
				.openSession()
				.createQuery(
						"from Purchase c where c.purNo like" + "'%"
								+ purchaseName + "%'").list();
	}

}
