package swust.action;

import java.io.File;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import swust.exception.ConsumerException;
import swust.model.Employee;
import swust.model.EmployeeRole;
import swust.service.EmployeeRoleService;
import swust.service.EmployeeService;
import swust.service.ProjectService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class EmployeeAction extends BaseAction implements ModelDriven<Employee> {
	private EmployeeService employeeService;
	private EmployeeRoleService employeeRoleService;
	private ProjectService projectService;
	private List<Employee> list;
	private Employee employee;
	private int id;
	private String name;
	private String verifyCode;
	private String[] selectedRow;
	private File employeeExcel;
	private String employeeExcelContentType;
	private String employeeExcelFileName;

	public String login() {
		Employee session_employee = null;
		EmployeeRole employeeRole = null;
		try {
			session_employee = employeeService.login(employee);
			if (session_employee == null) {
				getRequest().put("codeError", "用户名或密码错误");
				return "fail";
			} else if (!getSession().get("verifyCode").equals(verifyCode)) {
				// JOptionPane.showConfirmDialog(null, "验证码错误！请重新输入");
				getRequest().put("codeError", "验证码错误");
				return "fail";
				// throw new EmployeeException("验证码错误！");
			} else {
				getRequest().put("codeError", "登陆成功！");
				/*
				 * employeeRole = employeeRoleService
				 * .getEmployeeRole(session_employee.getEmpId());
				 */
				employee = employeeService.getEmployee(session_employee
						.getEmpId());
				/*
				 * getRequest().put("userRole",
				 * employeeRole.getRole().getRoleName());
				 */
				getRequest().put("userRole", employee.getRole().getRoleName());
				getRequest().put("roleId", employee.getRole().getRoleId());
				ActionContext.getContext().getSession()
						.put("myRole", employee.getRole().getRoleName());
				/*
				 * getRequest().put("roleId",
				 * employeeRole.getRole().getRoleId());
				 * ActionContext.getContext().getSession() .put("role",
				 * employeeRole.getRole().getRoleName());
				 */
				// getSession().put("name", session_employee.getName());
				ActionContext.getContext().getSession()
						.put("name", session_employee.getName());
				getRequest().put("userName", session_employee.getUserName());
				ActionContext.getContext().getSession()
						.put("empId", session_employee.getEmpId());
				getSession().put("session_employee", session_employee);
				getRequest()
						.put("listProject", projectService.getAllProjects());
				return "indexpage";
			}
		} catch (ConsumerException e) {
			getRequest().put("employee", employee);
			getRequest().put("msg", e.getMessage());
			return "loginInput";
		}
	}

	public String indexPage() {
		return "indexpage";
	}

	public String logout() {
		ActionContext.getContext().getSession().remove("name");
		return "logout";
	}

	public String show() {
		list = employeeService.getAllEmployees();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String empId = reqeust.getParameter("empId");// 字符串
		employeeService.delEmployee(Integer.parseInt(empId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String empId = reqeust.getParameter("empId");// 字符串
		// Employee=EmployeeService.getEmployee(Integer.parseInt(empId));
		employee = employeeService.getEmployee(Integer.parseInt(empId));
		return "prepup";
	}

	public String findbyName() {
		list = employeeService.getEmployeeByName(employee.getName());
		return "zhanshi";
	}

	// 增加
	public String save() {
		employeeService.addEmployee(employee);
		return "find";
	}

	// 修改
	public String update() {
		employeeService.updateEmployee(employee);
		return "find";
	}

	// 导出excel
	public void export2Excel() {
		try {
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			HSSFRow row_title = sheet.createRow(0);
			HSSFCell cell_title1 = row_title.createCell(0);
			HSSFCell cell_title2 = row_title.createCell(1);
			HSSFCell cell_title3 = row_title.createCell(2);
			HSSFCell cell_title4 = row_title.createCell(3);
			HSSFCell cell_title5 = row_title.createCell(4);
			cell_title1.setCellValue("用户名");
			cell_title2.setCellValue("真实姓名");
			cell_title3.setCellValue("性别");
			cell_title4.setCellValue("手机号");
			cell_title5.setCellValue("邮箱");

			// List<Product> employees = employeeService.getAllProducts();
			for (int i = 0; i < selectedRow.length; i++) {
				// int a = selectedRow[
				Employee employee = employeeService.getEmployee(Integer
						.parseInt(selectedRow[i]));
				HSSFRow row = sheet.createRow(i + 1);
				HSSFCell cell1 = row.createCell(0);
				HSSFCell cell2 = row.createCell(1);
				HSSFCell cell3 = row.createCell(2);
				HSSFCell cell4 = row.createCell(3);
				HSSFCell cell5 = row.createCell(4);
				cell1.setCellValue(employee.getUserName());
				cell2.setCellValue(employee.getName());
				if (employee.getSex() == 1) {
					String sex = "女";
					cell3.setCellValue(sex);
				} else {
					String sex = "男";
					cell3.setCellValue(sex);
				}

				cell4.setCellValue(employee.getMobile());
				cell5.setCellValue(employee.getEmail());
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			// 把响应头数据类型设置为任意二进制流，用于上传下载
			response.setContentType("application/octet-stream");
			// 告诉浏览器通过下载方式打开，并设置下载文件名
			response.setHeader("Content-Disposition", "attachment;fileName="//
					+ new String("员工信息.xls".getBytes(), "ISO8859-1"));
			ServletOutputStream sos = response.getOutputStream();
			workbook.write(sos);
			if (sos != null) {
				sos.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Employee getModel() {
		employee = new Employee();
		return employee;
	}

	public EmployeeRoleService getEmployeeRoleService() {
		return employeeRoleService;
	}

	public void setEmployeeRoleService(EmployeeRoleService employeeRoleService) {
		this.employeeRoleService = employeeRoleService;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public List<Employee> getList() {
		return list;
	}

	public void setList(List<Employee> list) {
		this.list = list;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
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

	public String[] getSelectedRow() {
		return selectedRow;
	}

	public void setSelectedRow(String[] selectedRow) {
		this.selectedRow = selectedRow;
	}

	public File getProductExcel() {
		return employeeExcel;
	}

	public void setProductExcel(File employeeExcel) {
		this.employeeExcel = employeeExcel;
	}

	public String getProductExcelContentType() {
		return employeeExcelContentType;
	}

	public void setProductExcelContentType(String employeeExcelContentType) {
		this.employeeExcelContentType = employeeExcelContentType;
	}

	public String getProductExcelFileName() {
		return employeeExcelFileName;
	}

	public void setProductExcelFileName(String employeeExcelFileName) {
		this.employeeExcelFileName = employeeExcelFileName;
	}

	public ProjectService getProjectService() {
		return projectService;
	}

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	}

}
