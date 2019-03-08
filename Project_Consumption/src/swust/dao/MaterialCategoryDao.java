package swust.dao;

import java.util.List;

import swust.model.MaterialCategory;

public interface MaterialCategoryDao {
	//查询所有
    public List<MaterialCategory> getAllMaterialCategorys();
    //添加用户
    public void addMaterialCategory(MaterialCategory materialCategory);
    //删除用户
    public void delMaterialCategory(Integer id);
    //修改用户
    public void updateMaterialCategory(MaterialCategory materialCategory);
    //单个查询
    public MaterialCategory getMaterialCategory(Integer id) ;
    //单个查询(根据客户姓名模糊)
    public List<MaterialCategory> getMaterialCategoryByName(String categoryName) ;
}
