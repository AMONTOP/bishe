package swust.dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.WareHouseProductDao;
import swust.model.WareHouseProduct;

public class WareHouseProductDaoImpl extends BaseDao implements
		WareHouseProductDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<WareHouseProduct> getAllWareHouseProducts() {
		Query query = sessionFactory.openSession().createQuery(
				"from WareHouseProduct");
		List<WareHouseProduct> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public List<WareHouseProduct> getWareHouseProductByWare(Integer wareId) {
		return (List<WareHouseProduct>) sessionFactory
				.openSession()
				.createQuery(
						"from WareHouseProduct c where c.wareHouse.wareId="
								+ wareId).list();

	}

	@Override
	public List<WareHouseProduct> getOnlyWareHouseProducts(Integer wareId) {
		// 动态修改wareId
		String hql = "SELECT c.product.spec,c.product.productName,c.product.price,c.wareHouse.wareId,c.wareHouse.wareNo,sum(c.quantity) FROM WareHouseProduct c WHERE c.wareHouse.wareId="
				+ wareId + "GROUP BY c.product.productId";
		return (List<WareHouseProduct>) sessionFactory.openSession()
				.createQuery(hql).list();
	}

	@Override
	public void updateWareHouseProduct(WareHouseProduct wareHouseProduct) {
		Session session = getSessionFactory().openSession();
		String hql = "insert into ware_house_product  (quantity,product.productId,wareHouse.wareId,remark) select quantity,product.productId,wareHouse.wareId,remark from product_instock_bill";
		Query query = session.createSQLQuery(hql);
		query.executeUpdate();
		// String hql =
		// ("update WareHouseProduct a set a.quantity= a.quantity + (select b.quantity from ProductInstockBill b where b.wareHouse.wareId=a.wareHouse.wareId and b.product.productId=a.product.productId)");
		// Query query = sessionFactory.openSession().createQuery(hql); //
		// System.out.println(query);
		// query.executeUpdate();
		session.close();

	}

	@Override
	public void updateOnlyWareHouseProduct(WareHouseProduct wareHouseProduct) {
		Session session = getSessionFactory().openSession();
		// 更改数量
		String hql2 = ("update WareHouseProduct p set p.quantity=p.quantity-? where p.wareHouse.wareId=? and p.product.productId=? and p.flag=1");
		Query query = sessionFactory.openSession().createQuery(hql2)
				.setFirstResult(1).setMaxResults(1);
		HttpServletRequest request = ServletActionContext.getRequest();
		query.setParameter(0, Integer.parseInt(request
				.getParameter("wareHouseProduct.quantity")));
		query.setParameter(1, Integer.parseInt(request
				.getParameter("wareHouseProduct.wareHouse.wareId")));
		query.setParameter(2, Integer.parseInt(request
				.getParameter("wareHouseProduct.product.productId")));
		// 如何只更新一条数据?
		query.executeUpdate();

		// 更改审核状态

		String billId = request.getParameter("productOutstockBill.billId");
		System.out.println(billId);
		String hql = ("update ProductOutstockBill p set p.billState=2 where billId=?");
		Query query2 = sessionFactory.openSession().createQuery(hql);
		query2.setParameter(0, Integer.parseInt(billId));
		query2.executeUpdate();
		session.close();
	}

	@Override
	public void addWareHouseProduct(WareHouseProduct wareHouseProduct) {
		Session session = sessionFactory.openSession();
		session.save(wareHouseProduct);

		HttpServletRequest request = ServletActionContext.getRequest();
		String billId = request.getParameter("productInstockBill.billId");
		System.out.println(billId);
		String hql = ("update ProductInstockBill p set p.billState=2 where billId=?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, Integer.parseInt(billId));
		query.executeUpdate();
		session.close();
	}

	public void minusWareHouseProduct(WareHouseProduct wareHouseProduct) {
		Session session = sessionFactory.openSession();
		session.save(wareHouseProduct);

		HttpServletRequest request = ServletActionContext.getRequest();
		String billId = request.getParameter("productOutstockBill.billId");
		String auditAt = request.getParameter("productOutstockBill.auditAt");
		SimpleDateFormat dfDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date adate;
		try {
			adate = dfDateFormat.parse(auditAt);
			String hql = ("update ProductOutstockBill p set p.billState=1,p.auditAt=? where billId=?");
			Query query = sessionFactory.openSession().createQuery(hql);
			query.setParameter(0, adate);
			query.setParameter(1, Integer.parseInt(billId));
			query.executeUpdate();
			session.close();
		} catch (ParseException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void addToWareHouseProduct(WareHouseProduct wareHouseProduct) {
		Session session = sessionFactory.openSession();
		session.save(wareHouseProduct);
		session.close();
	}

	public List<WareHouseProduct> existWareHouseProduct(
			WareHouseProduct wareHouseProduct) {
		HttpServletRequest request = ServletActionContext.getRequest();
		String wareId = request.getParameter("wareId");
		String productId = request.getParameter("productId");
		Query query = sessionFactory.openSession().createQuery(
				"from WareHouseProduct where productId=? and wareId=?");
		query.setParameter(0, productId);
		query.setParameter(1, wareId);
		List<WareHouseProduct> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public List<WareHouseProduct> productOnlyWareHouseProduct(Integer wareId) {
		HttpServletRequest request = ServletActionContext.getRequest();
		/*
		 * Query query = sessionFactory .openSession() .createQuery(
		 * "SELECT DISTINCT w.product.productId from WareHouseProduct w where w.wareHouse.wareId=?"
		 * );
		 */
		Query query = sessionFactory
				.openSession()
				.createQuery(
						"SELECT p.productName,p.productId FROM Product p where p.productId in (SELECT DISTINCT w.product.productId from WareHouseProduct w where w.wareHouse.wareId=?)");
		query.setParameter(0, wareId);
		List<WareHouseProduct> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}

	@Override
	public List<WareHouseProduct> quantityHouseProducts(Integer wareId,
			Integer productId) {
		// 动态修改wareId
		/*
		 * String hql =
		 * "SELECT c.product.spec,c.product.productName,c.product.price,c.wareHouse.wareId,c.wareHouse.wareNo,sum(c.quantity) FROM WareHouseProduct c GROUP BY c.product.productId HAVING c.wareHouse.wareId=? and c.product.productId=?"
		 * ;
		 */
		String hql = "SELECT c.product.spec,c.product.productName,c.product.price,c.wareHouse.wareId,c.wareHouse.wareNo,sum(c.quantity) FROM WareHouseProduct c WHERE c.wareHouse.wareId=? and c.product.productId=? GROUP BY c.product.productId";
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, wareId);
		query.setParameter(1, productId);
		List<WareHouseProduct> list = query.list();
		sessionFactory.openSession().close();
		return list;
	}
}
