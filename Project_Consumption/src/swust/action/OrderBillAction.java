package swust.action;

import java.io.File;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import swust.model.Client;
import swust.model.Employee;
import swust.model.OrderBill;
import swust.model.OrderBillProduct;
import swust.service.ClientService;
import swust.service.EmployeeService;
import swust.service.OrderBillProductService;
import swust.service.OrderBillService;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.ValidationAware;

public class OrderBillAction extends BaseAction implements
		ModelDriven<OrderBill>, ValidationAware {
	private OrderBillService orderBillService;
	private OrderBillProductService orderBillProductService;
	private ClientService clientService;
	private EmployeeService employeeService;
	private List<OrderBill> list;
	private List<Client> listClient;
	private List<Employee> listEmployee;
	private List<OrderBillProduct> listOrderBillProducts;
	private OrderBill orderBill;
	private int id;
	private String billNo;
	private String[] selectedRow;
	private File productExcel;
	private String productExcelContentType;
	private String productExcelFileName;

	public OrderBill getModel() {
		orderBill = new OrderBill();
		return orderBill;
	}

	public String show() {
		list = orderBillService.getAllOrderBills();
		/*
		 * System.out.println(ActionContext.getContext().getSession()
		 * .get("myRole"));
		 */
		// listCategory = productCategoryService.getAllProductCategorys();
		// getRequest().put("listCategory",productCategoryService.getAllProductCategorys());
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		orderBillService.delOrderBill(Integer.parseInt(billId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		orderBill = orderBillService.getOrderBill(Integer.parseInt(billId));
		getRequest().put("listClient", clientService.getAllClients());
		getRequest().put("listEmployee", employeeService.getAllEmployees());
		return "prepup";
	}

	public String findbyNo() {
		list = orderBillService.getOrderBillByNo(orderBill.getBillNo());
		return "zhanshi";
	}

	public String showList() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billState = reqeust.getParameter("id");// 字符串
		System.out.println(billState);
		list = orderBillService.getOrderBillByBillState(Integer
				.parseInt(billState));
		return "zhanshi";
	}

	public String addPre() {
		getRequest().put("listClient", clientService.getAllClients());
		getRequest().put("listEmployee", employeeService.getAllEmployees());
		return "addPre";
	}

	// 增加
	public String saveOne() {
		orderBillService.addOrderBill(orderBill);
		return "find2";
	}

	// 修改
	public String update() {
		orderBillService.updateOrderBill(orderBill);
		return "find";
	}
	public String updateOther(){
		orderBillService.updateOtherOrderBill(orderBill);
		return "find";
	}

	public String updateOne() {
		return "showAlert";
	}

	public String updateMoney() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		String billAmount = reqeust.getParameter("billAmount");// 字符串
		Integer billAmount2 = Integer.parseInt(billAmount);
		orderBillService.updateOrderBillByMoney(Integer.parseInt(billId),
				new BigDecimal(billAmount2.toString()));
		return "find";
	}

	public String total() {
		// for循环出记录Integer id
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		listOrderBillProducts = orderBillProductService
				.getOrderBillProductByNo(Integer.parseInt(billId));
		for (int i = 0; i <= listOrderBillProducts.size(); i++) {
			// if选中其中billId=？的，将其quantity和product.price相乘相加
			OrderBillProduct value = listOrderBillProducts.get(i);
			System.out.println(value);
			Double aDouble = value.getQuantity()
					* value.getProduct().getPrice().doubleValue();
		}
		return null;
		// orderBillProductService.getOrderBillProductByNo();
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
			cell_title1.setCellValue("订单编号");
			cell_title2.setCellValue("发货人");
			cell_title3.setCellValue("客户名称");
			cell_title4.setCellValue("联系人");
			cell_title5.setCellValue("联系电话");
			cell_title6.setCellValue("下单时间");
			cell_title7.setCellValue("订单金额");
			cell_title8.setCellValue("订单状态");

			// List<Product> products = productService.getAllProducts();
			for (int i = 0; i < selectedRow.length; i++) {
				// int a = selectedRow[
				OrderBill orderBill = orderBillService.getOrderBill(Integer
						.parseInt(selectedRow[i]));
				HSSFRow row = sheet.createRow(i + 1);
				HSSFCell cell1 = row.createCell(0);
				HSSFCell cell2 = row.createCell(1);
				HSSFCell cell3 = row.createCell(2);
				HSSFCell cell4 = row.createCell(3);
				HSSFCell cell5 = row.createCell(4);
				HSSFCell cell6 = row.createCell(5);
				HSSFCell cell7 = row.createCell(6);
				HSSFCell cell8 = row.createCell(7);
				cell1.setCellValue(orderBill.getBillNo());
				cell2.setCellValue(orderBill.getEmployee().getName());
				cell3.setCellValue(orderBill.getClient().getClientName());
				cell4.setCellValue(orderBill.getClient().getContact());
				cell5.setCellValue(orderBill.getClient().getContactPhone());
				cell6.setCellValue(orderBill.getDeliveryAt());
				cell7.setCellValue(String.valueOf(orderBill.getBillAmount()));
				if (orderBill.getBillState() == 1) {
					String state = "待审核";
					cell8.setCellValue(state);
				} else if (orderBill.getBillState() == 2) {
					String state = "已审核";
					cell8.setCellValue(state);
				} else if (orderBill.getBillState() == 3) {
					String state = "生产中";
					cell8.setCellValue(state);
				} else if (orderBill.getBillState() == 4) {
					String state = "已发货";
					cell8.setCellValue(state);
				} else if (orderBill.getBillState() == 5) {
					String state = "已取消";
					cell8.setCellValue(state);
				}

			}
			HttpServletResponse response = ServletActionContext.getResponse();
			// 把响应头数据类型设置为任意二进制流，用于上传下载
			response.setContentType("application/octet-stream");
			// 告诉浏览器通过下载方式打开，并设置下载文件名
			response.setHeader("Content-Disposition", "attachment;fileName="//
					+ new String("订单信息.xls".getBytes(), "ISO8859-1"));
			ServletOutputStream sos = response.getOutputStream();
			workbook.write(sos);
			if (sos != null) {
				sos.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public OrderBillService getOrderBillService() {
		return orderBillService;
	}

	public void setOrderBillService(OrderBillService orderBillService) {
		this.orderBillService = orderBillService;
	}

	public ClientService getClientService() {
		return clientService;
	}

	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}

	public List<OrderBill> getList() {
		return list;
	}

	public void setList(List<OrderBill> list) {
		this.list = list;
	}

	public List<Client> getListClient() {
		return listClient;
	}

	public void setListClient(List<Client> listClient) {
		this.listClient = listClient;
	}

	public OrderBill getOrderBill() {
		return orderBill;
	}

	public void setOrderBill(OrderBill orderBill) {
		this.orderBill = orderBill;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public List<Employee> getListEmployee() {
		return listEmployee;
	}

	public void setListEmployee(List<Employee> listEmployee) {
		this.listEmployee = listEmployee;
	}

	public OrderBillProductService getOrderBillProductService() {
		return orderBillProductService;
	}

	public void setOrderBillProductService(
			OrderBillProductService orderBillProductService) {
		this.orderBillProductService = orderBillProductService;
	}

	public List<OrderBillProduct> getListOrderBillProducts() {
		return listOrderBillProducts;
	}

	public void setListOrderBillProducts(
			List<OrderBillProduct> listOrderBillProducts) {
		this.listOrderBillProducts = listOrderBillProducts;
	}

	public String[] getSelectedRow() {
		return selectedRow;
	}

	public void setSelectedRow(String[] selectedRow) {
		this.selectedRow = selectedRow;
	}

	public File getProductExcel() {
		return productExcel;
	}

	public void setProductExcel(File productExcel) {
		this.productExcel = productExcel;
	}

	public String getProductExcelContentType() {
		return productExcelContentType;
	}

	public void setProductExcelContentType(String productExcelContentType) {
		this.productExcelContentType = productExcelContentType;
	}

	public String getProductExcelFileName() {
		return productExcelFileName;
	}

	public void setProductExcelFileName(String productExcelFileName) {
		this.productExcelFileName = productExcelFileName;
	}

}
