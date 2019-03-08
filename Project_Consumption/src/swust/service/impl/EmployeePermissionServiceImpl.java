package swust.service.impl;

import java.util.List;

import swust.dao.EmployeePermissionDao;
import swust.model.EmployeePermission;
import swust.service.EmployeePermissionService;

public class EmployeePermissionServiceImpl implements EmployeePermissionService {
	private EmployeePermissionDao employeePermissionDao;

	@Override
	public List<EmployeePermission> getAllEmployeePermissions() {
		List<EmployeePermission> employeePermissions = employeePermissionDao
				.getAllEmployeePermissions();
		return employeePermissions;
	}

	@Override
	public void addEmployeePermission(EmployeePermission employeePermission) {
		employeePermissionDao.addEmployeePermission(employeePermission);

	}

	@Override
	public void delEmployeePermission(Integer id) {
		employeePermissionDao.delEmployeePermission(id);
	}

	@Override
	public void updateEmployeePermission(EmployeePermission employeePermission) {
		employeePermissionDao.updateEmployeePermission(employeePermission);
	}

	@Override
	public EmployeePermission getEmployeePermission(Integer id) {
		return employeePermissionDao.getEmployeePermission(id);
	}

	public EmployeePermissionDao getEmployeePermissionDao() {
		return employeePermissionDao;
	}

	public void setEmployeePermissionDao(
			EmployeePermissionDao employeePermissionDao) {
		this.employeePermissionDao = employeePermissionDao;
	}

	@Override
	public List<EmployeePermission> getEmployeePermissionByRole(Integer roleId) {
		List<EmployeePermission> employeePermissions = employeePermissionDao
				.getEmployeePermissionByRole(roleId);
		return employeePermissions;
	}

}
