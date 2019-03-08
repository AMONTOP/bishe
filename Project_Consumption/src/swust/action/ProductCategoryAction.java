package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.ProductCategory;
import swust.service.ProductCategoryService;


public class ProductCategoryAction {
	private ProductCategoryService productCategoryService;
	private List<ProductCategory> list;
	private ProductCategory productCategory;
	private int id;
	private String categoryName;
	public String show(){
		list=productCategoryService.getAllProductCategorys();
		return "zhanshi";
	}
	public String delete(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String categoryId=reqeust.getParameter("categoryId");//字符串	
		productCategoryService.delProductCategory(Integer.parseInt(categoryId));
		return "find";
	}
	public String prepup(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String categoryId=reqeust.getParameter("categoryId");//字符串	
//		productCategory=productCategoryService.getProductCategory(Integer.parseInt(categoryId));
		productCategory = productCategoryService.getProductCategory(Integer.parseInt(categoryId));
		return "prepup";
	}
	public String findbyName(){
		list=productCategoryService.getProductCategoryByName(productCategory.getCategoryName());
		return "zhanshi";
	}
	//增加
	public String save(){
		productCategoryService.addProductCategory(productCategory);
		return "find";
	}
		 
	//修改
	public String update(){
		productCategoryService.updateProductCategory(productCategory);
		return "find";
	}
	public ProductCategoryService getProductCategoryService() {
		return productCategoryService;
	}
	public void setProductCategoryService(
			ProductCategoryService productCategoryService) {
		this.productCategoryService = productCategoryService;
	}
	public List<ProductCategory> getList() {
		return list;
	}
	public void setList(List<ProductCategory> list) {
		this.list = list;
	}
	public ProductCategory getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
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
