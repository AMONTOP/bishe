package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.OrderBillProductDao;
import swust.model.OrderBillProduct;

public class OrderBillProductDaoImpl extends BaseDao implements
		OrderBillProductDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<OrderBillProduct> getAllOrderBillProducts() {
		Query query = sessionFactory.openSession().createQuery(
				"from OrderBillProduct");
		List<OrderBillProduct> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public void addOrderBillProduct(OrderBillProduct orderBill) {
		Session session = sessionFactory.openSession();
		session.save(orderBill);
		session.close();
	}

	@Override
	public void delOrderBillProduct(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete OrderBillProduct o where o.billProductId=" + id)
				.executeUpdate();
		sessionFactory.openSession().close();
	}

	@Override
	public void updateOrderBillProduct(OrderBillProduct orderBillProduct) {
		Session session = getSessionFactory().openSession();
		String hql = ("update OrderBillProduct b set b.orderBill.billId = ?,b.product.productId = ?,b.quantity = ? where b.billProductId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, orderBillProduct.getOrderBill().getBillId());
		query.setParameter(1, orderBillProduct.getProduct().getProductId());
		query.setParameter(2, orderBillProduct.getQuantity());
		query.setParameter(3, orderBillProduct.getBillProductId());
		query.executeUpdate();
		session.close();

	}

	@Override
	public OrderBillProduct getOrderBillProduct(Integer id) {
		OrderBillProduct orderBillProduct = (OrderBillProduct) sessionFactory
				.openSession()
				.createQuery(
						"from OrderBillProduct p where p.billProductId =" + id)
				.uniqueResult();
		sessionFactory.openSession().close();
		return orderBillProduct;
	}

	@Override
	public List<OrderBillProduct> getOrderBillProductByNo(Integer billId) {
		List<OrderBillProduct> lists = (List<OrderBillProduct>) sessionFactory
				.openSession()
				.createQuery(
						"from OrderBillProduct b where b.orderBill.billId ="
								+ billId).list();
		System.out.println(lists);
		sessionFactory.openSession().close();
		return lists;
	}

	@Override
	public List<OrderBillProduct> getProductByProductName(String productName) {
		List<OrderBillProduct> lists = (List<OrderBillProduct>) sessionFactory
				.openSession()
				.createQuery(
						"from OrderBillProduct b where b.product.productName like"
								+ "'%" + productName + "%'").list();
		sessionFactory.openSession().close();
		return lists;
	}
	
	public List<OrderBillProduct> getByBillId(Integer id){
		List<OrderBillProduct> lists = (List<OrderBillProduct>) sessionFactory
				.openSession()
				.createQuery(
						"from OrderBillProduct b where b.orderBill.billId="+id).list();
		sessionFactory.openSession().close();
		return lists;
	}

}
