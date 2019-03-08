package swust.dao.impl;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.OrderBillDao;
import swust.model.OrderBill;

public class OrderBillDaoImpl extends BaseDao implements OrderBillDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<OrderBill> getAllOrderBills() {
		Query query = sessionFactory.openSession()
				.createQuery("from OrderBill");
		List<OrderBill> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addOrderBill(OrderBill orderBill) {
		Session session = sessionFactory.openSession();
		session.save(orderBill);
		session.close();
	}

	@Override
	public void delOrderBill(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete OrderBill b where b.billId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateOrderBill(OrderBill orderBill) {
		Session session = getSessionFactory().openSession();
		String hql = ("update OrderBill b set b.billNo = ?,b.employee.empId = ?,b.client.clientId = ?,b.billTime = ?,b.billAmount = ?,b.billState=?,b.deliveryAt=? where b.billId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, orderBill.getBillNo());
		query.setParameter(1, orderBill.getEmployee().getEmpId());
		query.setParameter(2, orderBill.getClient().getClientId());
		query.setParameter(3, orderBill.getBillTime());
		query.setParameter(4, orderBill.getBillAmount());
		query.setParameter(5, orderBill.getBillState());
		query.setParameter(6, orderBill.getDeliveryAt());
		query.setParameter(7, orderBill.getBillId());
		query.executeUpdate();
		session.close();

	}
	
	public void updateOtherOrderBill(OrderBill orderBill){
		Session session = getSessionFactory().openSession();
		String hql = ("update OrderBill b set b.billState = ? where b.billId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, orderBill.getBillState());
		query.setParameter(1, orderBill.getBillId());
		query.executeUpdate();
		session.close();
		
	}

	public void updateOrderBillByMoney(Integer billId, BigDecimal billAmount) {
		Session session = getSessionFactory().openSession();
		String hql = ("update OrderBill b set b.billAmount = ? where b.billId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, billAmount);
		query.setParameter(1, billId);
		query.executeUpdate();
		session.close();
	}

	@Override
	public OrderBill getOrderBill(Integer id) {
		OrderBill orderBill = (OrderBill) sessionFactory.openSession()
				.createQuery("from OrderBill b where b.billId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return orderBill;
	}

	@Override
	public List<OrderBill> getOrderBillByNo(String billNo) {
		List<OrderBill> lists = (List<OrderBill>) sessionFactory
				.openSession()
				.createQuery(
						"from OrderBill b where b.billNo like" + "'%" + billNo
								+ "%'").list();
		sessionFactory.openSession().close();
		return lists;
	}

	@Override
	public List<OrderBill> getOrderBillByBillState(Integer id) {
		List<OrderBill> lists = (List<OrderBill>) sessionFactory.openSession()
				.createQuery("from OrderBill b where b.billState =" + id)
				.list();
		sessionFactory.openSession().close();
		return lists;
	}

}
