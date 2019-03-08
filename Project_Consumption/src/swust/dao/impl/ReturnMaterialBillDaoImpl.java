package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ReturnMaterialBillDao;
import swust.model.ReturnMaterialBill;

public class ReturnMaterialBillDaoImpl extends BaseDao implements
		ReturnMaterialBillDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<ReturnMaterialBill> getAllReturnMaterialBills() {
		Query query = sessionFactory.openSession().createQuery(
				"from ReturnMaterialBill");
		List<ReturnMaterialBill> list = query.list();
		return list;
	}

	@Override
	public void addReturnMaterialBill(ReturnMaterialBill returnMaterialBill) {
		Session session = sessionFactory.openSession();
		session.save(returnMaterialBill);
		session.close();
	}

	@Override
	public void delReturnMaterialBill(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete ReturnMaterialBill c where c.returnbillId="
								+ id).executeUpdate();
	}

	@Override
	public void updateReturnMaterialBill(ReturnMaterialBill returnMaterialBill) {
		Session session = getSessionFactory().openSession();
		String hql = ("update ReturnMaterialBill c set c.billNo = ?,c.employee.empId = ?,c.mwareHouse.wareId = ?,c.returnReason = ?,c.billState = ?,c.auditAt=?,c.auditBy=? where c.returnbillId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, returnMaterialBill.getBillNo());
		query.setParameter(1, returnMaterialBill.getEmployee().getEmpId());
		query.setParameter(2, returnMaterialBill.getMwareHouse().getWareId());
		query.setParameter(3, returnMaterialBill.getReturnReason());
		query.setParameter(4, returnMaterialBill.getBillState());
		query.setParameter(5, returnMaterialBill.getAuditAt());
		query.setParameter(6, returnMaterialBill.getAuditBy());
		query.setParameter(7, returnMaterialBill.getReturnbillId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public ReturnMaterialBill getReturnMaterialBill(Integer id) {
		return (ReturnMaterialBill) sessionFactory
				.openSession()
				.createQuery(
						"from ReturnMaterialBill c where c.returnbillId =" + id)
				.uniqueResult();
	}

	@Override
	public List<ReturnMaterialBill> getReturnMaterialBillByBillState(Integer id) {
		List<ReturnMaterialBill> lists = (List<ReturnMaterialBill>) sessionFactory
				.openSession()
				.createQuery(
						"from ReturnMaterialBill b where b.billState =" + id)
				.list();
		sessionFactory.openSession().close();
		return lists;
	}

	public ReturnMaterialBill getReturnMaterialBillByNo(String billNo) {
		ReturnMaterialBill returnMaterialBill = (ReturnMaterialBill) sessionFactory
				.openSession()
				.createQuery(
						"from ReturnMaterialBill b where b.billNo =" + billNo)
				.uniqueResult();
		sessionFactory.openSession().close();
		return returnMaterialBill;
	}

}
