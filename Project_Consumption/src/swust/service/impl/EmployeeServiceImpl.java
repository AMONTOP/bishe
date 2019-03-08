package swust.service.impl;

import java.util.List;

import swust.dao.EmployeeDao;
import swust.dao.EmployeeRoleDao;
import swust.model.Employee;
import swust.service.EmployeeService;

public class EmployeeServiceImpl implements EmployeeService {
	private EmployeeDao employeeDao;
	private EmployeeRoleDao employeeRoleDao;

	public Employee login(Employee employee) {
		Employee session_employee = employeeDao
				.getByUsernameAndPassword(employee);
		if (session_employee != null) {
			return session_employee;
		} else {
			return null;
			// throw new EmployeeException("登录失败！");
		}
	}

	@Override
	public List<Employee> getAllEmployees() {
		List<Employee> employees = employeeDao.getAllEmployees();
		return employees;
	}

	@Override
	public void addEmployee(Employee employee) {
		employeeDao.addEmployee(employee);
	}

	@Override
	public void delEmployee(Integer id) {
		employeeDao.delEmployee(id);
	}

	@Override
	public void updateEmployee(Employee employee) {
		employeeDao.updateEmployee(employee);
	}

	@Override
	public Employee getEmployee(Integer id) {
		return employeeDao.getEmployee(id);
	}

	@Override
	public List<Employee> getEmployeeByName(String name) {
		return employeeDao.getEmployeeByName(name);
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
