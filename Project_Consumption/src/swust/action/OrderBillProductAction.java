package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.OrderBill;
import swust.model.OrderBillProduct;
import swust.model.Product;
import swust.service.OrderBillProductService;
import swust.service.OrderBillService;
import swust.service.ProductService;

public class OrderBillProductAction extends BaseAction {
	private OrderBillProductService orderBillProductService;
	private OrderBillService orderBillService;
	private ProductService productService;
	private List<OrderBill> listOrderBills;
	private List<Product> listProducts;
	private List<OrderBillProduct> listOrderBillProducts;
	private OrderBillProduct orderBillProduct;
	private int id;

	public String show() {
		listOrderBillProducts = orderBillProductService
				.getAllOrderBillProducts();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billProductId = reqeust.getParameter("billProductId");// 字符串
		orderBillProductService.delOrderBillProduct(Integer
				.parseInt(billProductId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billProductId = reqeust.getParameter("billProductId");// 字符串
		orderBillProduct = orderBillProductService.getOrderBillProduct(Integer
				.parseInt(billProductId));
		getRequest().put("listOrderBills", orderBillService.getAllOrderBills());
		getRequest().put("listProducts", productService.getAllProducts());
		return "prepup";
	}

	public String addPre() {
		getRequest().put("listOrderBills", orderBillService.getAllOrderBills());
		getRequest().put("listProducts", productService.getAllProducts());
		return "addPre";
	}

	// 增加
	public String save() {
		orderBillProductService.addOrderBillProduct(orderBillProduct);
		return "find";
	}

	// 修改
	public String update() {
		orderBillProductService.updateOrderBillProduct(orderBillProduct);
		return "find";
	}

	public String findByNo() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		System.out.println(billId);
		listOrderBillProducts = orderBillProductService
				.getOrderBillProductByNo(Integer.parseInt(billId));
		return "zhanshi";
	}

	public String findByProduct() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		System.out.println(billNo);
		listOrderBillProducts = orderBillProductService
				.getProductByProductName(billNo);
		return "zhanshi";
	}

	public OrderBillProductService getOrderBillProductService() {
		return orderBillProductService;
	}

	public void setOrderBillProductService(
			OrderBillProductService orderBillProductService) {
		this.orderBillProductService = orderBillProductService;
	}

	public OrderBillService getOrderBillService() {
		return orderBillService;
	}

	public void setOrderBillService(OrderBillService orderBillService) {
		this.orderBillService = orderBillService;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public List<OrderBill> getListOrderBills() {
		return listOrderBills;
	}

	public void setListOrderBills(List<OrderBill> listOrderBills) {
		this.listOrderBills = listOrderBills;
	}

	public List<Product> getListProducts() {
		return listProducts;
	}

	public void setListProducts(List<Product> listProducts) {
		this.listProducts = listProducts;
	}

	public List<OrderBillProduct> getListOrderBillProducts() {
		return listOrderBillProducts;
	}

	public void setListOrderBillProducts(
			List<OrderBillProduct> listOrderBillProducts) {
		this.listOrderBillProducts = listOrderBillProducts;
	}

	public OrderBillProduct getOrderBillProduct() {
		return orderBillProduct;
	}

	public void setOrderBillProduct(OrderBillProduct orderBillProduct) {
		this.orderBillProduct = orderBillProduct;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
