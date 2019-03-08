package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.WareHouseDao;
import swust.model.WareHouse;

public class WareHouseDaoImpl extends BaseDao implements WareHouseDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<WareHouse> getAllWareHouses() {
		Query query = sessionFactory.openSession()
				.createQuery("from WareHouse");
		List<WareHouse> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addWareHouse(WareHouse wareHouse) {
		Session session = sessionFactory.openSession();
		session.save(wareHouse);
		session.close();
	}

	@Override
	public void delWareHouse(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete WareHouse c where c.wareId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateWareHouse(WareHouse wareHouse) {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String wareId = reqeust.getParameter("wareId");// 字符串 Session
		Session session = getSessionFactory().openSession();
		String hql = ("update WareHouse c set c.wareNo = ?,c.wareCapacity = ?,c.address=?,c.employee.empId=? where c.wareId = ?");
		Query query = sessionFactory.openSession().createQuery(hql); //

		query.setParameter(0, wareHouse.getWareNo());
		query.setParameter(1, wareHouse.getWareCapacity());
		query.setParameter(2, wareHouse.getAddress());
		query.setParameter(3, wareHouse.getEmployee().getEmpId());
		query.setParameter(4, wareHouse.getWareId());

		query.executeUpdate();
		session.close();
	}

	@Override
	public WareHouse getWareHouse(Integer id) {
		return (WareHouse) sessionFactory.openSession()
				.createQuery("from WareHouse c where c.wareId =" + id)
				.uniqueResult();
	}

	@Override
	public List<WareHouse> getWareHouseByName(String wareNo) {
		return (List<WareHouse>) sessionFactory
				.openSession()
				.createQuery(
						"from WareHouse c where c.wareNo like" + "'%" + wareNo
								+ "%'").list();
	}

}
