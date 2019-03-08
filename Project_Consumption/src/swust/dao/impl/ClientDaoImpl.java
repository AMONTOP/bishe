package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ClientDao;
import swust.model.Client;

public class ClientDaoImpl extends BaseDao implements ClientDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Client> getAllClients() {
		Query query = sessionFactory.openSession().createQuery("from Client");
		List<Client> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addClient(Client client) {
		Session session = sessionFactory.openSession();
		session.save(client);
		session.close();
	}

	@Override
	public void delClient(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete Client c where c.clientId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateClient(Client client) {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String clientId = reqeust.getParameter("clientId");// 字符串 Session
		Session session = getSessionFactory().openSession();
		System.out.println(client.getClientName());
		String hql = ("update Client c set c.clientName = ?,c.contact = ?,c.contactPhone = ?,c.address=?,c.postcode=?,c.email=?,c.corporation=?,c.telephone=? where c.clientId = ?");
		Query query = sessionFactory.openSession().createQuery(hql); //
		System.out.println(clientId);
		query.setParameter(0, client.getClientName());
		query.setParameter(1, client.getContact());
		query.setParameter(2, client.getContactPhone());
		query.setParameter(3, client.getAddress());
		query.setParameter(4, client.getPostcode());
		query.setParameter(5, client.getEmail());
		query.setParameter(6, client.getCorporation());
		query.setParameter(7, client.getTelephone());
		query.setParameter(8, client.getClientId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public Client getClient(Integer id) {
		return (Client) sessionFactory.openSession()
				.createQuery("from Client c where c.clientId =" + id)
				.uniqueResult();
	}

	@Override
	public List<Client> getClientByName(String clientName) {
		return (List<Client>) sessionFactory
				.openSession()
				.createQuery(
						"from Client c where c.clientName like" + "'%"
								+ clientName + "%'").list();
	}

}
