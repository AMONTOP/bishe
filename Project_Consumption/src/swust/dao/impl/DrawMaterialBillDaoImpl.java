package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.DrawMaterialBillDao;
import swust.model.DrawMaterialBill;

public class DrawMaterialBillDaoImpl extends BaseDao implements
		DrawMaterialBillDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<DrawMaterialBill> getAllDrawMaterialBills() {
		Query query = sessionFactory.openSession().createQuery(
				"from DrawMaterialBill d  group by d.billNo");
		List<DrawMaterialBill> list = query.list();
		/*
		 * sessionFactory .openSession() .createQuery(
		 * "delete from DrawMaterialBill d where d.drawbillId not in (select t.billNo from (select d.drawbillId from DrawMaterialBill group by d.billNo) t)"
		 * ) .executeUpdate();
		 */

		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addDrawMaterialBill(DrawMaterialBill drawMaterialBill) {
		Session session = sessionFactory.openSession();
		session.save(drawMaterialBill);
		session.close();
	}

	@Override
	public void delDrawMaterialBill(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete DrawMaterialBill c where c.drawbillId=" + id)
				.executeUpdate();
	}

	@Override
	public void updateDrawMaterialBill(DrawMaterialBill drawMaterialBill) {
		Session session = getSessionFactory().openSession();
		String hql = ("update DrawMaterialBill c set c.employee.empId = ?,c.mwareHouse.wareId = ?,c.drawReason = ?,c.billState = ?,c.auditAt=?,c.billTime=? where c.drawbillId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, drawMaterialBill.getEmployee().getEmpId());
		query.setParameter(1, drawMaterialBill.getMwareHouse().getWareId());
		query.setParameter(2, drawMaterialBill.getDrawReason());
		query.setParameter(3, drawMaterialBill.getBillState());
		query.setParameter(4, drawMaterialBill.getAuditAt());
		query.setParameter(5, drawMaterialBill.getBillTime());
		query.setParameter(6, drawMaterialBill.getDrawbillId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public DrawMaterialBill getDrawMaterialBill(Integer id) {
		return (DrawMaterialBill) sessionFactory
				.openSession()
				.createQuery(
						"from DrawMaterialBill c where c.drawbillId =" + id)
				.uniqueResult();
	}

	public List<DrawMaterialBill> getDrawMaterialBillByBillState(Integer id) {
		List<DrawMaterialBill> lists = (List<DrawMaterialBill>) sessionFactory
				.openSession()
				.createQuery("from DrawMaterialBill b where b.billState =" + id)
				.list();
		sessionFactory.openSession().close();
		return lists;
	}

	public List<DrawMaterialBill> getDrawMaterialBillByNo(String billNo) {
		List<DrawMaterialBill> lists = sessionFactory
				.openSession()
				.createQuery(
						"from DrawMaterialBill b where b.billNo =" + billNo)
				.list();
		sessionFactory.openSession().close();
		return lists;
	}

}
