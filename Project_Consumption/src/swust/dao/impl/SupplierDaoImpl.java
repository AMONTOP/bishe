package swust.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import swust.dao.SupplierDao;
import swust.model.Supplier;

public class SupplierDaoImpl extends BaseDao implements SupplierDao {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Supplier> getAllSuppliers() {
		Query query = sessionFactory.openSession().createQuery("from Supplier");
        List<Supplier> list = query.list();
        return list;
	}

	@Override
	public void addSupplier(Supplier supplier) {
		Session session = sessionFactory.openSession();
		session.save(supplier);
		session.close();
	}

	@Override
	public void delSupplier(Integer id) {
		sessionFactory.openSession().createQuery("delete Supplier c where c.supplierId="+id).executeUpdate();
	}

	@Override
	public void updateSupplier(Supplier supplier) {
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String supplierId=reqeust.getParameter("supplierId");//字符串	
		Session session = getSessionFactory().openSession();
		System.out.println(supplier.getSupplierName());
        String hql = ("update Supplier c set c.supplierName = ?,c.contact = ?,c.contactPhone = ?,c.region=?,c.address=? where c.supplierId = ?");  
        Query query = sessionFactory.openSession().createQuery(hql);
//        System.out.println(supplierId);
        query.setParameter(0, supplier.getSupplierName());
        query.setParameter(1, supplier.getContact());
        query.setParameter(2, supplier.getContactPhone());
        query.setParameter(3, supplier.getRegion());
        query.setParameter(4, supplier.getAddress());
        query.setParameter(5, supplier.getSupplierId());
        query.executeUpdate();  
        session.close();
	}

	@Override
	public Supplier getSupplier(Integer id) {
		return (Supplier) sessionFactory.openSession().createQuery("from Supplier c where c.supplierId ="+id).uniqueResult();
	}

	@Override
	public List<Supplier> getSupplierByName(String supplierName) {
		return  (List<Supplier>) sessionFactory.openSession().createQuery("from Supplier c where c.supplierName like"+ "'%" + supplierName + "%'").list();
	}
	
	

}
