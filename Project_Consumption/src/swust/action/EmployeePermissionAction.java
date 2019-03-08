package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.EmployeePermission;
import swust.service.EmployeePermissionService;

import com.opensymphony.xwork2.ActionSupport;

public class EmployeePermissionAction extends ActionSupport {
	private EmployeePermissionService employeePermissionService;
	// private PermissionService permissionService;
	private List<EmployeePermission> list;

	// private List<Permission> list2;
	private EmployeePermission employeePermission;

	// private int id;

	public String show() {
		list = employeePermissionService.getAllEmployeePermissions();
		return "zhanshi";
	}

	public String findById() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String roleId = request.getParameter("roleId");// 字符串
		list = employeePermissionService.getEmployeePermissionByRole(Integer
				.parseInt(roleId));
		request.setAttribute("list", list);
		return "success";
	}

	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		employeePermissionService.delEmployeePermission(Integer.parseInt(id));
		return "zhanshi";
	}

	public String save() {
		list = employeePermissionService.getAllEmployeePermissions();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getPermission().getPermissionId() == employeePermission
					.getPermission().getPermissionId()
					&& list.get(i).getRole().getRoleId() == employeePermission
							.getRole().getRoleId()) {
				throw new RuntimeException();
			}
		}

		employeePermissionService.addEmployeePermission(employeePermission);
		return "zhanshi";
	}

	public EmployeePermissionService getEmployeePermissionService() {
		return employeePermissionService;
	}

	public void setEmployeePermissionService(
			EmployeePermissionService employeePermissionService) {
		this.employeePermissionService = employeePermissionService;
	}

	public List<EmployeePermission> getList() {
		return list;
	}

	public void setList(List<EmployeePermission> list) {
		this.list = list;
	}

	public EmployeePermission getEmployeePermission() {
		return employeePermission;
	}

	public void setEmployeePermission(EmployeePermission employeePermission) {
		this.employeePermission = employeePermission;
	}

}
