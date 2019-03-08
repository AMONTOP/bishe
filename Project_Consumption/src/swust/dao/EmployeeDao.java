package swust.dao;

import java.util.List;

import swust.model.Employee;

public interface EmployeeDao {
	// 查询所有
	public List<Employee> getAllEmployees();

	// 添加用户
	public void addEmployee(Employee employee);

	// 删除用户
	public void delEmployee(Integer id);

	// 修改用户
	public void updateEmployee(Employee employee);

	// 单个查询
	public Employee getEmployee(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<Employee> getEmployeeByName(String name);

	public Employee getByUsernameAndPassword(Employee employee);

}
