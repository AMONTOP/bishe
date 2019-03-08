package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ProductOutstockBillDao;
import swust.model.Product;
import swust.model.ProductOutstockBill;

public class ProductOutstockBillDaoImpl extends BaseDao implements
		ProductOutstockBillDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<ProductOutstockBill> getAllProductOutstockBills() {
		Query query = sessionFactory.openSession().createQuery(
				"from ProductOutstockBill");
		List<ProductOutstockBill> list = query.list();
		return list;
	}

	@Override
	public void addProductOutstockBill(ProductOutstockBill productOutstockBill) {
		Session session = sessionFactory.openSession();
		session.save(productOutstockBill);
		session.close();
	}

	@Override
	public void delProductOutstockBill(Integer id) {
		sessionFactory
				.openSession()
				.createQuery(
						"delete ProductOutstockBill c where c.billId=" + id)
				.executeUpdate();
	}

	@Override
	public void updateProductOutstockBill(
			ProductOutstockBill productOutstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = ("update ProductOutstockBill c set c.billNo = ?,c.employee.empId = ?,c.wareHouse.wareId = ?,c.productWhereabouts = ?,c.billState = ?,c.auditAt=?,c.auditBy=? where c.billId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, productOutstockBill.getBillNo());
		query.setParameter(1, productOutstockBill.getEmployee().getEmpId());
		query.setParameter(2, productOutstockBill.getWareHouse().getWareId());
		query.setParameter(3, productOutstockBill.getProductWhereabouts());
		query.setParameter(4, productOutstockBill.getBillState());
		query.setParameter(5, productOutstockBill.getAuditAt());
		query.setParameter(6, productOutstockBill.getAuditBy());
		query.setParameter(7, productOutstockBill.getBillId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public ProductOutstockBill getProductOutstockBill(Integer id) {
		return (ProductOutstockBill) sessionFactory
				.openSession()
				.createQuery("from ProductOutstockBill c where c.billId =" + id)
				.uniqueResult();
	}

	@Override
	public List<ProductOutstockBill> getProductOutstockBillByBillState(
			Integer id) {
		List<ProductOutstockBill> lists = (List<ProductOutstockBill>) sessionFactory
				.openSession()
				.createQuery(
						"from ProductOutstockBill b where b.billState =" + id)
				.list();
		sessionFactory.openSession().close();
		return lists;
	}

	@Override
	public List<ProductOutstockBill> getBillNoByOnly() {
		Query query = sessionFactory.openSession().createQuery(
				"from ProductOutstockBill GROUP BY billNo");
		List<ProductOutstockBill> list = query.list();
		return list;
	}

	@Override
	public List<ProductOutstockBill> getSimpleByBillNo(String billNo) {
		List<ProductOutstockBill> lists = (List<ProductOutstockBill>) sessionFactory
				.openSession()
				.createQuery(
						"from ProductOutstockBill b where b.billNo ='" + billNo
								+ "'").list();
		sessionFactory.openSession().close();
		return lists;
	}

	@Override
	public List<Product> getProductDistinct(String billNo) {

		List<Product> lists = (List<Product>) sessionFactory
				.openSession()
				.createQuery(
						"FROM Product p WHERE NOT  EXISTS  ( SELECT 1 FROM ProductOutstockBill b WHERE  p.productId = b.product.productId and b.billNo='"
								+ billNo + "')").list();
		return lists;
	}

	@Override
	public void addToupdateProductOutstockBill(
			ProductOutstockBill productOutstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = "insert into ProductOutstockBill (quantity,remark,productId,wareId) values (20,'入库',1,1)";
		Query query = sessionFactory.openSession().createQuery(hql);
		query.executeUpdate();
		session.close();

	}

	@Override
	public void updateProductOutstockBillProduct(
			ProductOutstockBill productOutstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = ("update ProductOutstockBill c set c.product.productId=?,c.quantity=? where c.billId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, productOutstockBill.getProduct().getProductId());
		query.setParameter(1, productOutstockBill.getQuantity());
		query.setParameter(2, productOutstockBill.getBillId());
		query.executeUpdate();
		session.close();

	}
}
