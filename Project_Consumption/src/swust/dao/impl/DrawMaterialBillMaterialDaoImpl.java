package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.DrawMaterialBillMaterialDao;
import swust.model.DrawMaterialBillMaterial;

public class DrawMaterialBillMaterialDaoImpl implements
		DrawMaterialBillMaterialDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<DrawMaterialBillMaterial> getAllDrawMaterialBillMaterials() {
		Query query = sessionFactory.openSession().createQuery(
				"from DrawMaterialBillMaterial ");
		List<DrawMaterialBillMaterial> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public List<DrawMaterialBillMaterial> getByBillId(Integer id) {
		Query query = sessionFactory.openSession().createQuery(
				"from DrawMaterialBillMaterial d where d.drawMaterialBill.drawbillId ="
						+ id);
		List<DrawMaterialBillMaterial> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addDrawMaterialBillMaterial(
			DrawMaterialBillMaterial drawMaterialBillMaterial) {
		Session session = sessionFactory.openSession();
		session.save(drawMaterialBillMaterial);
		session.close();
	}

	@Override
	public void delDrawMaterialBillMaterial(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete DrawMaterialBillMaterial p where p.billMaterialId="
								+ id).executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateDrawMaterialBillMaterial(
			DrawMaterialBillMaterial drawMaterialBillMaterial) {
		Session session = getSessionFactory().openSession();
		String hql = ("update DrawMaterialBillMaterial c set c.drawMaterialBill.drawbillId = ?,c.material.materialId = ?,c.quantity = ?,c.remark = ? where c.billMaterialId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, drawMaterialBillMaterial.getDrawMaterialBill()
				.getDrawbillId());
		query.setParameter(1, drawMaterialBillMaterial.getMaterial()
				.getMaterialId());
		query.setParameter(2, drawMaterialBillMaterial.getQuantity());
		query.setParameter(3, drawMaterialBillMaterial.getRemark());
		query.setParameter(4, drawMaterialBillMaterial.getBillMaterialId());
		query.executeUpdate();
		session.close();

	}

	@Override
	public DrawMaterialBillMaterial getDrawMaterialBillMaterial(Integer id) {
		DrawMaterialBillMaterial drawMaterialBillMaterial = (DrawMaterialBillMaterial) sessionFactory
				.openSession()
				.createQuery(
						"from DrawMaterialBillMaterial p where p.billMaterialId ="
								+ id).uniqueResult();
		sessionFactory.openSession().close();
		return drawMaterialBillMaterial;
	}

}
