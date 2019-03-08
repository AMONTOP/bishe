package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.AccountPetty;
import swust.service.AccountPettyService;
import swust.service.EmployeeService;
import swust.service.ProjectService;

public class AccountPettyAction extends BaseAction {
	private AccountPettyService accountPettyService;
	private EmployeeService employeeService;
	private ProjectService projectService;
	private List<AccountPetty> list;
	private AccountPetty accountPetty;
	private int id;

	public String show() {
		list = accountPettyService.getAllAccountPettys();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String accountPettyId = reqeust.getParameter("accountPettyId");// 字符串
		accountPettyService.delAccountPetty(Integer.parseInt(accountPettyId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String accountPettyId = reqeust.getParameter("accountPettyId");// 字符串
		accountPetty = accountPettyService.getAccountPetty(Integer
				.parseInt(accountPettyId));
		getRequest().put("listEmp", employeeService.getAllEmployees());
		getRequest().put("listProject", projectService.getAllProjects());
		return "prepup";
	}

	public String addPre() {
		getRequest().put("listEmp", employeeService.getAllEmployees());
		getRequest().put("listProject", projectService.getAllProjects());
		return "addPre";
	}

	// 增加
	public String save() {
		accountPettyService.addAccountPetty(accountPetty);
		return "find";
	}

	// 修改
	public String update() {
		accountPettyService.updateAccountPetty(accountPetty);
		return "find";
	}

	public AccountPettyService getAccountPettyService() {
		return accountPettyService;
	}

	public void setAccountPettyService(AccountPettyService accountPettyService) {
		this.accountPettyService = accountPettyService;
	}

	public List<AccountPetty> getList() {
		return list;
	}

	public void setList(List<AccountPetty> list) {
		this.list = list;
	}

	public AccountPetty getAccountPetty() {
		return accountPetty;
	}

	public void setAccountPetty(AccountPetty accountPetty) {
		this.accountPetty = accountPetty;
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

}
