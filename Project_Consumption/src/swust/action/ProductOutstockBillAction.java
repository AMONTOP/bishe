package swust.action;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import swust.model.Employee;
import swust.model.Product;
import swust.model.ProductOutstockBill;
import swust.model.WareHouse;
import swust.model.WareHouseProduct;
import swust.service.EmployeeService;
import swust.service.ProductOutstockBillService;
import swust.service.ProductService;
import swust.service.WareHouseProductService;
import swust.service.WareHouseService;

public class ProductOutstockBillAction extends BaseAction {
	private ProductOutstockBillService productOutstockBillService;
	private EmployeeService employeeService;
	private WareHouseService wareHouseService;
	private WareHouseProductService wareHouseProductService;
	private ProductService productService;
	private List<ProductOutstockBill> list;
	private List<Employee> listEmployees;
	private List<WareHouse> listWareHouses;
	private List<Product> listProducts;
	private List<WareHouseProduct> listWareHouseProducts;
	private ProductOutstockBill productOutstockBill;
	private int id;
	private String result;
	private String resultChange;

	private String[] selectedRow;
	private File billproductExcel;
	private String billproductExcelContentType;
	private String billproductExcelFileName;

	public String show() {
		list = productOutstockBillService.getAllProductOutstockBills();
		return "zhanshi";
	}

	public String show3() {
		list = productOutstockBillService.getAllProductOutstockBills();
		return "zhanshi2";
	}

	public String show2() {
		list = productOutstockBillService.getBillNoByOnly();
		return "zhanshi";
	}

	public String showmore() {
		list = productOutstockBillService.getAllProductOutstockBills();
		return "showmore";
	}

	public String showBybillNo() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		System.out.println(billNo.trim());
		list = productOutstockBillService.getSimpleByBillNo(billNo.trim());
		System.out.println(list);
		return "showbill";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		productOutstockBillService.delProductOutstockBill(Integer
				.parseInt(billId));
		return "find";
	}

	public String delete2() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		productOutstockBillService.delProductOutstockBill(Integer
				.parseInt(billId));
		return "find2";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		productOutstockBill = productOutstockBillService
				.getProductOutstockBill(Integer.parseInt(billId));
		return "prepup";
	}

	public String oneAlert() {
		/*HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		productOutstockBill = productOutstockBillService
				.getProductOutstockBill(Integer.parseInt(billId));*/
		HttpServletRequest request = ServletActionContext.getRequest();
		String billNo = request.getParameter("billNo");
		list = productOutstockBillService.getSimpleByBillNo(billNo);
		return "one";
	}

	public String prepup2() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		getRequest().put("listProducts", productService.getAllProducts());
		productOutstockBill = productOutstockBillService
				.getProductOutstockBill(Integer.parseInt(billId));
		return "prepup2";
	}

	public String addPre() {
		getRequest().put("listProductOutstockBills",
				productOutstockBillService.getAllProductOutstockBills());
		getRequest().put("listEmployees", employeeService.getAllEmployees());
		getRequest().put("listWareHouses", wareHouseService.getAllWareHouses());
		getRequest().put("listProducts", productService.getAllProducts());
		/*
		 * getRequest().put("listProducts",
		 * wareHouseProductService.productOnlyWareHouseProduct());
		 */
		return "addPre";
	}

	public String addPre2() {
		getRequest().put("listProductOutstockBills",
				productOutstockBillService.getBillNoByOnly());
		getRequest().put("listEmployees", employeeService.getAllEmployees());
		getRequest().put("listWareHouses", wareHouseService.getAllWareHouses());
		getRequest().put("listProducts", productService.getAllProducts());
		return "addPre2";
	}

	// 增加
	public String save2() {
		productOutstockBillService.addProductOutstockBill(productOutstockBill);
		return "find2";
	}

	// 增加
	public String save() {
		productOutstockBillService.addProductOutstockBill(productOutstockBill);
		return "find";
	}

	// 修改
	public String update() {
		productOutstockBillService
				.updateProductOutstockBill(productOutstockBill);
		return "find";
	}

	public String showList() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billState = reqeust.getParameter("id");// 字符串
		list = productOutstockBillService
				.getProductOutstockBillByBillState(Integer.parseInt(billState));
		return "zhanshi";
	}

	public ProductOutstockBillService getProductOutstockBillService() {
		return productOutstockBillService;
	}

	public String test() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		listProducts = productOutstockBillService.getProductDistinct(billNo);
		JSONArray json = JSONArray.fromObject(listProducts);
		// System.out.println(json);
		result = json.toString();
		// System.out.println(result);
		return "test";
	}

	public String listAll() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		list = productOutstockBillService.getSimpleByBillNo(billNo);
		JSONArray json = JSONArray.fromObject(list);
		result = json.toString();
		return "list";
	}

	public void setProductOutstockBillService(
			ProductOutstockBillService productOutstockBillService) {
		this.productOutstockBillService = productOutstockBillService;
	}

	public List<ProductOutstockBill> getList() {
		return list;
	}

	public void setList(List<ProductOutstockBill> list) {
		this.list = list;
	}

	public ProductOutstockBill getProductOutstockBill() {
		return productOutstockBill;
	}

	public void setProductOutstockBill(ProductOutstockBill productOutstockBill) {
		this.productOutstockBill = productOutstockBill;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public WareHouseService getWareHouseService() {
		return wareHouseService;
	}

	public void setWareHouseService(WareHouseService wareHouseService) {
		this.wareHouseService = wareHouseService;
	}

	public List<Employee> getListEmployees() {
		return listEmployees;
	}

	public void setListEmployees(List<Employee> listEmployees) {
		this.listEmployees = listEmployees;
	}

	public List<WareHouse> getListWareHouses() {
		return listWareHouses;
	}

	public void setListWareHouses(List<WareHouse> listWareHouses) {
		this.listWareHouses = listWareHouses;
	}

	public List<Product> getListProducts() {
		return listProducts;
	}

	public void setListProducts(List<Product> listProducts) {
		this.listProducts = listProducts;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String[] getSelectedRow() {
		return selectedRow;
	}

	public void setSelectedRow(String[] selectedRow) {
		this.selectedRow = selectedRow;
	}

	public File getBillproductExcel() {
		return billproductExcel;
	}

	public void setBillproductExcel(File billproductExcel) {
		this.billproductExcel = billproductExcel;
	}

	public String getBillproductExcelContentType() {
		return billproductExcelContentType;
	}

	public void setBillproductExcelContentType(
			String billproductExcelContentType) {
		this.billproductExcelContentType = billproductExcelContentType;
	}

	public String getBillproductExcelFileName() {
		return billproductExcelFileName;
	}

	public void setBillproductExcelFileName(String billproductExcelFileName) {
		this.billproductExcelFileName = billproductExcelFileName;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public WareHouseProductService getWareHouseProductService() {
		return wareHouseProductService;
	}

	public void setWareHouseProductService(
			WareHouseProductService wareHouseProductService) {
		this.wareHouseProductService = wareHouseProductService;
	}

	public List<WareHouseProduct> getListWareHouseProducts() {
		return listWareHouseProducts;
	}

	public void setListWareHouseProducts(
			List<WareHouseProduct> listWareHouseProducts) {
		this.listWareHouseProducts = listWareHouseProducts;
	}

	public String getResultChange() {
		return resultChange;
	}

	public void setResultChange(String resultChange) {
		this.resultChange = resultChange;
	}

}
