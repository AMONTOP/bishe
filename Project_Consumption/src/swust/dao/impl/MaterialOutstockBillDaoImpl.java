package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.MaterialOutstockBillDao;
import swust.model.Material;
import swust.model.MaterialOutstockBill;

public class MaterialOutstockBillDaoImpl extends BaseDao implements
		MaterialOutstockBillDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<MaterialOutstockBill> getAllMaterialOutstockBills() {
		Query query = sessionFactory.openSession().createQuery(
				"from MaterialOutstockBill");
		List<MaterialOutstockBill> list = query.list();
		return list;
	}

	@Override
	public void addMaterialOutstockBill(
			MaterialOutstockBill materialOutstockBill) {
		Session session = sessionFactory.openSession();
		session.save(materialOutstockBill);
		session.close();
	}

	@Override
	public void delMaterialOutstockBill(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete MaterialOutstockBill c where c.billId=" + id)
				.executeUpdate();
	}

	@Override
	public void updateMaterialOutstockBill(
			MaterialOutstockBill materialOutstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = ("update MaterialOutstockBill c set c.billNo = ?,c.employee.empId = ?,c.mwareHouse.wareId = ?,c.materialWhereabouts = ?,c.billState = ?,c.auditAt=?,c.auditBy=? where c.billId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, materialOutstockBill.getBillNo());
		query.setParameter(1, materialOutstockBill.getEmployee().getEmpId());
		query.setParameter(2, materialOutstockBill.getMwareHouse().getWareId());
		query.setParameter(3, materialOutstockBill.getMaterialWhereabouts());
		query.setParameter(4, materialOutstockBill.getBillState());
		query.setParameter(5, materialOutstockBill.getAuditAt());
		query.setParameter(6, materialOutstockBill.getAuditBy());
		query.setParameter(7, materialOutstockBill.getBillId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public MaterialOutstockBill getMaterialOutstockBill(Integer id) {
		return (MaterialOutstockBill) sessionFactory
				.openSession()
				.createQuery(
						"from MaterialOutstockBill c where c.billId =" + id)
				.uniqueResult();
	}

	@Override
	public List<MaterialOutstockBill> getMaterialOutstockBillByBillState(
			Integer id) {
		List<MaterialOutstockBill> lists = (List<MaterialOutstockBill>) sessionFactory
				.openSession()
				.createQuery(
						"from MaterialOutstockBill b where b.billState =" + id)
				.list();
		sessionFactory.openSession().close();
		return lists;
	}

	@Override
	public List<MaterialOutstockBill> getBillNoByOnly() {
		Query query = sessionFactory.openSession().createQuery(
				"from MaterialOutstockBill GROUP BY billNo");
		List<MaterialOutstockBill> list = query.list();
		return list;
	}

	@Override
	public List<MaterialOutstockBill> getSimpleByBillNo(String billNo) {
		List<MaterialOutstockBill> lists = (List<MaterialOutstockBill>) sessionFactory
				.openSession()
				.createQuery(
						"from MaterialOutstockBill b where b.billNo ='"
								+ billNo + "'").list();
		sessionFactory.openSession().close();
		return lists;
	}

	@Override
	public List<Material> getMaterialDistinct(String billNo) {

		List<Material> lists = (List<Material>) sessionFactory
				.openSession()
				.createQuery(
						"FROM Material p WHERE NOT  EXISTS  ( SELECT 1 FROM MaterialOutstockBill b WHERE  p.materialId = b.material.materialId and b.billNo='"
								+ billNo + "')").list();
		return lists;
	}

	@Override
	public void addToupdateMaterialOutstockBill(
			MaterialOutstockBill materialOutstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = "insert into MaterialOutstockBill (quantity,remark,materialId,wareId) values (20,'入库',1,1)";
		Query query = sessionFactory.openSession().createQuery(hql);
		query.executeUpdate();
		session.close();

	}

	@Override
	public void updateMaterialOutstockBillMaterial(
			MaterialOutstockBill materialOutstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = ("update MaterialOutstockBill c set c.material.materialId=?,c.quantity=? where c.billId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, materialOutstockBill.getMaterial()
				.getMaterialId());
		query.setParameter(1, materialOutstockBill.getQuantity());
		query.setParameter(2, materialOutstockBill.getBillId());
		query.executeUpdate();
		session.close();

	}
}
