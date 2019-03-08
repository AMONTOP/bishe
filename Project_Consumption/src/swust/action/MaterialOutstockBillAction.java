package swust.action;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import swust.model.Employee;
import swust.model.Material;
import swust.model.MaterialOutstockBill;
import swust.model.MwareHouse;
import swust.model.MwareHouseMaterial;
import swust.service.EmployeeService;
import swust.service.MaterialOutstockBillService;
import swust.service.MaterialService;
import swust.service.MwareHouseMaterialService;
import swust.service.MwareHouseService;

public class MaterialOutstockBillAction extends BaseAction {
	private MaterialOutstockBillService materialOutstockBillService;
	private EmployeeService employeeService;
	private MwareHouseService mwareHouseService;
	private MwareHouseMaterialService mwareHouseMaterialService;
	private MaterialService materialService;
	private List<MaterialOutstockBill> list;
	private List<Employee> listEmployees;
	private List<MwareHouse> listMwareHouses;
	private List<Material> listMaterials;
	private List<MwareHouseMaterial> listMwareHouseMaterials;
	private MaterialOutstockBill materialOutstockBill;
	private int id;
	private String result;
	private String resultChange;

	private String[] selectedRow;
	private File billmaterialExcel;
	private String billmaterialExcelContentType;
	private String billmaterialExcelFileName;

	public String show() {
		list = materialOutstockBillService.getAllMaterialOutstockBills();
		return "zhanshi";
	}

	public String show3() {
		list = materialOutstockBillService.getAllMaterialOutstockBills();
		return "zhanshi2";
	}

	public String show2() {
		list = materialOutstockBillService.getBillNoByOnly();
		return "zhanshi";
	}

	public String showmore() {
		list = materialOutstockBillService.getAllMaterialOutstockBills();
		return "showmore";
	}

	public String showBybillNo() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		System.out.println(billNo.trim());
		list = materialOutstockBillService.getSimpleByBillNo(billNo.trim());
		System.out.println(list);
		return "showbill";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		materialOutstockBillService.delMaterialOutstockBill(Integer
				.parseInt(billId));
		return "find";
	}

	public String delete2() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		materialOutstockBillService.delMaterialOutstockBill(Integer
				.parseInt(billId));
		return "find2";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		materialOutstockBill = materialOutstockBillService
				.getMaterialOutstockBill(Integer.parseInt(billId));
		return "prepup";
	}

	public String oneAlert() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		materialOutstockBill = materialOutstockBillService
				.getMaterialOutstockBill(Integer.parseInt(billId));
		return "one";
	}

	public String prepup2() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		getRequest().put("listMaterials", materialService.getAllMaterials());
		materialOutstockBill = materialOutstockBillService
				.getMaterialOutstockBill(Integer.parseInt(billId));
		return "prepup2";
	}

	public String addPre() {
		getRequest().put("listMaterialOutstockBills",
				materialOutstockBillService.getAllMaterialOutstockBills());
		getRequest().put("listEmployees", employeeService.getAllEmployees());
		getRequest().put("listMwareHouses",
				mwareHouseService.getAllMwareHouses());
		getRequest().put("listMaterials", materialService.getAllMaterials());

		return "addPre";
	}

	public String addPre2() {
		getRequest().put("listMaterialOutstockBills",
				materialOutstockBillService.getBillNoByOnly());
		getRequest().put("listEmployees", employeeService.getAllEmployees());
		getRequest().put("listMwareHouses",
				mwareHouseService.getAllMwareHouses());
		getRequest().put("listMaterials", materialService.getAllMaterials());
		return "addPre2";
	}

	// 增加
	public String save2() {
		materialOutstockBillService
				.addMaterialOutstockBill(materialOutstockBill);
		return "find2";
	}

	// 增加
	public String save() {
		materialOutstockBillService
				.addMaterialOutstockBill(materialOutstockBill);
		return "find";
	}

	// 修改
	public String update() {
		materialOutstockBillService
				.updateMaterialOutstockBill(materialOutstockBill);
		return "find";
	}

	public String showList() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billState = reqeust.getParameter("id");// 字符串
		list = materialOutstockBillService
				.getMaterialOutstockBillByBillState(Integer.parseInt(billState));
		return "zhanshi";
	}

	public MaterialOutstockBillService getMaterialOutstockBillService() {
		return materialOutstockBillService;
	}

	public String test() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		listMaterials = materialOutstockBillService.getMaterialDistinct(billNo);
		JSONArray json = JSONArray.fromObject(listMaterials);
		// System.out.println(json);
		result = json.toString();
		// System.out.println(result);
		return "test";
	}

	public String listAll() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		list = materialOutstockBillService.getSimpleByBillNo(billNo);
		JSONArray json = JSONArray.fromObject(list);
		result = json.toString();
		return "list";
	}

	public void setMaterialOutstockBillService(
			MaterialOutstockBillService materialOutstockBillService) {
		this.materialOutstockBillService = materialOutstockBillService;
	}

	public List<MaterialOutstockBill> getList() {
		return list;
	}

	public void setList(List<MaterialOutstockBill> list) {
		this.list = list;
	}

	public MaterialOutstockBill getMaterialOutstockBill() {
		return materialOutstockBill;
	}

	public void setMaterialOutstockBill(
			MaterialOutstockBill materialOutstockBill) {
		this.materialOutstockBill = materialOutstockBill;
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

	public MaterialService getMaterialService() {
		return materialService;
	}

	public void setMaterialService(MaterialService materialService) {
		this.materialService = materialService;
	}

	public MwareHouseMaterialService getMwareHouseMaterialService() {
		return mwareHouseMaterialService;
	}

	public void setMwareHouseMaterialService(
			MwareHouseMaterialService mwareHouseMaterialService) {
		this.mwareHouseMaterialService = mwareHouseMaterialService;
	}

	public List<MwareHouseMaterial> getListMwareHouseMaterials() {
		return listMwareHouseMaterials;
	}

	public void setListMwareHouseMaterials(
			List<MwareHouseMaterial> listMwareHouseMaterials) {
		this.listMwareHouseMaterials = listMwareHouseMaterials;
	}

	public String getResultChange() {
		return resultChange;
	}

	public void setResultChange(String resultChange) {
		this.resultChange = resultChange;
	}

}
