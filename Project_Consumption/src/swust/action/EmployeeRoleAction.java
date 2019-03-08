package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.Employee;
import swust.model.EmployeeRole;
import swust.service.EmployeeRoleService;
import swust.service.EmployeeService;

public class EmployeeRoleAction {
	private EmployeeRoleService employeeRoleService;
	private EmployeeService employeeService;
	private List<EmployeeRole> list;
	private List<Employee> list2;
	private EmployeeRole employeeRole;
	private int id;
	private String name;

	public String show() {
		list = employeeRoleService.getAllEmployeeRoles();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String employeeRoleId = reqeust.getParameter("employeeRoleId");// 字符串
		employeeRoleService.delEmployeeRole(Integer.parseInt(employeeRoleId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String employeeRoleId = reqeust.getParameter("employeeRoleId");// 字符串
		employeeRole = employeeRoleService.getEmployeeRole(Integer
				.parseInt(employeeRoleId));
		return "prepup";
	}

	public String findbyName() {
		list = employeeRoleService.getEmployeeRoleByName(employeeRole
				.getEmployee().getName());
		return "zhanshi";
	}

	// 增加
	public String save() {
		employeeRoleService.addEmployeeRole(employeeRole);
		return "find";
	}

	// 修改
	public String update() {
		employeeRoleService.updateEmployeeRole(employeeRole);
		return "find";
	}

	public EmployeeRoleService getEmployeeRoleService() {
		return employeeRoleService;
	}

	public void setEmployeeRoleService(EmployeeRoleService employeeRoleService) {
		this.employeeRoleService = employeeRoleService;
	}

	public List<EmployeeRole> getList() {
		return list;
	}

	public void setList(List<EmployeeRole> list) {
		this.list = list;
	}

	public EmployeeRole getEmployeeRole() {
		return employeeRole;
	}

	public void setEmployeeRole(EmployeeRole employeeRole) {
		this.employeeRole = employeeRole;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public List<Employee> getList2() {
		return list2;
	}

	public void setList2(List<Employee> list2) {
		this.list2 = list2;
	}

}
