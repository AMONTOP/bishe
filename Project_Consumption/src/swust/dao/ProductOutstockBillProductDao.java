package swust.dao;

import java.util.List;

import swust.model.ProductOutstockBillProduct;


public interface ProductOutstockBillProductDao {
	//查询所有
    public List<ProductOutstockBillProduct> getAllProductOutstockBillProducts();
    //添加用户
    public void addProductOutstockBillProduct(ProductOutstockBillProduct productOutstockBillProduct);
    //删除用户
    public void delProductOutstockBillProduct(Integer id);
    //修改用户
    public void updateProductOutstockBillProduct(ProductOutstockBillProduct productOutstockBillProduct);
    //单个查询
    public ProductOutstockBillProduct getProductOutstockBillProduct(Integer id) ;
}
