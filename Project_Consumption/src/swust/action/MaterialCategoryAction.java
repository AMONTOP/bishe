package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.service.MaterialCategoryService;
import swust.model.MaterialCategory;;

public class MaterialCategoryAction {
	private MaterialCategoryService materialCategoryService ;
	private List<MaterialCategory> list;
	private MaterialCategory materialCategory;
	private int id;
	private String categoryName;
	public String show(){
		list=materialCategoryService.getAllMaterialCategorys();
		return "zhanshi";
	}
	public String delete(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String categoryId=reqeust.getParameter("categoryId");//字符串	
		materialCategoryService.delMaterialCategory(Integer.parseInt(categoryId));
		return "find";
	}
	public String prepup(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String categoryId=reqeust.getParameter("categoryId");//字符串	
//		MaterialCategory=MaterialCategoryService.getMaterialCategory(Integer.parseInt(categoryId));
		materialCategory = materialCategoryService.getMaterialCategory(Integer.parseInt(categoryId));
		return "prepup";
	}
	public String findbyName(){
		list=materialCategoryService.getMaterialCategoryByName(materialCategory.getCategoryName());
		return "zhanshi";
	}
	//增加
	public String save(){
		materialCategoryService.addMaterialCategory(materialCategory);
		return "find";
	}
		 
	//修改
	public String update(){
		materialCategoryService.updateMaterialCategory(materialCategory);
		return "find";
	}
	public MaterialCategoryService getMaterialCategoryService() {
		return materialCategoryService;
	}
	public void setMaterialCategoryService(
			MaterialCategoryService materialCategoryService) {
		this.materialCategoryService = materialCategoryService;
	}
	public List<MaterialCategory> getList() {
		return list;
	}
	public void setList(List<MaterialCategory> list) {
		this.list = list;
	}
	public MaterialCategory getMaterialCategory() {
		return materialCategory;
	}
	public void setMaterialCategory(MaterialCategory materialCategory) {
		this.materialCategory = materialCategory;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
}
