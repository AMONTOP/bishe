package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.Product;
import swust.model.ProductOutstockBill;
import swust.model.ProductOutstockBillProduct;
import swust.service.ProductOutstockBillProductService;
import swust.service.ProductOutstockBillService;
import swust.service.ProductService;


public class ProductOutstockBillProductAction extends BaseAction {
	private ProductOutstockBillProductService productOutstockBillProductService;
	private ProductOutstockBillService productOutstockBillService;
	private ProductService productService;
	private List<ProductOutstockBillProduct> listProductOutstockBillProducts;
	private List<ProductOutstockBill> listProductOutstockBills;
	private List<Product> listProducts;
	private ProductOutstockBillProduct productOutstockBillProduct;
	private int id;
	
	
	public String show(){
		listProductOutstockBillProducts=productOutstockBillProductService.getAllProductOutstockBillProducts();
		return "zhanshi";
	}
	public String delete(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String billMaterialId=reqeust.getParameter("billMaterialId");//字符串	
		productOutstockBillProductService.delProductOutstockBillProduct(Integer.parseInt(billMaterialId));
		return "find";
	}
	public String prepup(){
		System.out.println("prepup");
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String billMaterialId=reqeust.getParameter("billMaterialId");//字符串
		productOutstockBillProduct= productOutstockBillProductService.getProductOutstockBillProduct(Integer.parseInt(billMaterialId));
		getRequest().put("listProductOutstockBill",productOutstockBillService.getAllProductOutstockBills());
		getRequest().put("listProduct", productService.getAllProducts());
		return "prepup";
	}

	public String addPre(){
		getRequest().put("listProductOutstockBill",productOutstockBillService.getAllProductOutstockBills());
		getRequest().put("listProduct", productService.getAllProducts());
		return "addPre";
	}
	//增加
	public String save(){
		productOutstockBillProductService.addProductOutstockBillProduct(productOutstockBillProduct);
		return "find";
	}
		 
	//修改
	public String update(){
		productOutstockBillProductService.updateProductOutstockBillProduct(productOutstockBillProduct);
		return "find";
	}
	public ProductOutstockBillProductService getProductOutstockBillProductService() {
		return productOutstockBillProductService;
	}
	public void setProductOutstockBillProductService(
			ProductOutstockBillProductService productOutstockBillProductService) {
		this.productOutstockBillProductService = productOutstockBillProductService;
	}
	public ProductOutstockBillService getProductOutstockBillService() {
		return productOutstockBillService;
	}
	public void setProductOutstockBillService(
			ProductOutstockBillService productOutstockBillService) {
		this.productOutstockBillService = productOutstockBillService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public List<ProductOutstockBillProduct> getListProductOutstockBillProducts() {
		return listProductOutstockBillProducts;
	}
	public void setListProductOutstockBillProducts(
			List<ProductOutstockBillProduct> listProductOutstockBillProducts) {
		this.listProductOutstockBillProducts = listProductOutstockBillProducts;
	}
	public List<ProductOutstockBill> getListProductOutstockBills() {
		return listProductOutstockBills;
	}
	public void setListProductOutstockBills(
			List<ProductOutstockBill> listProductOutstockBills) {
		this.listProductOutstockBills = listProductOutstockBills;
	}
	
	public List<Product> getListProducts() {
		return listProducts;
	}
	public void setListProducts(List<Product> listProducts) {
		this.listProducts = listProducts;
	}
	public ProductOutstockBillProduct getProductOutstockBillProduct() {
		return productOutstockBillProduct;
	}
	public void setProductOutstockBillProduct(
			ProductOutstockBillProduct productOutstockBillProduct) {
		this.productOutstockBillProduct = productOutstockBillProduct;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
