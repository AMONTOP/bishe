package swust.action;

import java.io.File;
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
import swust.service.ClientService;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.ValidationAware;

public class ClientAction extends BaseAction implements ModelDriven<Client>,
		ValidationAware {
	private ClientService clientService;
	private List<Client> list;
	private Client client;
	private int id;
	private String productName;
	private String[] selectedRow;
	private File productExcel;
	private String productExcelContentType;
	private String productExcelFileName;

	private String clientName;

	public Client getModel() {
		client = new Client();
		return client;
	}

	public String show() {
		list = clientService.getAllClients();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String clientId = reqeust.getParameter("clientId");// 字符串
		clientService.delClient(Integer.parseInt(clientId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String clientId = reqeust.getParameter("clientId");// 字符串
		client = clientService.getClient(Integer.parseInt(clientId));
		return "prepup";
	}

	public String findbyName() {
		list = clientService.getClientByName(client.getClientName());
		return "zhanshi";
	}

	// 增加
	public String save() {
		clientService.addClient(client);
		return "find";
	}

	// 修改
	public String update() {
		clientService.updateClient(client);
		return "find";
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
			cell_title1.setCellValue("客户名称");
			cell_title2.setCellValue("联系人");
			cell_title3.setCellValue("联系电话");
			cell_title4.setCellValue("地址");
			cell_title5.setCellValue("邮编");
			cell_title6.setCellValue("邮箱");
			cell_title7.setCellValue("法人代表");
			cell_title8.setCellValue("热线电话");

			// List<Product> products = productService.getAllProducts();
			for (int i = 0; i < selectedRow.length; i++) {
				// int a = selectedRow[
				Client client = clientService.getClient(Integer
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
				cell1.setCellValue(client.getClientName());
				cell2.setCellValue(client.getContact());
				cell3.setCellValue(client.getContactPhone());
				cell4.setCellValue(client.getAddress());
				cell5.setCellValue(client.getPostcode());
				cell6.setCellValue(client.getEmail());
				cell7.setCellValue(client.getCorporation());
				cell8.setCellValue(client.getTelephone());
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			// 把响应头数据类型设置为任意二进制流，用于上传下载
			response.setContentType("application/octet-stream");
			// 告诉浏览器通过下载方式打开，并设置下载文件名
			response.setHeader("Content-Disposition", "attachment;fileName="//
					+ new String("客户信息.xls".getBytes(), "ISO8859-1"));
			ServletOutputStream sos = response.getOutputStream();
			workbook.write(sos);
			if (sos != null) {
				sos.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ClientService getClientService() {
		return clientService;
	}

	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}

	public List<Client> getList() {
		return list;
	}

	public void setList(List<Client> list) {
		this.list = list;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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
