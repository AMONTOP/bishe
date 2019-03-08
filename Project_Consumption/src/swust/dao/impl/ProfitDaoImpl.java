package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ProfitDao;
import swust.model.Profit;

public class ProfitDaoImpl extends BaseDao implements ProfitDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Profit> getAllProfits() {
		Query query = sessionFactory.openSession().createQuery("from Profit");
		List<Profit> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addProfit(Profit Profit) {
		Session session = sessionFactory.openSession();
		session.save(Profit);
		session.close();
	}

	@Override
	public void delProfit(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete Profit c where c.pid=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateProfit(Profit Profit) {
		
	}

	@Override
	public Profit getProfit(Integer id) {
		return (Profit) sessionFactory.openSession()
				.createQuery("from Profit c where c.pid =" + id)
				.uniqueResult();
	}



}
