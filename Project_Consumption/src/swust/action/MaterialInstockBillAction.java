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
import swust.model.Material;
import swust.model.MaterialInstockBill;
import swust.model.MwareHouse;
import swust.model.MwareHouseMaterial;
import swust.model.Purchase;
import swust.service.EmployeeService;
import swust.service.MaterialInstockBillService;
import swust.service.MaterialService;
import swust.service.MwareHouseMaterialService;
import swust.service.MwareHouseService;
import swust.service.PurchaseService;

public class MaterialInstockBillAction extends BaseAction {
	private MaterialInstockBillService materialInstockBillService;
	private EmployeeService employeeService;
	private MwareHouseService mwareHouseService;
	private MwareHouseMaterialService mwareHouseMaterialService;
	private MaterialService materialService;
	private PurchaseService purchaseService;
	private List<MaterialInstockBill> list;
	private List<Employee> listEmployees;
	private List<MwareHouse> listMwareHouses;
	private List<Material> listMaterials;
	private MaterialInstockBill materialInstockBill;
	private Material material;
	private MwareHouseMaterial mwareHouseMaterial;
	private Purchase purchase;
	private int id;
	private String result;

	private String[] selectedRow;
	private File billmaterialExcel;
	private String billmaterialExcelContentType;
	private String billmaterialExcelFileName;

	public String show() {
		list = materialInstockBillService.getAllMaterialInstockBills();
		return "zhanshi";
	}

	public String test2() {
		materialInstockBillService.addToMaterialCheck(materialInstockBill);
		return "find4";
	}

	public String show3() {
		list = materialInstockBillService.getAllMaterialInstockBills();
		return "zhanshi2";
	}

	public String show2() {
		list = materialInstockBillService.getBillNoByOnly();
		return "zhanshi";
	}

	public String showmore() {
		list = materialInstockBillService.getAllMaterialInstockBills();
		return "showmore";
	}

	public String showBybillNo() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		System.out.println(billNo.trim());
		list = materialInstockBillService.getSimpleByBillNo(billNo.trim());
		System.out.println(list);
		return "showbill";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		materialInstockBillService.delMaterialInstockBill(Integer
				.parseInt(billId));
		return "find3";
	}

	public String delete2() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		materialInstockBillService.delMaterialInstockBill(Integer
				.parseInt(billId));
		return "find2";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		getRequest().put("listEmployees", employeeService.getAllEmployees());
		getRequest().put("listMwareHouses",
				mwareHouseService.getAllMwareHouses());
		materialInstockBill = materialInstockBillService
				.getMaterialInstockBill(Integer.parseInt(billId));
		return "prepup";
	}

	public String prepup2() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		getRequest().put("listMaterials", materialService.getAllMaterials());
		materialInstockBill = materialInstockBillService
				.getMaterialInstockBill(Integer.parseInt(billId));
		return "prepup2";
	}

	public String insert() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String billId = request.getParameter("billId");// 字符串
		materialInstockBill = materialInstockBillService
				.getMaterialInstockBill(Integer.parseInt(billId));
		return "insert";
	}

	public String addPre() {
		/*
		 * getRequest().put("listMaterialInstockBills",
		 * materialInstockBillService.getAllMaterialInstockBills());
		 * getRequest().put("listEmployees", employeeService.getAllEmployees());
		 * getRequest().put("listMwareHouses",
		 * mwareHouseService.getAllMwareHouses());
		 * getRequest().put("listMaterials", materialService.getAllMaterials());
		 */

		HttpServletRequest request = ServletActionContext.getRequest();
		String materialId = request.getParameter("materialId");// 字符串
		String wid = request.getParameter("wid");
		String purId = request.getParameter("purId");
		material = materialService.getMaterial(Integer.parseInt(materialId));
		mwareHouseMaterial = mwareHouseMaterialService.getById(Integer
				.parseInt(wid));
		purchase = purchaseService.getPurchase(Integer.parseInt(purId));
		System.out.println(material);
		System.out.println(mwareHouseMaterial);
		getRequest().put("listEmployees", employeeService.getAllEmployees());
		return "addPre";
	}

	public String addPre2() {
		getRequest().put("listMaterialInstockBills",
				materialInstockBillService.getBillNoByOnly());
		getRequest().put("listEmployees", employeeService.getAllEmployees());
		getRequest().put("listMwareHouses",
				mwareHouseService.getAllMwareHouses());
		getRequest().put("listMaterials", materialService.getAllMaterials());
		return "addPre2";
	}

	// 增加
	public String save2() {
		materialInstockBillService.addMaterialInstockBill(materialInstockBill);
		return "find2";
	}

	// 增加
	public String save() {
		materialInstockBillService.addMaterialInstockBill(materialInstockBill);
		return "find3";
	}

	// 修改
	public String update() {
		materialInstockBillService
				.updateMaterialInstockBill(materialInstockBill);
		return "find3";
	}

	// 修改
	public String update2() {
		materialInstockBillService
				.updateMaterialInstockBillMaterial(materialInstockBill);
		return "find2";
	}

	public String showList() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billState = reqeust.getParameter("id");// 字符串
		list = materialInstockBillService
				.getMaterialInstockBillByBillState(Integer.parseInt(billState));
		return "zhanshi";
	}

	public String test() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		listMaterials = materialInstockBillService.getMaterialDistinct(billNo);
		JSONArray json = JSONArray.fromObject(listMaterials);
		// System.out.println(json);
		result = json.toString();
		// System.out.println(result);
		return "test";
	}

	public String listAll() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		list = materialInstockBillService.getSimpleByBillNo(billNo);
		JSONArray json = JSONArray.fromObject(list);
		result = json.toString();
		return "list";
	}

	public String addToupdate() {
		materialInstockBillService
				.addToupdateMaterialInstockBill(materialInstockBill);
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
			cell_title1.setCellValue("物料入库单编号");
			cell_title2.setCellValue("领货人");
			cell_title3.setCellValue("入库仓库");
			cell_title4.setCellValue("创建时间");
			cell_title5.setCellValue("物料去向");
			cell_title6.setCellValue("物料入库状态");
			cell_title7.setCellValue("物料");
			cell_title8.setCellValue("物料数量");

			// List<Material> materials = materialService.getAllMaterials();
			for (int i = 0; i < selectedRow.length; i++) {
				// int a = selectedRow[
				/*
				 * Material material = materialService.getMaterial(Integer
				 * .parseInt(selectedRow[i]));
				 */
				MaterialInstockBill materialInstockBill = materialInstockBillService
						.getMaterialInstockBill(Integer
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
				cell1.setCellValue(materialInstockBill.getBillNo());
				cell2.setCellValue(materialInstockBill.getEmployee().getName());
				cell3.setCellValue(materialInstockBill.getMwareHouse()
						.getWareNo());
				cell4.setCellValue(materialInstockBill.getBillTime());
				if (materialInstockBill.getMaterialSource() == 1) {
					String materialSource = "生产入库";
					cell5.setCellValue(materialSource);
				} else if (materialInstockBill.getMaterialSource() == 2) {
					String materialSource = "其他仓库入库";
					cell5.setCellValue(materialSource);
				}
				if (materialInstockBill.getBillState() == 1) {
					String billStateString = "待审核";
					cell6.setCellValue(billStateString);
				} else if (materialInstockBill.getBillState() == 2) {
					String billStateString = "已审核";
					cell6.setCellValue(billStateString);
				}

				cell7.setCellValue(materialInstockBill.getMaterial()
						.getMaterialName());
				cell8.setCellValue(materialInstockBill.getQuantity());
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			// 把响应头数据类型设置为任意二进制流，用于上传下载
			response.setContentType("application/octet-stream");
			// 告诉浏览器通过下载方式打开，并设置下载文件名
			response.setHeader("Content-Disposition", "attachment;fileName="//
					+ new String("物料入库单信息.xls".getBytes(), "ISO8859-1"));
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

		if (billmaterialExcel != null) {
			// 是否是excel ^开始 .+任意字符串 $结束 ?i 忽略大小写 xls | xlsx 后缀名 \\.表示最后.
			if (billmaterialExcelFileName.matches("^.+\\.(?i)((xls)|(xlsx))$")) {
				// 2、导入
				materialInstockBillService.importExcel(billmaterialExcel,
						billmaterialExcelFileName);
			}
		}
		return "find";
	}

	public MaterialInstockBillService getMaterialInstockBillService() {
		return materialInstockBillService;
	}

	public void setMaterialInstockBillService(
			MaterialInstockBillService materialInstockBillService) {
		this.materialInstockBillService = materialInstockBillService;
	}

	public List<MaterialInstockBill> getList() {
		return list;
	}

	public void setList(List<MaterialInstockBill> list) {
		this.list = list;
	}

	public MaterialInstockBill getMaterialInstockBill() {
		return materialInstockBill;
	}

	public void setMaterialInstockBill(MaterialInstockBill materialInstockBill) {
		this.materialInstockBill = materialInstockBill;
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

	public MwareHouseService getMwareHouseService() {
		return mwareHouseService;
	}

	public void setMwareHouseService(MwareHouseService mwareHouseService) {
		this.mwareHouseService = mwareHouseService;
	}

	public List<Employee> getListEmployees() {
		return listEmployees;
	}

	public void setListEmployees(List<Employee> listEmployees) {
		this.listEmployees = listEmployees;
	}

	public List<MwareHouse> getListMwareHouses() {
		return listMwareHouses;
	}

	public void setListMwareHouses(List<MwareHouse> listMwareHouses) {
		this.listMwareHouses = listMwareHouses;
	}

	public MaterialService getMaterialService() {
		return materialService;
	}

	public void setMaterialService(MaterialService materialService) {
		this.materialService = materialService;
	}

	public List<Material> getListMaterials() {
		return listMaterials;
	}

	public void setListMaterials(List<Material> listMaterials) {
		this.listMaterials = listMaterials;
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

	public File getBillmaterialExcel() {
		return billmaterialExcel;
	}

	public void setBillmaterialExcel(File billmaterialExcel) {
		this.billmaterialExcel = billmaterialExcel;
	}

	public String getBillmaterialExcelContentType() {
		return billmaterialExcelContentType;
	}

	public void setBillmaterialExcelContentType(
			String billmaterialExcelContentType) {
		this.billmaterialExcelContentType = billmaterialExcelContentType;
	}

	public String getBillmaterialExcelFileName() {
		return billmaterialExcelFileName;
	}

	public void setBillmaterialExcelFileName(String billmaterialExcelFileName) {
		this.billmaterialExcelFileName = billmaterialExcelFileName;
	}

	public MwareHouseMaterialService getMwareHouseMaterialService() {
		return mwareHouseMaterialService;
	}

	public void setMwareHouseMaterialService(
			MwareHouseMaterialService mwareHouseMaterialService) {
		this.mwareHouseMaterialService = mwareHouseMaterialService;
	}

	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}

	public MwareHouseMaterial getMwareHouseMaterial() {
		return mwareHouseMaterial;
	}

	public void setMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		this.mwareHouseMaterial = mwareHouseMaterial;
	}

	public PurchaseService getPurchaseService() {
		return purchaseService;
	}

	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

}
