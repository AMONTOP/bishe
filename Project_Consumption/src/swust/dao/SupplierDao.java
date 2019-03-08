package swust.dao;

import java.util.List;

import swust.model.Supplier;

public interface SupplierDao {
    //查询所有
    public List<Supplier> getAllSuppliers();
    //添加用户
    public void addSupplier(Supplier supplier);
    //删除用户
    public void delSupplier(Integer id);
    //修改用户
    public void updateSupplier(Supplier supplier);
    //单个查询
    public Supplier getSupplier(Integer id) ;
    //单个查询(根据客户姓名模糊)
    public List<Supplier> getSupplierByName(String supplierName) ;
}
