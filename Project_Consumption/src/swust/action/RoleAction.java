package swust.action;

import java.util.List;

import swust.model.EmployeePermission;
import swust.model.Role;
import swust.service.EmployeePermissionService;
import swust.service.RoleService;

public class RoleAction extends BaseAction {
	private RoleService roleService;
	private List<Role> list;
	private Role role;
	private int id;
	private EmployeePermissionService employeePermissionService;

	private List<EmployeePermission> list2;

	public String show() {
		list = roleService.getAllRoles();
		return "addPre";
	}

	public String prepup() {
		list2 = employeePermissionService.getAllEmployeePermissions();
		getRequest().put("list", roleService.getAllRoles());
		return "prepup";
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public List<Role> getList() {
		return list;
	}

	public void setList(List<Role> list) {
		this.list = list;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public EmployeePermissionService getEmployeePermissionService() {
		return employeePermissionService;
	}

	public void setEmployeePermissionService(
			EmployeePermissionService employeePermissionService) {
		this.employeePermissionService = employeePermissionService;
	}

	public List<EmployeePermission> getList2() {
		return list2;
	}

	public void setList2(List<EmployeePermission> list2) {
		this.list2 = list2;
	}

}
