package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.MwareHouseMaterialDao;
import swust.model.MwareHouseMaterial;

public class MwareHouseMaterialDaoImpl extends BaseDao implements
		MwareHouseMaterialDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<MwareHouseMaterial> getAllMwareHouseMaterials() {
		Query query = sessionFactory.openSession().createQuery(
				"from MwareHouseMaterial");
		List<MwareHouseMaterial> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	public void minusMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		Session session = sessionFactory.openSession();
		session.save(mwareHouseMaterial);

		HttpServletRequest request = ServletActionContext.getRequest();
		String billId = request.getParameter("materialOutstockBill.billId");
		System.out.println(billId);
		String hql = ("update MaterialOutstockBill p set p.billState=1 where billId=?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, Integer.parseInt(billId));
		query.executeUpdate();
		session.close();
	}

	@Override
	public List<MwareHouseMaterial> getMwareHouseMaterialByWare(Integer wareId) {
		return (List<MwareHouseMaterial>) sessionFactory
				.openSession()
				.createQuery(
						"from MwareHouseMaterial c where c.mwareHouse.wareId="
								+ wareId).list();

	}

	@Override
	public List<MwareHouseMaterial> getOnlyMwareHouseMaterials(Integer wareId) {
		// 动态修改wareId
		// SELECT
		// c.product.spec,c.product.productName,c.product.price,c.wareHouse.wareId,c.wareHouse.wareNo,sum(c.quantity)
		// FROM WareHouseProduct c GROUP BY c.product.productId HAVING
		// c.wareHouse.wareId=
		String hql = "SELECT c.material.spec,c.material.materialName,c.material.cost,c.mwareHouse.wareId,c.mwareHouse.wareNo,sum(c.quantity) FROM MwareHouseMaterial c WHERE c.mwareHouse.wareId="
				+ wareId + "GROUP BY c.material.materialId ";
		return (List<MwareHouseMaterial>) sessionFactory.openSession()
				.createQuery(hql).list();
	}

	@Override
	public void updateMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		Session session = getSessionFactory().openSession();
		String hql = "insert into mware_house_material  (quantity,material.materialId,mwareHouse.wareId,remark) select quantity,material.materialId,mwareHouse.wareId,remark from material_instock_bill";
		Query query = session.createSQLQuery(hql);
		query.executeUpdate();
		// String hql =
		// ("update MwareHouseMaterial a set a.quantity= a.quantity + (select b.quantity from MaterialInstockBill b where b.wareHouse.wareId=a.wareHouse.wareId and b.material.materialId=a.material.materialId)");
		// Query query = sessionFactory.openSession().createQuery(hql); //
		// System.out.println(query);
		// query.executeUpdate();
		session.close();

	}

	@Override
	public void updateOnlyMwareHouseMaterial(
			MwareHouseMaterial mwareHouseMaterial) {
		Session session = getSessionFactory().openSession();
		// 更改数量
		String hql2 = ("update MwareHouseMaterial p set p.quantity=p.quantity-? where p.mwareHouse.wareId=? and p.material.materialId=? and p.flag=1");
		Query query = sessionFactory.openSession().createQuery(hql2)
				.setFirstResult(1).setMaxResults(1);
		HttpServletRequest request = ServletActionContext.getRequest();
		query.setParameter(0, Integer.parseInt(request
				.getParameter("wareHouseMaterial.quantity")));
		query.setParameter(1, Integer.parseInt(request
				.getParameter("wareHouseMaterial.mwareHouse.wareId")));
		query.setParameter(2, Integer.parseInt(request
				.getParameter("wareHouseMaterial.material.materialId")));
		// 如何只更新一条数据?
		query.executeUpdate();

		// 更改审核状态

		String billId = request.getParameter("materialOutstockBill.billId");
		System.out.println(billId);
		String hql = ("update MaterialOutstockBill p set p.billState=2 where billId=?");
		Query query2 = sessionFactory.openSession().createQuery(hql);
		query2.setParameter(0, Integer.parseInt(billId));
		query2.executeUpdate();
		session.close();
	}

	@Override
	public void addMwareHouseMaterial(MwareHouseMaterial wareHouseMaterial) {
		Session session = sessionFactory.openSession();
		session.save(wareHouseMaterial);

		HttpServletRequest request = ServletActionContext.getRequest();
		String billId = request.getParameter("materialInstockBill.billId");
		System.out.println(billId);
		String hql = ("update MaterialInstockBill p set p.billState=2 where billId=?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, Integer.parseInt(billId));
		query.executeUpdate();
		session.close();
	}

	@Override
	public void addToMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		Session session = sessionFactory.openSession();
		session.save(mwareHouseMaterial);

		HttpServletRequest request = ServletActionContext.getRequest();
		String drawbillId = request.getParameter("drawMaterialBill.drawbillId");
		String hql = ("update DrawMaterialBill p set p.billState=2 where p.drawbillId=?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, Integer.parseInt(drawbillId));
		query.executeUpdate();

		session.close();
	}

	@Override
	public void addTo2MwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		Session session = sessionFactory.openSession();
		session.save(mwareHouseMaterial);

		HttpServletRequest request = ServletActionContext.getRequest();
		String returnbillId = request
				.getParameter("returnMaterialBill.returnbillId");
		String hql = ("update ReturnMaterialBill p set p.billState=2 where p.returnbillId=?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, Integer.parseInt(returnbillId));
		query.executeUpdate();

		session.close();
	}

	public List<MwareHouseMaterial> existMwareHouseMaterial(
			MwareHouseMaterial wareHouseMaterial) {
		HttpServletRequest request = ServletActionContext.getRequest();
		String wareId = request.getParameter("wareId");
		String materialId = request.getParameter("materialId");
		Query query = sessionFactory.openSession().createQuery(
				"from MwareHouseMaterial where materialId=? and wareId=?");
		query.setParameter(0, materialId);
		query.setParameter(1, wareId);
		List<MwareHouseMaterial> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public List<MwareHouseMaterial> getByMaterialId() {
		/*
		 * Query query = sessionFactory .openSession() .createQuery(
		 * "select m.material.materialId,m.material.materialName,m.material.materialNo,sum(m.quantity) from MwareHouseMaterial m group by m.material.materialId having sum(m.quantity)<100"
		 * );
		 */
		Query query = sessionFactory
				.openSession()
				.createQuery(
						"select m.material.materialId,m.material.materialName,m.material.materialNo,sum(m.quantity),m.mwareHouse.wareNo,m.wid from MwareHouseMaterial m group by m.material.materialId,m.mwareHouse.wareId having sum(m.quantity)<100");
		List<MwareHouseMaterial> list = query.list();
		System.out.println(list);
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public List<MwareHouseMaterial> materialOnlyMwareHouseMaterial(
			Integer wareId) {
		HttpServletRequest request = ServletActionContext.getRequest();
		/*
		 * Query query = sessionFactory .openSession() .createQuery(
		 * "SELECT DISTINCT w.material.materialId from MwareHouseMaterial w where w.wareHouse.wareId=?"
		 * );
		 */
		Query query = sessionFactory
				.openSession()
				.createQuery(
						"SELECT p.materialName,p.materialId FROM Material p where p.materialId in (SELECT DISTINCT w.material.materialId from MwareHouseMaterial w where w.mwareHouse.wareId=?)");
		query.setParameter(0, wareId);
		List<MwareHouseMaterial> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public List<MwareHouseMaterial> quantityHouseMaterials(Integer wareId,
			Integer materialId) {
		// 动态修改wareId
		String hql = "SELECT c.material.spec,c.material.materialName,c.material.cost,c.mwareHouse.wareId,c.mwareHouse.wareNo,sum(c.quantity) FROM MwareHouseMaterial c GROUP BY c.material.materialId HAVING c.mwareHouse.wareId=? and c.material.materialId=?";
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, wareId);
		query.setParameter(1, materialId);
		List<MwareHouseMaterial> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	public MwareHouseMaterial getById(Integer id) {
		MwareHouseMaterial mwareHouseMaterial = (MwareHouseMaterial) sessionFactory
				.openSession()
				.createQuery("from MwareHouseMaterial m where m.wid =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return mwareHouseMaterial;
	}

}
