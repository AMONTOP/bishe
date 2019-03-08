package swust.action;

import java.io.File;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import swust.model.Employee;
import swust.model.Product;
import swust.model.ProductInstockBill;
import swust.model.WareHouse;
import swust.service.EmployeeService;
import swust.service.ProductInstockBillService;
import swust.service.ProductService;
import swust.service.WareHouseService;

public class ProductInstockBillAction extends BaseAction {
	private ProductInstockBillService productInstockBillService;
	private EmployeeService employeeService;
	private WareHouseService wareHouseService;
	private ProductService productService;
	private List<ProductInstockBill> list;
	private List<Employee> listEmployees;
	private List<WareHouse> listWareHouses;
	private List<Product> listProducts;
	private ProductInstockBill productInstockBill;
	private int id;
	private String result;

	private String[] selectedRow;
	private File billproductExcel;
	private String billproductExcelContentType;
	private String billproductExcelFileName;

	public String test2() {
		productInstockBillService.addToProductCheck(productInstockBill);
		list = productInstockBillService.getAllProductInstockBills();
		JSONArray json = JSONArray.fromObject(list);
		result = json.toString();
		return "saveNewjson";
		/*return "find4";*/
	}

	public String show() {
		list = productInstockBillService.getAllProductInstockBills();
		return "zhanshi";
	}

	public String show3() {
		list = productInstockBillService.getAllProductInstockBills();
		return "zhanshi2";
	}

	public String show2() {
		list = productInstockBillService.getBillNoByOnly();
		return "zhanshi";
	}

	public String showmore() {
		list = productInstockBillService.getAllProductInstockBills();
		return "showmore";
	}

	public String showBybillNo() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		System.out.println(billNo.trim());
		list = productInstockBillService.getSimpleByBillNo(billNo.trim());
		System.out.println(list);
		return "showbill";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		productInstockBillService.delProductInstockBill(Integer
				.parseInt(billId));
		return "find3";
	}

	public String delete2() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		productInstockBillService.delProductInstockBill(Integer
				.parseInt(billId));
		return "find2";
	}

	public String prepup() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String billId = request.getParameter("billId");// 字符串
		getRequest().put("listEmployees", employeeService.getAllEmployees());
		getRequest().put("listWareHouses", wareHouseService.getAllWareHouses());
		productInstockBill = productInstockBillService
				.getProductInstockBill(Integer.parseInt(billId));
		return "prepup";
	}

	public String insert() {
		/*HttpServletRequest request = ServletActionContext.getRequest();
		String billId = request.getParameter("billId");// 字符串
		productInstockBill = productInstockBillService
				.getProductInstockBill(Integer.parseInt(billId));*/
		HttpServletRequest request = ServletActionContext.getRequest();
		String billNo = request.getParameter("billNo");
		list = productInstockBillService.getSimpleByBillNo(billNo);
		return "insert";
	}

	public String prepup2() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		getRequest().put("listProducts", productService.getAllProducts());
		productInstockBill = productInstockBillService
				.getProductInstockBill(Integer.parseInt(billId));
		return "prepup2";
	}

	public String addPre() {
		getRequest().put("listProductInstockBills",
				productInstockBillService.getAllProductInstockBills());
		getRequest().put("listEmployees", employeeService.getAllEmployees());
		getRequest().put("listWareHouses", wareHouseService.getAllWareHouses());
		getRequest().put("listProducts", productService.getAllProducts());
		return "addPre";
	}

	public String addPre2() {
		getRequest().put("listProductInstockBills",
				productInstockBillService.getBillNoByOnly());
		getRequest().put("listEmployees", employeeService.getAllEmployees());
		getRequest().put("listWareHouses", wareHouseService.getAllWareHouses());
		getRequest().put("listProducts", productService.getAllProducts());
		return "addPre2";
	}

	// 增加
	public String save2() {
		productInstockBillService.addProductInstockBill(productInstockBill);
		return "find2";
	}

	// 增加
	public String save() {
		productInstockBillService.addProductInstockBill(productInstockBill);
		return "find3";
	}

	// 修改
	public String update() {
		productInstockBillService.updateProductInstockBill(productInstockBill);
		return "find3";
	}

	// 修改
	public String update2() {
		productInstockBillService
				.updateProductInstockBillProduct(productInstockBill);
		return "find2";
	}

	public String showList() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billState = reqeust.getParameter("id");// 字符串
		list = productInstockBillService
				.getProductInstockBillByBillState(Integer.parseInt(billState));
		return "zhanshi";
	}

	public String test() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		listProducts = productInstockBillService.getProductDistinct(billNo);
		JSONArray json = JSONArray.fromObject(listProducts);
		// System.out.println(json);
		result = json.toString();
		// System.out.println(result);
		return "test";
	}

	public String listAll() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		list = productInstockBillService.getSimpleByBillNo(billNo);
		JSONArray json = JSONArray.fromObject(list);
		result = json.toString();
		return "list";
	}

	public String addToupdate() {
		productInstockBillService
				.addToupdateProductInstockBill(productInstockBill);
		return "find2";
	}

	// 导出excel
	public void export2Excel() {
		try {
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			HSSFRow row_title = sheet.createRow(0);
			HSSFCell cell_title1 = row_title.createCell(0);
			HSSFCell cell_title2 = row_title.createCell(1);
			HSSFCell cell_title3 = row_title.createCell(2);
			HSSFCell cell_title4 = row_title.createCell(3);
			HSSFCell cell_title5 = row_title.createCell(4);
			HSSFCell cell_title6 = row_title.createCell(5);
			HSSFCell cell_title7 = row_title.createCell(6);
			HSSFCell cell_title8 = row_title.createCell(7);
			cell_title1.setCellValue("货品入库单编号");
			cell_title2.setCellValue("领货人");
			cell_title3.setCellValue("入库仓库");
			cell_title4.setCellValue("创建时间");
			cell_title5.setCellValue("货品去向");
			cell_title6.setCellValue("货品入库状态");
			cell_title7.setCellValue("货品");
			cell_title8.setCellValue("货品数量");

			// List<Product> products = productService.getAllProducts();
			for (int i = 0; i < selectedRow.length; i++) {
				// int a = selectedRow[
				/*
				 * Product product = productService.getProduct(Integer
				 * .parseInt(selectedRow[i]));
				 */
				ProductInstockBill productInstockBill = productInstockBillService
						.getProductInstockBill(Integer.parseInt(selectedRow[i]));
				HSSFRow row = sheet.createRow(i + 1);
				HSSFCell cell1 = row.createCell(0);
				HSSFCell cell2 = row.createCell(1);
				HSSFCell cell3 = row.createCell(2);
				HSSFCell cell4 = row.createCell(3);
				HSSFCell cell5 = row.createCell(4);
				HSSFCell cell6 = row.createCell(5);
				HSSFCell cell7 = row.createCell(6);
				HSSFCell cell8 = row.createCell(7);
				cell1.setCellValue(productInstockBill.getBillNo());
				cell2.setCellValue(productInstockBill.getEmployee().getName());
				cell3.setCellValue(productInstockBill.getWareHouse()
						.getWareNo());
				cell4.setCellValue(productInstockBill.getBillTime());
				if (productInstockBill.getProductSource() == 1) {
					String productSource = "生产入库";
					cell5.setCellValue(productSource);
				} else if (productInstockBill.getProductSource() == 2) {
					String productSource = "其他仓库入库";
					cell5.setCellValue(productSource);
				}
				if (productInstockBill.getBillState() == 1) {
					String billStateString = "待审核";
					cell6.setCellValue(billStateString);
				} else if (productInstockBill.getBillState() == 2) {
					String billStateString = "已审核";
					cell6.setCellValue(billStateString);
				}

				cell7.setCellValue(productInstockBill.getProduct()
						.getProductName());
				cell8.setCellValue(productInstockBill.getQuantity());
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			// 把响应头数据类型设置为任意二进制流，用于上传下载
			response.setContentType("application/octet-stream");
			// 告诉浏览器通过下载方式打开，并设置下载文件名
			response.setHeader("Content-Disposition", "attachment;fileName="//
					+ new String("货品入库单信息.xls".getBytes(), "ISO8859-1"));
			ServletOutputStream sos = response.getOutputStream();
			workbook.write(sos);
			if (sos != null) {
				sos.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 导入用户列表
	public String importExcel() {
		// 1、获取excel文件

		if (billproductExcel != null) {
			// 是否是excel ^开始 .+任意字符串 $结束 ?i 忽略大小写 xls | xlsx 后缀名 \\.表示最后.
			if (billproductExcelFileName.matches("^.+\\.(?i)((xls)|(xlsx))$")) {
				// 2、导入
				productInstockBillService.importExcel(billproductExcel,
						billproductExcelFileName);
			}
		}
		return "find";
	}

	public ProductInstockBillService getProductInstockBillService() {
		return productInstockBillService;
	}

	public void setProductInstockBillService(
			ProductInstockBillService productInstockBillService) {
		this.productInstockBillService = productInstockBillService;
	}

	public List<ProductInstockBill> getList() {
		return list;
	}

	public void setList(List<ProductInstockBill> list) {
		this.list = list;
	}

	public ProductInstockBill getProductInstockBill() {
		return productInstockBill;
	}

	public void setProductInstockBill(ProductInstockBill productInstockBill) {
		this.productInstockBill = productInstockBill;
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

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
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

}
