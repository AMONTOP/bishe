package swust.dao;

import java.util.List;

import swust.model.ProductInstockBillProduct;

public interface ProductInstockBillProductDao {
	//查询所有
    public List<ProductInstockBillProduct> getAllProductInstockBillProducts();
    //添加用户
    public void addProductInstockBillProduct(ProductInstockBillProduct productInstockBillProduct);
    //删除用户
    public void delProductInstockBillProduct(Integer id);
    //修改用户
    public void updateProductInstockBillProduct(ProductInstockBillProduct productInstockBillProduct);
    //单个查询
    public ProductInstockBillProduct getProductInstockBillProduct(Integer id);
}
