package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.AccountInfo;
import swust.model.AccountRepay;
import swust.model.Employee;
import swust.model.Supplier;
import swust.service.AccountInfoService;
import swust.service.AccountRepayService;
import swust.service.EmployeeService;
import swust.service.SupplierService;

public class AccountRepayAction extends BaseAction {
	private AccountRepayService accountRepayService;
	private List<AccountRepay> list;
	private AccountRepay accountRepay;
	private EmployeeService employeeService;
	private List<Employee> employees;
	private SupplierService supplierService;
	private List<Supplier> suppliers;
	private AccountInfoService accountInfoService;
	private List<AccountInfo> accountInfos;
	private int id;

	public String show() {
		list = accountRepayService.getAllAccountRepays();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String repayId = reqeust.getParameter("repayId");// 字符串
		accountRepayService.delAccountRepay(Integer.parseInt(repayId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String repayId = reqeust.getParameter("repayId");// 字符串
		accountRepay = accountRepayService.getAccountRepay(Integer
				.parseInt(repayId));
		getRequest().put("listEmp", employeeService.getAllEmployees());
		getRequest().put("listSupplier", supplierService.getAllSuppliers());
		getRequest().put("listAccountInfo",
				accountInfoService.getAllAccountInfos());
		return "prepup";
	}

	// 增加
	public String save() {
		accountRepayService.addAccountRepay(accountRepay);
		return "find";
	}

	// 修改
	public String update() {
		accountRepayService.updateAccountRepay(accountRepay);
		return "find";
	}

	public String addPre() {
		getRequest().put("listEmp", employeeService.getAllEmployees());
		getRequest().put("listSupplier", supplierService.getAllSuppliers());
		getRequest().put("listAccountInfo",
				accountInfoService.getAllAccountInfos());
		return "addPre";
	}

	public AccountRepayService getAccountRepayService() {
		return accountRepayService;
	}

	public void setAccountRepayService(AccountRepayService accountRepayService) {
		this.accountRepayService = accountRepayService;
	}

	public List<AccountRepay> getList() {
		return list;
	}

	public void setList(List<AccountRepay> list) {
		this.list = list;
	}

	public AccountRepay getAccountRepay() {
		return accountRepay;
	}

	public void setAccountRepay(AccountRepay accountRepay) {
		this.accountRepay = accountRepay;
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

	public SupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}

	public AccountInfoService getAccountInfoService() {
		return accountInfoService;
	}

	public void setAccountInfoService(AccountInfoService accountInfoService) {
		this.accountInfoService = accountInfoService;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public List<Supplier> getSuppliers() {
		return suppliers;
	}

	public void setSuppliers(List<Supplier> suppliers) {
		this.suppliers = suppliers;
	}

	public List<AccountInfo> getAccountInfos() {
		return accountInfos;
	}

	public void setAccountInfos(List<AccountInfo> accountInfos) {
		this.accountInfos = accountInfos;
	}

}
