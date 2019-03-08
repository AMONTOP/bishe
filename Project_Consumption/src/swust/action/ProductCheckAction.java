package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.Product;
import swust.model.ProductCheck;
import swust.service.ProductCheckService;
import swust.service.ProductService;

public class ProductCheckAction extends BaseAction {
	private ProductCheckService productCheckService;
	private ProductService productService;
	private List<ProductCheck> list;
	private List<Product> listProducts;
	private ProductCheck productCheck;
	private int id;
	private String productName;

	public String show() {
		list = productCheckService.getAllProductChecks();
		// listCategory = ProductCategoryService.getAllProductCategorys();
		// getRequest().put("listCategory",ProductCategoryService.getAllProductCategorys());
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String productCheckId = reqeust.getParameter("productCheckId");// 字符串
		productCheckService.delProductCheck(Integer.parseInt(productCheckId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String productCheckId = reqeust.getParameter("productCheckId");// 字符串
		productCheck = productCheckService.getProductCheck(Integer
				.parseInt(productCheckId));
		getRequest().put("listProduct", productService.getAllProducts());
		return "prepup";
	}

	public String showList() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String pState = reqeust.getParameter("id");// 字符串
		list = productCheckService.getProductCheckByState(Integer
				.parseInt(pState));
		return "zhanshi";
	}

	public String findbyBillId() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");
		System.out.println(billId);
		list = productCheckService.getProductCheckByBillId(Integer
				.parseInt(billId));
		return "insert";
	}

	public String addPre() {
		getRequest().put("listProduct", productService.getAllProducts());
		return "addPre";
	}

	// 增加
	public String save() {
		productCheckService.addProductCheck(productCheck);
		return "find";
	}

	// 修改
	public String update() {
		productCheckService.updateProductCheck(productCheck);
		return "find";
	}

	public ProductCheckService getProductCheckService() {
		return productCheckService;
	}

	public void setProductCheckService(ProductCheckService productCheckService) {
		this.productCheckService = productCheckService;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public List<ProductCheck> getList() {
		return list;
	}

	public void setList(List<ProductCheck> list) {
		this.list = list;
	}

	public List<Product> getListProducts() {
		return listProducts;
	}

	public void setLisProducts(List<Product> listProducts) {
		this.listProducts = listProducts;
	}

	public ProductCheck getProductCheck() {
		return productCheck;
	}

	public void setProductCheck(ProductCheck productCheck) {
		this.productCheck = productCheck;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

}
