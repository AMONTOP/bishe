package swust.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.MaterialCheckDao;
import swust.model.Material;
import swust.model.MaterialCheck;
import swust.model.MwareHouse;
import swust.model.MwareHouseMaterial;

public class MaterialCheckDaoImpl extends BaseDao implements MaterialCheckDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<MaterialCheck> getAllMaterialChecks() {
		Query query = sessionFactory.openSession().createQuery(
				"from MaterialCheck");
		List<MaterialCheck> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addMaterialCheck(MaterialCheck materialCheck) {
		Session session = sessionFactory.openSession();
		session.save(materialCheck);
		session.close();
	}

	@Override
	public void delMaterialCheck(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete MaterialCheck m where m.materialCheckId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateMaterialCheck(MaterialCheck materialCheck) {
		Session session = getSessionFactory().openSession();
		String hql = ("update MaterialCheck p set p.checkNo = ?,p.checkState = ?,p.checkItem = ?,p.checkNumber = ?,p.result = ?,p.state=?,p.qualify=?,p.cdate=? where p.materialCheckId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, materialCheck.getCheckNo());
		query.setParameter(1, materialCheck.getCheckState());
		query.setParameter(2, materialCheck.getCheckItem());
		query.setParameter(3, materialCheck.getCheckNumber());
		query.setParameter(4, materialCheck.getResult());
		query.setParameter(5, materialCheck.getState());
		query.setParameter(6, materialCheck.getQualify());
		query.setParameter(7, materialCheck.getCdate());
		query.setParameter(8, materialCheck.getMaterialCheckId());
		query.executeUpdate();

		System.out.println(materialCheck.getState());

		String hql2 = ("update MaterialInstockBill b set b.billState=?,b.auditAt=? where b.billId=?");
		Query query2 = sessionFactory.openSession().createQuery(hql2);
		Boolean stateBoolean = materialCheck.getState();
		int mystate = stateBoolean ? 1 : 2;
		Date auditAt = materialCheck.getCdate();
		query2.setParameter(0, mystate);
		query2.setParameter(1, auditAt);
		query2.setParameter(2, materialCheck.getMaterialInstockBill()
				.getBillId());
		query2.executeUpdate();

		String hql3 = ("update Purchase p set p.purState ='已审核' where p.purId = ?");
		Query query3 = sessionFactory.openSession().createQuery(hql3);
		query3.setParameter(0, materialCheck.getMaterialInstockBill()
				.getPurchase().getPurId());
		query3.executeUpdate();

		if (materialCheck.getState() == true) {
			Session session2 = getSessionFactory().openSession();
			MwareHouseMaterial mwareHouseMaterial = new MwareHouseMaterial();
			int quantity = materialCheck.getMaterialInstockBill().getQuantity();
			int wareId = materialCheck.getMaterialInstockBill().getMwareHouse()
					.getWareId();
			int materialId = materialCheck.getMaterial().getMaterialId();

			Material material = new Material();
			material.setMaterialId(materialId);
			MwareHouse mwareHouse = new MwareHouse();
			mwareHouse.setWareId(wareId);

			mwareHouseMaterial.setQuantity(quantity);
			mwareHouseMaterial.setMaterial(material);
			mwareHouseMaterial.setMwareHouse(mwareHouse);
			session2.save(mwareHouseMaterial);
			session2.close();
		}
		session.close();

	}

	@Override
	public MaterialCheck getMaterialCheck(Integer id) {
		MaterialCheck materialCheck = (MaterialCheck) sessionFactory
				.openSession()
				.createQuery(
						"from MaterialCheck m where m.materialCheckId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return materialCheck;
	}

	@Override
	public List<MaterialCheck> getMaterialCheckByBillId(Integer id) {
		List<MaterialCheck> lists = (List<MaterialCheck>) sessionFactory
				.openSession()
				.createQuery(
						"from MaterialCheck m where m.materialInstockBill.billId ="
								+ id).list();
		sessionFactory.openSession().close();
		return lists;
	}

	public List<MaterialCheck> getMaterialCheckByState(Integer id) {
		List<MaterialCheck> lists = (List<MaterialCheck>) sessionFactory
				.openSession()
				.createQuery("from MaterialCheck b where b.state =" + id)
				.list();
		sessionFactory.openSession().close();
		return lists;
	}

}
