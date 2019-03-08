package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.MwareHouse;
import swust.model.MwareHouseMaterial;
import swust.service.EmployeeService;
import swust.service.MaterialService;
import swust.service.MwareHouseMaterialService;
import swust.service.MwareHouseService;

public class MwareHouseAction extends BaseAction {
	private MwareHouseService wareHouseService;
	private MwareHouseMaterialService wareHouseMaterialService;
	private MaterialService materialService;
	private EmployeeService employeeService;
	private List<MwareHouse> list;
	private List<MwareHouseMaterial> list2;
	private MwareHouse wareHouse;
	private int id;
	private String wareNo;

	public String show() {
		list = wareHouseService.getAllMwareHouses();
		list2 = wareHouseMaterialService.getMwareHouseMaterialByWare(1);
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String wareId = reqeust.getParameter("wareId");// 字符串
		wareHouseService.delMwareHouse(Integer.parseInt(wareId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String wareId = reqeust.getParameter("wareId");// 字符串
		wareHouse = wareHouseService.getMwareHouse(Integer.parseInt(wareId));
		getRequest().put("listEmployee", employeeService.getAllEmployees());
		return "prepup";
	}

	public String addPre() {
		getRequest().put("listMaterial", materialService.getAllMaterials());
		getRequest().put("listEmployee", employeeService.getAllEmployees());
		return "addPre";
	}

	public String findbyName() {
		// list =
		// wareHouseService.getMwareHouseByName(wareHouse.getMwareHouseName());
		return "zhanshi";
	}

	// 增加
	public String save() {
		wareHouseService.addMwareHouse(wareHouse);
		return "find";
	}

	// 修改
	public String update() {
		System.out.println("aaa");
		wareHouseService.updateMwareHouse(wareHouse);
		return "find";
	}

	public MwareHouseService getMwareHouseService() {
		return wareHouseService;
	}

	public void setMwareHouseService(MwareHouseService wareHouseService) {
		this.wareHouseService = wareHouseService;
	}

	public List<MwareHouse> getList() {
		return list;
	}

	public void setList(List<MwareHouse> list) {
		this.list = list;
	}

	public MwareHouse getMwareHouse() {
		return wareHouse;
	}

	public void setMwareHouse(MwareHouse wareHouse) {
		this.wareHouse = wareHouse;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMwareHouseName() {
		return wareNo;
	}

	public void setMwareHouseName(String wareNo) {
		this.wareNo = wareNo;
	}

	public MaterialService getMaterialService() {
		return materialService;
	}

	public void setMaterialService(MaterialService materialService) {
		this.materialService = materialService;
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

	public MwareHouseMaterialService getMwareHouseMaterialService() {
		return wareHouseMaterialService;
	}

	public void setMwareHouseMaterialService(
			MwareHouseMaterialService wareHouseMaterialService) {
		this.wareHouseMaterialService = wareHouseMaterialService;
	}

	public List<MwareHouseMaterial> getList2() {
		return list2;
	}

	public void setList2(List<MwareHouseMaterial> list2) {
		this.list2 = list2;
	}

}
