package swust.dao;

import java.util.List;

import swust.model.DrawMaterialBillMaterial;


public interface DrawMaterialBillMaterialDao {
	//查询所有
    public List<DrawMaterialBillMaterial> getAllDrawMaterialBillMaterials();
    //添加用户
    public void addDrawMaterialBillMaterial(DrawMaterialBillMaterial drawMaterialBillMaterial);
    //删除用户
    public void delDrawMaterialBillMaterial(Integer id);
    //修改用户
    public void updateDrawMaterialBillMaterial(DrawMaterialBillMaterial drawMaterialBillMaterial);
    //单个查询
    public DrawMaterialBillMaterial getDrawMaterialBillMaterial(Integer id) ;
    
    public List<DrawMaterialBillMaterial> getByBillId(Integer id);
}
