package swust.dao;

import java.util.List;

import swust.model.EmployeeRole;

public interface EmployeeRoleDao {
	// 查询所有
	public List<EmployeeRole> getAllEmployeeRoles();

	// 添加用户
	public void addEmployeeRole(EmployeeRole employeeRole);

	// 删除用户
	public void delEmployeeRole(Integer id);

	// 修改用户
	public void updateEmployeeRole(EmployeeRole employeeRole);

	// 单个查询
	public EmployeeRole getEmployeeRole(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<EmployeeRole> getEmployeeRoleByName(String name);
}
