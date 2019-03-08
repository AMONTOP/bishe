package swust.dao;

import java.util.List;

import swust.model.Material;

public interface MaterialDao {
	//查询所有
    public List<Material> getAllMaterials();
    //添加用户
    public void addMaterial(Material material);
    //删除用户
    public void delMaterial(Integer id);
    //修改用户
    public void updateMaterial(Material material);
    //单个查询
    public Material getMaterial(Integer id) ;
    //单个查询(根据客户姓名模糊)
    public List<Material> getMaterialByName(String materialName) ;
}
