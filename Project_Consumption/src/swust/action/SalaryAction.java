package swust.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.Employee;
import swust.model.ProjectTask;
import swust.model.Salary;
import swust.service.EmployeeService;
import swust.service.ProjectTaskService;
import swust.service.SalaryService;


public class SalaryAction extends BaseAction {
	private SalaryService SalaryService;
	private EmployeeService employeeService;
	private ProjectTaskService projectTaskService;
	private List<Salary> list;
	private List<Employee> list2;
	private List<ProjectTask> listTasks;
	private Salary Salary;
	private int id;


	public String show() {
		list = SalaryService.getAllSalarys();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String SalaryId = reqeust.getParameter("SalaryId");// 字符串
		SalaryService.delSalary(Integer.parseInt(SalaryId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String SalaryId = reqeust.getParameter("SalaryId");// 字符串
		Salary = SalaryService.getSalary(Integer.parseInt(SalaryId));
		return "prepup";
	}
	
	public String addPre() {
		list2 = employeeService.getAllEmployees();
		listTasks = projectTaskService.getAllProjectTasks();
		getRequest().put("list2", list2);
		getRequest().put("listTasks", listTasks);		
		return "addPre";
	}


	// 增加
	public String save() {
		SalaryService.addSalary(Salary);
		return "find";
	}

	// 修改
	public String update() {
		SalaryService.updateSalary(Salary);
		return "find";
	}
	

	public SalaryService getSalaryService() {
		return SalaryService;
	}

	public void setSalaryService(SalaryService SalaryService) {
		this.SalaryService = SalaryService;
	}

	public List<Salary> getList() {
		return list;
	}

	public void setList(List<Salary> list) {
		this.list = list;
	}

	public Salary getSalary() {
		return Salary;
	}

	public void setSalary(Salary Salary) {
		this.Salary = Salary;
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

	public List<Employee> getList2() {
		return list2;
	}

	public void setList2(List<Employee> list2) {
		this.list2 = list2;
	}

	public ProjectTaskService getProjectTaskService() {
		return projectTaskService;
	}

	public void setProjectTaskService(ProjectTaskService projectTaskService) {
		this.projectTaskService = projectTaskService;
	}

	public List<ProjectTask> getListTasks() {
		return listTasks;
	}

	public void setListTasks(List<ProjectTask> listTasks) {
		this.listTasks = listTasks;
	}

	

}
