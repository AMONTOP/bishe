package swust.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.ProductInstockBillDao;
import swust.model.Employee;
import swust.model.Product;
import swust.model.ProductCheck;
import swust.model.ProductInstockBill;
import swust.service.EmployeeService;
import swust.service.ProductService;

public class ProductInstockBillDaoImpl extends BaseDao implements
		ProductInstockBillDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public ProductService productService;
	public EmployeeService employeeService;

	@Override
	public List<ProductInstockBill> getAllProductInstockBills() {
		Query query = sessionFactory.openSession().createQuery(
				"from ProductInstockBill");
		List<ProductInstockBill> list = query.list();
		return list;
	}

	@Override
	public void addProductInstockBill(ProductInstockBill productInstockBill) {
		Session session = sessionFactory.openSession();
		session.save(productInstockBill);
		session.close();
	}

	@Override
	public void delProductInstockBill(Integer id) {
		sessionFactory
				.openSession()
				.createQuery("delete ProductInstockBill c where c.billId=" + id)
				.executeUpdate();
	}

	@Override
	public void updateProductInstockBill(ProductInstockBill productInstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = ("update ProductInstockBill c set c.billNo = ?,c.employee.empId = ?,c.wareHouse.wareId = ?,c.productSource = ?,c.billState = ?,c.auditAt=?,c.auditBy=? where c.billId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, productInstockBill.getBillNo());
		query.setParameter(1, productInstockBill.getEmployee().getEmpId());
		query.setParameter(2, productInstockBill.getWareHouse().getWareId());
		query.setParameter(3, productInstockBill.getProductSource());
		query.setParameter(4, productInstockBill.getBillState());
		query.setParameter(5, productInstockBill.getAuditAt());
		query.setParameter(6, productInstockBill.getAuditBy());
		query.setParameter(7, productInstockBill.getBillId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public void updateProductInstockBillProduct(
			ProductInstockBill productInstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = ("update ProductInstockBill c set c.product.productId=?,c.quantity=? where c.billId = ?");
		Query query = sessionFactory.openSession().createQuery(hql);
		query.setParameter(0, productInstockBill.getProduct().getProductId());
		query.setParameter(1, productInstockBill.getQuantity());
		query.setParameter(2, productInstockBill.getBillId());
		query.executeUpdate();
		session.close();
	}

	@Override
	public void addToupdateProductInstockBill(
			ProductInstockBill productInstockBill) {
		Session session = getSessionFactory().openSession();
		String hql = "insert into ProductInstockBill (quantity,remark,productId,wareId) values (20,'入库',1,1)";
		Query query = sessionFactory.openSession().createQuery(hql);
		query.executeUpdate();
		session.close();
	}

	@Override
	public ProductInstockBill getProductInstockBill(Integer id) {
		return (ProductInstockBill) sessionFactory.openSession()
				.createQuery("from ProductInstockBill c where c.billId =" + id)
				.uniqueResult();
	}

	@Override
	public List<ProductInstockBill> getProductInstockBillByBillState(Integer id) {
		List<ProductInstockBill> lists = (List<ProductInstockBill>) sessionFactory
				.openSession()
				.createQuery(
						"from ProductInstockBill b where b.billState =" + id)
				.list();
		sessionFactory.openSession().close();
		return lists;
	}

	@Override
	public List<ProductInstockBill> getBillNoByOnly() {
		Query query = sessionFactory.openSession().createQuery(
				"from ProductInstockBill GROUP BY billNo");
		List<ProductInstockBill> list = query.list();
		return list;
	}

	@Override
	public List<ProductInstockBill> getSimpleByBillNo(String billNo) {
		List<ProductInstockBill> lists = (List<ProductInstockBill>) sessionFactory
				.openSession()
				.createQuery(
						"from ProductInstockBill b where b.billNo ='" + billNo
								+ "'").list();
		sessionFactory.openSession().close();
		return lists;
	}

	@Override
	public List<Product> getProductDistinct(String billNo) {
		List<Product> lists = (List<Product>) sessionFactory
				.openSession()
				.createQuery(
						"FROM Product p WHERE NOT  EXISTS  ( SELECT 1 FROM ProductInstockBill b WHERE  p.productId = b.product.productId and b.billNo='"
								+ billNo + "')").list();
		return lists;
	}

	@Override
	public void addToProductCheck(ProductInstockBill productInstockBill) {
		Session session = getSessionFactory().openSession();
		ProductCheck productCheck = new ProductCheck();
		int productId = productInstockBill.getProduct().getProductId();
		int empId = productInstockBill.getEmployee().getEmpId();
		int billState = productInstockBill.getBillState();
		int billId = productInstockBill.getBillId();

		Product product = new Product();
		product.setProductId(productId);
		Employee employee = new Employee();
		employee.setEmpId(empId);
		ProductInstockBill proInstockBill = new ProductInstockBill();
		proInstockBill.setBillId(billId);

		productCheck.setProduct(product);
		productCheck.setEmployee(employee);
		productCheck.setProductInstockBill(proInstockBill);

		boolean state = (billState == 1) ? true : false;
		productCheck.setCheckState(state);

		session.save(productCheck);
		session.close();
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

}
