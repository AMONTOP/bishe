package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.Employee;
import swust.model.OrderBill;
import swust.model.Project;
import swust.service.EmployeeService;
import swust.service.OrderBillService;
import swust.service.ProjectService;

public class ProjectAction extends BaseAction {
	private ProjectService projectService;
	private EmployeeService employeeService;
	private OrderBillService orderBillService;
	private List<Employee> listNames;
	private List<Project> list;
	private List<OrderBill> listOrderBills;
	private Project project;
	private int id;
	private String proName;

	public String show() {
		/*
		 * String roleString = (String) ActionContext.getContext().getSession()
		 * .get("role"); if (roleString.equals("业务管理员")) {
		 * JOptionPane.showMessageDialog(null,
		 * "亲爱的业务管理员，您没有操作该模块权限，您可以查看业务管理模块，如有需要请联系管理员", "标题【出错啦】",
		 * JOptionPane.ERROR_MESSAGE); return "fail"; } else { list =
		 * projectService.getAllProjects(); return "zhanshi"; }
		 */
		list = projectService.getAllProjects();
		return "zhanshi";

	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String proId = reqeust.getParameter("proId");// 字符串
		projectService.delProject(Integer.parseInt(proId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String proId = reqeust.getParameter("proId");// 字符串
		project = projectService.getProject(Integer.parseInt(proId));
		getRequest().put("listNames", employeeService.getAllEmployees());
		return "prepup";
	}

	public String addPre() {
		listNames = employeeService.getAllEmployees();
		listOrderBills = orderBillService.getOrderBillByBillState(3);
		getRequest().put("listNames", employeeService.getAllEmployees());
		getRequest().put("listOrderBills",
				orderBillService.getOrderBillByBillState(3));
		return "addPre";
	}

	public String findbyName() {
		list = projectService.getProjectByName(project.getProName());
		return "zhanshi";
	}

	public String findbyRemarkCB() {
		list = projectService.getProjectByRemark();
		return "zhanshi";
	}

	public String findbyRemarkSJ() {
		list = projectService.getProjectByRemarkSJ();
		return "zhanshi";
	}

	// 增加
	public String save() {
		System.out.println("save");
		projectService.addProject(project);
		return "find";
	}

	// 修改
	public String update() {
		projectService.updateProject(project);
		return "find";
	}

	public String updatePre() {
		projectService.updatePreProject(project);
		return "find";
	}

	public ProjectService getProjectService() {
		return projectService;
	}

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	}

	public List<Project> getList() {
		return list;
	}

	public void setList(List<Project> list) {
		this.list = list;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
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

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public List<Employee> getListNames() {
		return listNames;
	}

	public void setListNames(List<Employee> listNames) {
		this.listNames = listNames;
	}

	public OrderBillService getOrderBillService() {
		return orderBillService;
	}

	public void setOrderBillService(OrderBillService orderBillService) {
		this.orderBillService = orderBillService;
	}

}
