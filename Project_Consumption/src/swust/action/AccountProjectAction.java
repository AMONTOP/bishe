package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.AccountProject;
import swust.service.AccountProjectService;
import swust.service.EmployeeService;
import swust.service.ProjectService;

public class AccountProjectAction extends BaseAction {
	private AccountProjectService accountProjectService;
	private ProjectService projectService;
	private EmployeeService employeeService;
	private List<AccountProject> list;
	private AccountProject accountProject;
	private int id;

	public String show() {
		list = accountProjectService.getAllAccountProjects();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String accountId = reqeust.getParameter("accountId");// 字符串
		accountProjectService.delAccountProject(Integer.parseInt(accountId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String accountId = reqeust.getParameter("accountId");// 字符串
		accountProject = accountProjectService.getAccountProject(Integer
				.parseInt(accountId));
		getRequest().put("listProject", projectService.getAllProjects());
		getRequest().put("listEmp", employeeService.getAllEmployees());
		return "prepup";
	}

	public String addPre() {
		getRequest().put("listProject", projectService.getAllProjects());
		getRequest().put("listEmp", employeeService.getAllEmployees());
		return "addPre";
	}

	// 增加
	public String save() {
		accountProjectService.addAccountProject(accountProject);
		return "find";
	}

	// 修改
	public String update() {
		accountProjectService.updateAccountProject(accountProject);
		return "find";
	}

	public AccountProjectService getAccountProjectService() {
		return accountProjectService;
	}

	public void setAccountProjectService(
			AccountProjectService accountProjectService) {
		this.accountProjectService = accountProjectService;
	}

	public List<AccountProject> getList() {
		return list;
	}

	public void setList(List<AccountProject> list) {
		this.list = list;
	}

	public AccountProject getAccountProject() {
		return accountProject;
	}

	public void setAccountProject(AccountProject accountProject) {
		this.accountProject = accountProject;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ProjectService getProjectService() {
		return projectService;
	}

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

}
