package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.MwareHouseDao;
import swust.model.MwareHouse;

public class MwareHouseDaoImpl extends BaseDao implements MwareHouseDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<MwareHouse> getAllMwareHouses() {
		Query query = sessionFactory.openSession().createQuery(
				"from MwareHouse");
		List<MwareHouse> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addMwareHouse(MwareHouse wareHouse) {
		Session session = sessionFactory.openSession();
		session.save(wareHouse);
		session.close();
	}

	@Override
	public void delMwareHouse(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete MwareHouse c where c.wareId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateMwareHouse(MwareHouse wareHouse) {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String wareId = reqeust.getParameter("wareId");// 字符串 Session
		Session session = getSessionFactory().openSession();
		String hql = ("update MwareHouse c set c.wareNo = ?,c.wareCapacity = ?,c.address=?,c.employee.empId=? where c.wareId = ?");
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
	public MwareHouse getMwareHouse(Integer id) {
		return (MwareHouse) sessionFactory.openSession()
				.createQuery("from MwareHouse c where c.wareId =" + id)
				.uniqueResult();
	}

	@Override
	public List<MwareHouse> getMwareHouseByName(String wareNo) {
		return (List<MwareHouse>) sessionFactory
				.openSession()
				.createQuery(
						"from MwareHouse c where c.wareNo like" + "'%" + wareNo
								+ "%'").list();
	}

}
