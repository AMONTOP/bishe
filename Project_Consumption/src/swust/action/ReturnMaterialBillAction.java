package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import swust.model.OrderBillProduct;
import swust.model.ReturnMaterialBill;
import swust.model.ReturnMaterialBillMaterial;
import swust.service.EmployeeService;
import swust.service.MwareHouseService;
import swust.service.OrderBillProductService;
import swust.service.OrderBillService;
import swust.service.ReturnMaterialBillMaterialService;
import swust.service.ReturnMaterialBillService;

public class ReturnMaterialBillAction extends BaseAction {
	private ReturnMaterialBillService returnMaterialBillService;
	private ReturnMaterialBillMaterialService returnMaterialBillMaterialService;
	private EmployeeService employeeService;
	private MwareHouseService mwareHouseService;
	private OrderBillService orderBillService;
	private OrderBillProductService orderBillProductService;
	private List<ReturnMaterialBill> list;
	private List<ReturnMaterialBillMaterial> list2;
	private ReturnMaterialBill returnMaterialBill;
	private int id;
	private String result;

	public String show() {
		list = returnMaterialBillService.getAllReturnMaterialBills();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String returnbillId = reqeust.getParameter("returnbillId");// 字符串
		returnMaterialBillService.delReturnMaterialBill(Integer
				.parseInt(returnbillId));
		return "find";
	}

	public String myalert() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String returnbillId = reqeust.getParameter("returnbillId");// 字符串
		list2 = returnMaterialBillMaterialService.getByBillId(Integer
				.parseInt(returnbillId));
		System.out.println(list2);
		return "myalert";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String returnbillId = reqeust.getParameter("returnbillId");// 字符串
		getRequest().put("listEmployee", employeeService.getAllEmployees());
		getRequest()
				.put("listWareHouse", mwareHouseService.getAllMwareHouses());
		returnMaterialBill = returnMaterialBillService
				.getReturnMaterialBill(Integer.parseInt(returnbillId));
		return "prepup";
	}

	public String addPre() {
		getRequest().put("listReturnMaterials",
				returnMaterialBillService.getAllReturnMaterialBills());
		getRequest().put("listEmployee", employeeService.getAllEmployees());
		getRequest()
				.put("listWareHouse", mwareHouseService.getAllMwareHouses());
		getRequest().put("listOrderBill",
				orderBillService.getOrderBillByBillState(3));
		return "addPre";
	}

	public String optionPre() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");// 字符串
		System.out.println(billId);
		List<OrderBillProduct> lists = orderBillProductService
				.getOrderBillProductByNo(Integer.parseInt(billId));
		JSONArray json = JSONArray.fromObject(lists);
		result = json.toString();
		System.out.println(result);
		return "optionjson";
	}

	public String getRMId() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		System.out.println(billNo);
		returnMaterialBill = returnMaterialBillService
				.getReturnMaterialBillByNo(billNo);
		JSONArray json = JSONArray.fromObject(returnMaterialBill);
		result = json.toString();
		System.out.println(result);
		return "idjson";
	}

	public String showList() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billState = reqeust.getParameter("id");// 字符串
		list = returnMaterialBillService
				.getReturnMaterialBillByBillState(Integer.parseInt(billState));
		return "zhanshi";
	}

	// 增加
	public String save() {
		returnMaterialBillService.addReturnMaterialBill(returnMaterialBill);
		List<OrderBillProduct> lists = orderBillProductService
				.getAllOrderBillProducts();
		JSONArray json = JSONArray.fromObject(lists);
		result = json.toString();
		System.out.println(result);
		return "savejson";
	}

	// 修改
	public String update() {
		getRequest().put("listEmployee", employeeService.getAllEmployees());
		getRequest()
				.put("listWareHouse", mwareHouseService.getAllMwareHouses());
		returnMaterialBillService.updateReturnMaterialBill(returnMaterialBill);
		return "find";
	}

	public ReturnMaterialBillService getReturnMaterialBillService() {
		return returnMaterialBillService;
	}

	public void setReturnMaterialBillService(
			ReturnMaterialBillService returnMaterialBillService) {
		this.returnMaterialBillService = returnMaterialBillService;
	}

	public List<ReturnMaterialBill> getList() {
		return list;
	}

	public void setList(List<ReturnMaterialBill> list) {
		this.list = list;
	}

	public ReturnMaterialBill getReturnMaterialBill() {
		return returnMaterialBill;
	}

	public void setReturnMaterialBill(ReturnMaterialBill returnMaterialBill) {
		this.returnMaterialBill = returnMaterialBill;
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

	public OrderBillService getOrderBillService() {
		return orderBillService;
	}

	public void setOrderBillService(OrderBillService orderBillService) {
		this.orderBillService = orderBillService;
	}

	public OrderBillProductService getOrderBillProductService() {
		return orderBillProductService;
	}

	public void setOrderBillProductService(
			OrderBillProductService orderBillProductService) {
		this.orderBillProductService = orderBillProductService;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public ReturnMaterialBillMaterialService getReturnMaterialBillMaterialService() {
		return returnMaterialBillMaterialService;
	}

	public void setReturnMaterialBillMaterialService(
			ReturnMaterialBillMaterialService returnMaterialBillMaterialService) {
		this.returnMaterialBillMaterialService = returnMaterialBillMaterialService;
	}

	public List<ReturnMaterialBillMaterial> getList2() {
		return list2;
	}

	public void setList2(List<ReturnMaterialBillMaterial> list2) {
		this.list2 = list2;
	}

}
