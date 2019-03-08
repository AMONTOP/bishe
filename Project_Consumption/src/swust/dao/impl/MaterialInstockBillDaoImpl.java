package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.MaterialInstockBillDao;
import swust.model.Employee;
import swust.model.Material;
import swust.model.MaterialCheck;
import swust.model.MaterialInstockBill;

public class MaterialInstockBillDaoImpl extends BaseDao implements
		MaterialInstockBillDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<MaterialInstockBill> getAllMaterialInstockBills() {
		Query query = sessionFactory.openSession().createQuery(
				"from MaterialInstockBill");
		List<MaterialInstockBill> list = query.list();
		return list;
	}

	@Override
	public void addMaterialInstockBill(MaterialInstockBill materialInstockBill) {
		Session session = sessionFactory.openSession();
		session.save(materialInstockBill);
		session.close();
	}

	@Override
	public void delMaterialInstockBill(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete MaterialInstockBill c where c.billId=" + id)
				.executeUpdate();
	}

	@Override
	public void updateMaterialInstockBill(
			MaterialInstockBill materialInstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = ("update MaterialInstockBill c set c.billNo = ?,c.employee.empId = ?,c.mwareHouse.wareId = ?,c.materialSource = ?,c.billState = ?,c.auditAt=?,c.auditBy=? where c.billId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, materialInstockBill.getBillNo());
		query.setParameter(1, materialInstockBill.getEmployee().getEmpId());
		query.setParameter(2, materialInstockBill.getMwareHouse().getWareId());
		query.setParameter(3, materialInstockBill.getMaterialSource());
		query.setParameter(4, materialInstockBill.getBillState());
		query.setParameter(5, materialInstockBill.getAuditAt());
		query.setParameter(6, materialInstockBill.getAuditBy());
		query.setParameter(7, materialInstockBill.getBillId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public void updateMaterialInstockBillMaterial(
			MaterialInstockBill materialInstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = ("update MaterialInstockBill c set c.material.materialId=?,c.quantity=? where c.billId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, materialInstockBill.getMaterial().getMaterialId());
		query.setParameter(1, materialInstockBill.getQuantity());
		query.setParameter(2, materialInstockBill.getBillId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public void addToupdateMaterialInstockBill(
			MaterialInstockBill materialInstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = "insert into MaterialInstockBill (quantity,remark,materialId,wareId) values (20,'入库',1,1)";
		Query query = sessionFactory.openSession().createQuery(hql);
		query.executeUpdate();
		session.close();
	}

	@Override
	public MaterialInstockBill getMaterialInstockBill(Integer id) {
		return (MaterialInstockBill) sessionFactory
				.openSession()
				.createQuery("from MaterialInstockBill c where c.billId =" + id)
				.uniqueResult();
	}

	@Override
	public List<MaterialInstockBill> getMaterialInstockBillByBillState(
			Integer id) {
		List<MaterialInstockBill> lists = (List<MaterialInstockBill>) sessionFactory
				.openSession()
				.createQuery(
						"from MaterialInstockBill b where b.billState =" + id)
				.list();
		sessionFactory.openSession().close();
		return lists;
	}

	@Override
	public List<MaterialInstockBill> getBillNoByOnly() {
		Query query = sessionFactory.openSession().createQuery(
				"from MaterialInstockBill GROUP BY billNo");
		List<MaterialInstockBill> list = query.list();
		return list;
	}

	@Override
	public List<MaterialInstockBill> getSimpleByBillNo(String billNo) {
		List<MaterialInstockBill> lists = (List<MaterialInstockBill>) sessionFactory
				.openSession()
				.createQuery(
						"from MaterialInstockBill b where b.billNo ='" + billNo
								+ "'").list();
		sessionFactory.openSession().close();
		return lists;
	}

	@Override
	public List<Material> getMaterialDistinct(String billNo) {

		List<Material> lists = (List<Material>) sessionFactory
				.openSession()
				.createQuery(
						"FROM Material p WHERE NOT  EXISTS  ( SELECT 1 FROM MaterialInstockBill b WHERE  p.materialId = b.material.materialId and b.billNo='"
								+ billNo + "')").list();
		return lists;
	}

	@Override
	public void addToMaterialCheck(MaterialInstockBill materialInstockBill) {
		Session session = getSessionFactory().openSession();
		MaterialCheck materialCheck = new MaterialCheck();
		int materialId = materialInstockBill.getMaterial().getMaterialId();
		int empId = materialInstockBill.getEmployee().getEmpId();
		int billState = materialInstockBill.getBillState();
		int billId = materialInstockBill.getBillId();

		Material material = new Material();
		material.setMaterialId(materialId);
		Employee employee = new Employee();
		employee.setEmpId(empId);
		MaterialInstockBill proInstockBill = new MaterialInstockBill();
		proInstockBill.setBillId(billId);

		materialCheck.setMaterial(material);
		materialCheck.setEmployee(employee);
		materialCheck.setMaterialInstockBill(proInstockBill);

		boolean state = (billState == 1) ? true : false;
		materialCheck.setCheckState(state);

		session.save(materialCheck);
		session.close();
	}

}
