package swust.dao;

import java.util.List;

import swust.model.SupplierMaterial;


public interface SupplierMaterialDao {
	//查询所有
    public List<SupplierMaterial> getAllSupplierMaterials();
    //添加用户
    public void addSupplierMaterial(SupplierMaterial supplierMaterial);
    //删除用户
    public void delSupplierMaterial(Integer id);
    //修改用户
    public void updateSupplierMaterial(SupplierMaterial supplierMaterial);
    //单个查询
    public SupplierMaterial getSupplierMaterial(Integer id) ;
    //根据是否库存不足查询
    public List<SupplierMaterial> getSupplierMaterialByRemark();
    //根据物料名称查询
    public List<SupplierMaterial> getSupplierMaterialByMaterials(String materialName);
}
