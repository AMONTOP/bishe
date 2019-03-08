package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ReturnMaterialBillMaterialDao;
import swust.model.ReturnMaterialBillMaterial;

public class ReturnMaterialBillMaterialDaoImpl implements
		ReturnMaterialBillMaterialDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<ReturnMaterialBillMaterial> getAllReturnMaterialBillMaterials() {
		Query query = sessionFactory.openSession().createQuery(
				"from ReturnMaterialBillMaterial");
		List<ReturnMaterialBillMaterial> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addReturnMaterialBillMaterial(
			ReturnMaterialBillMaterial returnMaterialBillMaterial) {
		Session session = sessionFactory.openSession();
		session.save(returnMaterialBillMaterial);

		// int quantity = returnMaterialBillMaterial.getQuantity();
		// int materialId = returnMaterialBillMaterial.getMaterial()
		// .getMaterialId();
		/*
		 * int wareId = returnMaterialBillMaterial.getReturnMaterialBill()
		 * .getMwareHouse().getWareId();
		 */

		// System.out.println(quantity);
		// System.out.println(materialId);
		//
		//
		// MwareHouseMaterial mwareHouseMaterial = new MwareHouseMaterial();
		// Material material = new Material();
		// material.setMaterialId(materialId);
		// MwareHouse mwareHouse = new MwareHouse();
		// mwareHouse.setWareId(3);
		// mwareHouseMaterial.setQuantity(quantity);
		// mwareHouseMaterial.setMwareHouse(mwareHouse);
		// mwareHouseMaterial.setMaterial(material);
		//
		// session.save(mwareHouseMaterial);

		session.close();
	}

	@Override
	public void delReturnMaterialBillMaterial(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete ReturnMaterialBillMaterial p where p.billMaterialId="
								+ id).executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateReturnMaterialBillMaterial(
			ReturnMaterialBillMaterial returnMaterialBillMaterial) {
		Session session = getSessionFactory().openSession();
		String hql = ("update ReturnMaterialBillMaterial c set c.quantity = ?,c.remark = ? where c.billMaterialId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, returnMaterialBillMaterial.getQuantity());
		query.setParameter(1, returnMaterialBillMaterial.getRemark());
		query.setParameter(2, returnMaterialBillMaterial.getBillMaterialId());
		query.executeUpdate();
		session.close();

	}

	@Override
	public ReturnMaterialBillMaterial getReturnMaterialBillMaterial(Integer id) {
		ReturnMaterialBillMaterial ReturnMaterialBillMaterial = (ReturnMaterialBillMaterial) sessionFactory
				.openSession()
				.createQuery(
						"from ReturnMaterialBillMaterial p where p.billMaterialId ="
								+ id).uniqueResult();
		sessionFactory.openSession().close();
		return ReturnMaterialBillMaterial;
	}

	@Override
	public List<ReturnMaterialBillMaterial> getByBillId(Integer id) {
		Query query = sessionFactory.openSession().createQuery(
				"from ReturnMaterialBillMaterial d where d.returnMaterialBill.returnbillId ="
						+ id);
		List<ReturnMaterialBillMaterial> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}
}
