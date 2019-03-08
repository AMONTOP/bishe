package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.WareHouse;
import swust.model.WareHouseProduct;
import swust.service.EmployeeService;
import swust.service.ProductService;
import swust.service.WareHouseProductService;
import swust.service.WareHouseService;

public class WareHouseAction extends BaseAction {
	private WareHouseService wareHouseService;
	private WareHouseProductService wareHouseProductService;
	private ProductService productService;
	private EmployeeService employeeService;
	private List<WareHouse> list;
	private List<WareHouseProduct> list2;
	private WareHouse wareHouse;
	private int id;
	private String wareNo;

	public String show() {
		list = wareHouseService.getAllWareHouses();
		list2 = wareHouseProductService.getWareHouseProductByWare(1);
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String wareId = reqeust.getParameter("wareId");// 字符串
		wareHouseService.delWareHouse(Integer.parseInt(wareId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String wareId = reqeust.getParameter("wareId");// 字符串
		wareHouse = wareHouseService.getWareHouse(Integer.parseInt(wareId));
		getRequest().put("listEmployee", employeeService.getAllEmployees());
		return "prepup";
	}

	public String addPre() {
		getRequest().put("listProduct", productService.getAllProducts());
		getRequest().put("listEmployee", employeeService.getAllEmployees());
		return "addPre";
	}

	public String findbyName() {
		// list =
		// wareHouseService.getWareHouseByName(wareHouse.getWareHouseName());
		return "zhanshi";
	}

	// 增加
	public String save() {
		wareHouseService.addWareHouse(wareHouse);
		return "find";
	}

	// 修改
	public String update() {
		System.out.println("aaa");
		wareHouseService.updateWareHouse(wareHouse);
		return "find";
	}

	public WareHouseService getWareHouseService() {
		return wareHouseService;
	}

	public void setWareHouseService(WareHouseService wareHouseService) {
		this.wareHouseService = wareHouseService;
	}

	public List<WareHouse> getList() {
		return list;
	}

	public void setList(List<WareHouse> list) {
		this.list = list;
	}

	public WareHouse getWareHouse() {
		return wareHouse;
	}

	public void setWareHouse(WareHouse wareHouse) {
		this.wareHouse = wareHouse;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWareHouseName() {
		return wareNo;
	}

	public void setWareHouseName(String wareNo) {
		this.wareNo = wareNo;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public String getWareNo() {
		return wareNo;
	}

	public void setWareNo(String wareNo) {
		this.wareNo = wareNo;
	}

	public WareHouseProductService getWareHouseProductService() {
		return wareHouseProductService;
	}

	public void setWareHouseProductService(
			WareHouseProductService wareHouseProductService) {
		this.wareHouseProductService = wareHouseProductService;
	}

	public List<WareHouseProduct> getList2() {
		return list2;
	}

	public void setList2(List<WareHouseProduct> list2) {
		this.list2 = list2;
	}

}
