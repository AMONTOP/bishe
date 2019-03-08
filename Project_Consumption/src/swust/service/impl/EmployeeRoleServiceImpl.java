package swust.service.impl;

import java.util.List;

import swust.dao.EmployeeDao;
import swust.dao.EmployeeRoleDao;
import swust.model.EmployeeRole;
import swust.service.EmployeeRoleService;

public class EmployeeRoleServiceImpl implements EmployeeRoleService {
	private EmployeeDao employeeDao;
	private EmployeeRoleDao employeeRoleDao;

	@Override
	public List<EmployeeRole> getAllEmployeeRoles() {
		List<EmployeeRole> employeeRoles = employeeRoleDao
				.getAllEmployeeRoles();
		return employeeRoles;
	}

	@Override
	public void addEmployeeRole(EmployeeRole employeeRole) {
		employeeRoleDao.addEmployeeRole(employeeRole);

	}

	@Override
	public void delEmployeeRole(Integer id) {
		employeeRoleDao.delEmployeeRole(id);

	}

	@Override
	public void updateEmployeeRole(EmployeeRole employeeRole) {
		employeeRoleDao.updateEmployeeRole(employeeRole);

	}

	@Override
	public EmployeeRole getEmployeeRole(Integer id) {
		return employeeRoleDao.getEmployeeRole(id);
	}

	@Override
	public List<EmployeeRole> getEmployeeRoleByName(String name) {
		return employeeRoleDao.getEmployeeRoleByName(name);
	}

	public EmployeeDao getEmployeeDao() {
		return employeeDao;
	}

	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	public EmployeeRoleDao getEmployeeRoleDao() {
		return employeeRoleDao;
	}

	public void setEmployeeRoleDao(EmployeeRoleDao employeeRoleDao) {
		this.employeeRoleDao = employeeRoleDao;
	}

}
