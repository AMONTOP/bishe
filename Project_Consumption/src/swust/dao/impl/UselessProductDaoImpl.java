package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.UselessProductDao;
import swust.model.ProductCheck;
import swust.model.ProductInstockBill;
import swust.model.UselessProduct;

public class UselessProductDaoImpl extends BaseDao implements UselessProductDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<UselessProduct> getAllUselessProducts() {
		Query query = sessionFactory.openSession().createQuery(
				"from UselessProduct");
		List<UselessProduct> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addUselessProduct(UselessProduct uselessProduct) {
		Session session = sessionFactory.openSession();

		int productCheckId = uselessProduct.getProductCheck()
				.getProductCheckId();
		int billId = uselessProduct.getProductInstockBill().getBillId();
		String checkItem = uselessProduct.getProductCheck().getCheckItem();
		String useNo = uselessProduct.getUseNo();

		ProductCheck productCheck = new ProductCheck();
		productCheck.setProductCheckId(productCheckId);
		ProductInstockBill productInstockBill = new ProductInstockBill();
		productInstockBill.setBillId(billId);

		uselessProduct.setProductCheck(productCheck);
		uselessProduct.setProductInstockBill(productInstockBill);
		uselessProduct.setUseNo(useNo);
		uselessProduct.setRemark(checkItem);

		session.save(uselessProduct);

		String hql2 = ("update ProductInstockBill c set c.flag=? where c.billId = ?");
		Query query2 = sessionFactory.openSession().createQuery(hql2);
		query2.setParameter(0, true);
		query2.setParameter(1, billId);
		query2.executeUpdate();
		session.close();
	}

	@Override
	public void delUselessProduct(Integer id) {
		sessionFactory.openSession()
				.createQuery("delete UselessProduct c where c.useId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();

	}

	@Override
	public void updateUselessProduct(UselessProduct uselessProduct) {
		// TODO Auto-generated method stub

	}

	@Override
	public UselessProduct getUselessProduct(Integer id) {
		return (UselessProduct) sessionFactory.openSession()
				.createQuery("from UselessProduct c where c.useId =" + id)
				.uniqueResult();
	}

}
