package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import swust.model.DrawMaterialBill;
import swust.model.DrawMaterialBillMaterial;
import swust.model.OrderBillProduct;
import swust.service.DrawMaterialBillMaterialService;
import swust.service.DrawMaterialBillService;
import swust.service.EmployeeService;
import swust.service.MwareHouseService;
import swust.service.OrderBillProductService;
import swust.service.OrderBillService;

public class DrawMaterialBillAction extends BaseAction {
	private DrawMaterialBillService drawMaterialBillService;
	private DrawMaterialBillMaterialService drawMaterialBillMaterialService;
	private EmployeeService employeeService;
	private MwareHouseService mwareHouseService;
	private OrderBillService orderBillService;
	private OrderBillProductService orderBillProductService;
	private List<DrawMaterialBill> list;
	private List<DrawMaterialBillMaterial> list2;
	private DrawMaterialBill drawMaterialBill;
	private int id;
	private String result;

	public String show() {
		list = drawMaterialBillService.getAllDrawMaterialBills();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String drawbillId = reqeust.getParameter("drawbillId");// 字符串
		drawMaterialBillService.delDrawMaterialBill(Integer
				.parseInt(drawbillId));
		return "find";
	}

	public String myalert() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String drawbillId = reqeust.getParameter("drawbillId");// 字符串
		System.out.println(drawbillId);
		list2 = drawMaterialBillMaterialService.getByBillId(Integer
				.parseInt(drawbillId));
		System.out.println(list2);
		return "myalert";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String drawbillId = reqeust.getParameter("drawbillId");// 字符串
		drawMaterialBill = drawMaterialBillService.getDrawMaterialBill(Integer
				.parseInt(drawbillId));
		getRequest().put("listEmployee", employeeService.getAllEmployees());
		getRequest()
				.put("listWareHouse", mwareHouseService.getAllMwareHouses());
		return "prepup";
	}

	public String addPre() {
		getRequest().put("listDrawMaterials",
				drawMaterialBillService.getAllDrawMaterialBills());
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

	public String getDMId() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billNo = reqeust.getParameter("billNo");// 字符串
		System.out.println(billNo);
		list = drawMaterialBillService.getDrawMaterialBillByNo(billNo);
		JSONArray json = JSONArray.fromObject(list);
		result = json.toString();
		System.out.println(result);
		return "idjson";
	}

	public String showList() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billState = reqeust.getParameter("id");// 字符串
		list = drawMaterialBillService.getDrawMaterialBillByBillState(Integer
				.parseInt(billState));

		return "zhanshi";
	}

	// 增加
	public String save() {
		drawMaterialBillService.addDrawMaterialBill(drawMaterialBill);
		list = drawMaterialBillService.getAllDrawMaterialBills();
		JSONArray jsonArray = JSONArray.fromObject(list);
		result = jsonArray.toString();
		return "mysave";
	}

	// 修改
	public String update() {
		getRequest().put("listEmployee", employeeService.getAllEmployees());
		getRequest()
				.put("listWareHouse", mwareHouseService.getAllMwareHouses());
		drawMaterialBillService.updateDrawMaterialBill(drawMaterialBill);
		return "find";
	}

	public DrawMaterialBillService getDrawMaterialBillService() {
		return drawMaterialBillService;
	}

	public void setDrawMaterialBillService(
			DrawMaterialBillService drawMaterialBillService) {
		this.drawMaterialBillService = drawMaterialBillService;
	}

	public List<DrawMaterialBill> getList() {
		return list;
	}

	public void setList(List<DrawMaterialBill> list) {
		this.list = list;
	}

	public DrawMaterialBill getDrawMaterialBill() {
		return drawMaterialBill;
	}

	public void setDrawMaterialBill(DrawMaterialBill drawMaterialBill) {
		this.drawMaterialBill = drawMaterialBill;
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

	public DrawMaterialBillMaterialService getDrawMaterialBillMaterialService() {
		return drawMaterialBillMaterialService;
	}

	public void setDrawMaterialBillMaterialService(
			DrawMaterialBillMaterialService drawMaterialBillMaterialService) {
		this.drawMaterialBillMaterialService = drawMaterialBillMaterialService;
	}

	public List<DrawMaterialBillMaterial> getList2() {
		return list2;
	}

	public void setList2(List<DrawMaterialBillMaterial> list2) {
		this.list2 = list2;
	}

}
