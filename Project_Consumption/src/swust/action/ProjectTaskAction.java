package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import swust.model.Employee;
import swust.model.Project;
import swust.model.ProjectTask;
import swust.service.EmployeeService;
import swust.service.ProjectService;
import swust.service.ProjectTaskService;

public class ProjectTaskAction extends BaseAction {
	private ProjectTaskService projectTaskService;
	private ProjectService projectService;
	private EmployeeService employeeService;
	private List<ProjectTask> list;
	private List<Project> listProjects;
	private List<Employee> listEmployees;
	private Project project;
	private ProjectTask projectTask;
	private int id;
	private String proName;
	private String result;

	public String show() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String proId = reqeust.getParameter("proId");// 字符串
		list = projectTaskService.getProjectTask(Integer.parseInt(proId));
		listProjects = projectService.getAllProjects();
		listEmployees = employeeService.getAllEmployees();
		getRequest().put("listProjects", listProjects);
		getRequest().put("listEmployees", listEmployees);
		getRequest().put("proId", proId);
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String taskId = reqeust.getParameter("taskId");// 字符串
		projectTaskService.delProjectTask(Integer.parseInt(taskId));
		return "find";
	}
	
	public String getTask(){
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String empId = reqeust.getParameter("empId");// 字符串
		list = projectTaskService.getProjectTaskByEmp(Integer.parseInt(empId));
		JSONArray json = JSONArray.fromObject(list);
		result = json.toString();
		return "getTask";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String proId = reqeust.getParameter("proId");// 字符串
		list = projectTaskService.getProjectTask(Integer.parseInt(proId));
		return "prepup";
	}

	public String add() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String proId = reqeust.getParameter("proId");// 字符串
		list = projectTaskService.getProjectTask(Integer.parseInt(proId));
		listProjects = projectService.getAllProjects();
		listEmployees = employeeService.getAllEmployees();
		getRequest().put("listProjects", listProjects);
		getRequest().put("listEmployees", listEmployees);
		return "add";
	}

	// 增加
	public String save() {
		projectTaskService.addProjectTask(projectTask);
		return "find";
	}

	// 修改
	public String update() {
		projectTaskService.updateProjectTask(projectTask);
		return "find";
	}

	public ProjectTaskService getProjectTaskService() {
		return projectTaskService;
	}

	public void setProjectTaskService(ProjectTaskService projectTaskService) {
		this.projectTaskService = projectTaskService;
	}

	public List<ProjectTask> getList() {
		return list;
	}

	public void setList(List<ProjectTask> list) {
		this.list = list;
	}

	public ProjectTask getProjectTask() {
		return projectTask;
	}

	public void setProjectTask(ProjectTask projectTask) {
		this.projectTask = projectTask;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public ProjectService getProjectService() {
		return projectService;
	}

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	}

	public List<Project> getListProjects() {
		return listProjects;
	}

	public void setListProjects(List<Project> listProjects) {
		this.listProjects = listProjects;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public List<Employee> getListEmployees() {
		return listEmployees;
	}

	public void setListEmployees(List<Employee> listEmployees) {
		this.listEmployees = listEmployees;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
}
