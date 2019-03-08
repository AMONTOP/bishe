package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.AccountPay;
import swust.service.AccountInfoService;
import swust.service.AccountPayService;
import swust.service.EmployeeService;
import swust.service.ProjectService;
import swust.service.SupplierService;

public class AccountPayAction extends BaseAction {
	private AccountPayService accountPayService;
	private EmployeeService employeeService;
	private ProjectService projectService;
	private SupplierService supplierService;
	private AccountInfoService accountInfoService;
	private List<AccountPay> list;
	private AccountPay accountPay;
	private int id;

	public String show() {
		list = accountPayService.getAllAccountPays();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String payId = reqeust.getParameter("payId");// 字符串
		accountPayService.delAccountPay(Integer.parseInt(payId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String payId = reqeust.getParameter("payId");// 字符串
		accountPay = accountPayService.getAccountPay(Integer.parseInt(payId));
		getRequest().put("listEmp", employeeService.getAllEmployees());
		getRequest().put("listSupplier", supplierService.getAllSuppliers());
		getRequest().put("listAccountInfo",
				accountInfoService.getAllAccountInfos());
		getRequest().put("listProject", projectService.getAllProjects());
		return "prepup";
	}

	public String addPre() {
		getRequest().put("listEmp", employeeService.getAllEmployees());
		getRequest().put("listSupplier", supplierService.getAllSuppliers());
		getRequest().put("listAccountInfo",
				accountInfoService.getAllAccountInfos());
		getRequest().put("listProject", projectService.getAllProjects());
		return "addPre";
	}

	// 增加
	public String save() {
		accountPayService.addAccountPay(accountPay);
		return "find";
	}

	// 修改
	public String update() {
		accountPayService.updateAccountPay(accountPay);
		return "find";
	}

	public AccountPayService getAccountPayService() {
		return accountPayService;
	}

	public void setAccountPayService(AccountPayService accountPayService) {
		this.accountPayService = accountPayService;
	}

	public List<AccountPay> getList() {
		return list;
	}

	public void setList(List<AccountPay> list) {
		this.list = list;
	}

	public AccountPay getAccountPay() {
		return accountPay;
	}

	public void setAccountPay(AccountPay accountPay) {
		this.accountPay = accountPay;
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

	public ProjectService getProjectService() {
		return projectService;
	}

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
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

}
