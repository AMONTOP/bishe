package swust.service;

import java.util.List;

import swust.model.ProductCategory;


public interface ProductCategoryService {
	//查询所有
    public List<ProductCategory> getAllProductCategorys();
    //添加用户
    public void addProductCategory(ProductCategory productCategory);
    //删除用户
    public void delProductCategory(Integer id);
    //修改用户
    public void updateProductCategory(ProductCategory productCategory);
    //单个查询
    public ProductCategory getProductCategory(Integer id) ;
    //单个查询(根据客户姓名模糊)
    public List<ProductCategory> getProductCategoryByName(String categoryName) ;
}
