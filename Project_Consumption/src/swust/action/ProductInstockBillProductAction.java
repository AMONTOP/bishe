package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.Product;
import swust.model.ProductInstockBill;
import swust.model.ProductInstockBillProduct;
import swust.service.ProductInstockBillProductService;
import swust.service.ProductInstockBillService;
import swust.service.ProductService;


public class ProductInstockBillProductAction extends BaseAction {
	private ProductInstockBillProductService productInstockBillProductService;
	private ProductInstockBillService productInstockBillService;
	private ProductService productService;
	private List<ProductInstockBillProduct> listProductInstockBillProducts;
	private List<ProductInstockBill> listProductInstockBills;
	private List<Product> listProducts;
	private ProductInstockBillProduct productInstockBillProduct;
	private int id;
	
	
	public String show(){
		listProductInstockBillProducts=productInstockBillProductService.getAllProductInstockBillProducts();
		return "zhanshi";
	}
	public String delete(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String billMaterialId=reqeust.getParameter("billMaterialId");//字符串	
		productInstockBillProductService.delProductInstockBillProduct(Integer.parseInt(billMaterialId));
		return "find";
	}
	public String prepup(){
		System.out.println("prepup");
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String billMaterialId=reqeust.getParameter("billMaterialId");//字符串
		productInstockBillProduct= productInstockBillProductService.getProductInstockBillProduct(Integer.parseInt(billMaterialId));
		getRequest().put("listProductInstockBill",productInstockBillService.getAllProductInstockBills());
		getRequest().put("listProduct", productService.getAllProducts());
		return "prepup";
	}

	public String addPre(){
		getRequest().put("listProductInstockBill",productInstockBillService.getAllProductInstockBills());
		getRequest().put("listProduct", productService.getAllProducts());
		return "addPre";
	}
	//增加
	public String save(){
		productInstockBillProductService.addProductInstockBillProduct(productInstockBillProduct);
		return "find";
	}
		 
	//修改
	public String update(){
		productInstockBillProductService.updateProductInstockBillProduct(productInstockBillProduct);
		return "find";
	}
	public ProductInstockBillProductService getProductInstockBillProductService() {
		return productInstockBillProductService;
	}
	public void setProductInstockBillProductService(
			ProductInstockBillProductService productInstockBillProductService) {
		this.productInstockBillProductService = productInstockBillProductService;
	}
	public ProductInstockBillService getProductInstockBillService() {
		return productInstockBillService;
	}
	public void setProductInstockBillService(
			ProductInstockBillService productInstockBillService) {
		this.productInstockBillService = productInstockBillService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public List<ProductInstockBillProduct> getListProductInstockBillProducts() {
		return listProductInstockBillProducts;
	}
	public void setListProductInstockBillProducts(
			List<ProductInstockBillProduct> listProductInstockBillProducts) {
		this.listProductInstockBillProducts = listProductInstockBillProducts;
	}
	public List<ProductInstockBill> getListProductInstockBills() {
		return listProductInstockBills;
	}
	public void setListProductInstockBills(
			List<ProductInstockBill> listProductInstockBills) {
		this.listProductInstockBills = listProductInstockBills;
	}
	
	public List<Product> getListProducts() {
		return listProducts;
	}
	public void setListProducts(List<Product> listProducts) {
		this.listProducts = listProducts;
	}
	public ProductInstockBillProduct getProductInstockBillProduct() {
		return productInstockBillProduct;
	}
	public void setProductInstockBillProduct(
			ProductInstockBillProduct productInstockBillProduct) {
		this.productInstockBillProduct = productInstockBillProduct;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
