package swust.service;

import java.util.List;

import swust.model.EmployeePermission;

public interface EmployeePermissionService {
	// 查询所有
	public List<EmployeePermission> getAllEmployeePermissions();

	// 添加用户
	public void addEmployeePermission(EmployeePermission employeePermission);

	// 删除用户
	public void delEmployeePermission(Integer id);

	// 修改用户
	public void updateEmployeePermission(EmployeePermission employeePermission);

	// 单个查询
	public EmployeePermission getEmployeePermission(Integer id);

	public List<EmployeePermission> getEmployeePermissionByRole(Integer roleId);
}
