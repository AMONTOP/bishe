package swust.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ProductCheckDao;
import swust.model.Product;
import swust.model.ProductCheck;
import swust.model.WareHouse;
import swust.model.WareHouseProduct;

public class ProductCheckDaoImpl extends BaseDao implements ProductCheckDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<ProductCheck> getAllProductChecks() {
		Query query = sessionFactory.openSession().createQuery(
				"from ProductCheck");
		List<ProductCheck> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addProductCheck(ProductCheck productCheck) {
		Session session = sessionFactory.openSession();
		session.save(productCheck);
		session.close();
	}

	@Override
	public void delProductCheck(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete ProductCheck m where m.productCheckId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateProductCheck(ProductCheck productCheck) {
		/* HttpServletRequest reqeust = ServletActionContext.getRequest(); */
		Session session = getSessionFactory().openSession();
		String hql = ("update ProductCheck p set p.checkNo = ?,p.checkState = ?,p.checkItem = ?,p.checkNumber = ?,p.result = ?,p.state=?,p.qualify=?,p.cdate=? where p.productCheckId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, productCheck.getCheckNo());
		query.setParameter(1, productCheck.getCheckState());
		query.setParameter(2, productCheck.getCheckItem());
		query.setParameter(3, productCheck.getCheckNumber());
		query.setParameter(4, productCheck.getResult());
		query.setParameter(5, productCheck.getState());
		query.setParameter(6, productCheck.getQualify());
		query.setParameter(7, productCheck.getCdate());
		query.setParameter(8, productCheck.getProductCheckId());
		query.executeUpdate();

		System.out.println(productCheck.getState());

		String hql2 = ("update ProductInstockBill b set b.billState=?,b.auditAt=? where b.billId=?");
		Query query2 = sessionFactory.openSession().createQuery(hql2);
		Boolean stateBoolean = productCheck.getState();
		int mystate = stateBoolean ? 1 : 2;
		Date auditAt = productCheck.getCdate();
		query2.setParameter(0, mystate);
		query2.setParameter(1, auditAt);
		query2.setParameter(2, productCheck.getProductInstockBill().getBillId());
		query2.executeUpdate();

		if (productCheck.getState() == true) {
			Session session2 = getSessionFactory().openSession();
			WareHouseProduct wareHouseProduct = new WareHouseProduct();
			int quantity = productCheck.getProductInstockBill().getQuantity();
			int wareId = productCheck.getProductInstockBill().getWareHouse()
					.getWareId();
			int productId = productCheck.getProduct().getProductId();

			Product product = new Product();
			product.setProductId(productId);
			WareHouse wareHouse = new WareHouse();
			wareHouse.setWareId(wareId);

			wareHouseProduct.setQuantity(quantity);
			wareHouseProduct.setProduct(product);
			wareHouseProduct.setWareHouse(wareHouse);
			session2.save(wareHouseProduct);
			session2.close();
		}
		session.close();

	}

	@Override
	public ProductCheck getProductCheck(Integer id) {
		ProductCheck productCheck = (ProductCheck) sessionFactory
				.openSession()
				.createQuery(
						"from ProductCheck m where m.productCheckId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return productCheck;
	}

	@Override
	public List<ProductCheck> getProductCheckByBillId(Integer id) {
		List<ProductCheck> lists = (List<ProductCheck>) sessionFactory
				.openSession()
				.createQuery(
						"from ProductCheck m where m.productInstockBill.billId ="
								+ id).list();
		sessionFactory.openSession().close();
		return lists;
	}

	@Override
	public List<ProductCheck> getProductCheckByState(Integer id) {
		List<ProductCheck> lists = (List<ProductCheck>) sessionFactory
				.openSession()
				.createQuery("from ProductCheck b where b.state =" + id).list();
		sessionFactory.openSession().close();
		return lists;
	}
}
