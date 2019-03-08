package swust.model;

public class EmployeeRole {
	private int employeeRoleId;
	private Employee employee;
	private Role role;
	public int getEmployeeRoleId() {
		return employeeRoleId;
	}
	public void setEmployeeRoleId(int employeeRoleId) {
		this.employeeRoleId = employeeRoleId;
	}
	
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
}
