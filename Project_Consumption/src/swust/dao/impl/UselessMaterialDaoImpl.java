package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.UselessMaterialDao;
import swust.model.MaterialCheck;
import swust.model.MaterialInstockBill;
import swust.model.UselessMaterial;

public class UselessMaterialDaoImpl extends BaseDao implements
		UselessMaterialDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<UselessMaterial> getAllUselessMaterials() {
		Query query = sessionFactory.openSession().createQuery(
				"from UselessMaterial");
		List<UselessMaterial> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addUselessMaterial(UselessMaterial uselessMaterial) {
		Session session = sessionFactory.openSession();

		int materialCheckId = uselessMaterial.getMaterialCheck()
				.getMaterialCheckId();
		int billId = uselessMaterial.getMaterialInstockBill().getBillId();
		String checkItem = uselessMaterial.getMaterialCheck().getCheckItem();
		String useNo = uselessMaterial.getUseNo();

		MaterialCheck materialCheck = new MaterialCheck();
		materialCheck.setMaterialCheckId(materialCheckId);
		MaterialInstockBill materialInstockBill = new MaterialInstockBill();
		materialInstockBill.setBillId(billId);

		uselessMaterial.setMaterialCheck(materialCheck);
		uselessMaterial.setMaterialInstockBill(materialInstockBill);
		uselessMaterial.setUseNo(useNo);
		uselessMaterial.setRemark(checkItem);

		session.save(uselessMaterial);

		String hql2 = ("update MaterialInstockBill c set c.flag=? where c.billId = ?");
		Query query2 = sessionFactory.openSession().createQuery(hql2);
		query2.setParameter(0, true);
		query2.setParameter(1, billId);
		query2.executeUpdate();
		session.close();
	}

	@Override
	public void delUselessMaterial(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete UselessMaterial c where c.useId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();

	}

	@Override
	public void updateUselessMaterial(UselessMaterial uselessMaterial) {
		// TODO Auto-generated method stub

	}

	@Override
	public UselessMaterial getUselessMaterial(Integer id) {
		return (UselessMaterial) sessionFactory.openSession()
				.createQuery("from UselessMaterial c where c.useId =" + id)
				.uniqueResult();
	}

}
