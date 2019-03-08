package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.Material;
import swust.model.MaterialCategory;
import swust.service.MaterialCategoryService;
import swust.service.MaterialService;


public class MaterialAction extends BaseAction {
	private MaterialService materialService;
	private MaterialCategoryService materialCategoryService;
	private List<Material> list;
	private List<MaterialCategory> listCategory;
	private Material material;
	private int id;
	private String materialName;
	
	
	public String show(){
		list=materialService.getAllMaterials();
//		listCategory = MaterialCategoryService.getAllMaterialCategorys();
//		getRequest().put("listCategory",MaterialCategoryService.getAllMaterialCategorys());
		return "zhanshi";
	}
	public String delete(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String materialId=reqeust.getParameter("materialId");//字符串	
		materialService.delMaterial(Integer.parseInt(materialId));
		return "find";
	}
	public String prepup(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String materialId=reqeust.getParameter("materialId");//字符串	
		System.out.println(materialId);
		material= materialService.getMaterial(Integer.parseInt(materialId));
		getRequest().put("listCategory",materialCategoryService.getAllMaterialCategorys());
		return "prepup";
	}
	public String findbyName(){
		list=materialService.getMaterialByName(material.getMaterialName());
		return "zhanshi";
	}
	public String addPre(){
		getRequest().put("listCategory",materialCategoryService.getAllMaterialCategorys());
		return "addPre";
	}
	//增加
	public String save(){
		materialService.addMaterial(material);
		return "find";
	}
		 
	//修改
	public String update(){
		materialService.updateMaterial(material);
		return "find";
	}
	public MaterialService getMaterialService() {
		return materialService;
	}
	public void setMaterialService(MaterialService materialService) {
		this.materialService = materialService;
	}
	public MaterialCategoryService getMaterialCategoryService() {
		return materialCategoryService;
	}
	public void setMaterialCategoryService(
			MaterialCategoryService materialCategoryService) {
		this.materialCategoryService = materialCategoryService;
	}
	public List<Material> getList() {
		return list;
	}
	public void setList(List<Material> list) {
		this.list = list;
	}
	public List<MaterialCategory> getListCategory() {
		return listCategory;
	}
	public void setListCategory(List<MaterialCategory> listCategory) {
		this.listCategory = listCategory;
	}
	public Material getMaterial() {
		return material;
	}
	public void setMaterial(Material material) {
		this.material = material;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	
}
