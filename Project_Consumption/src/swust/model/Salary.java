package swust.model;

public class Salary {
	private int sid;
	private Employee employee;
	private int workDate;
	private int money;
	private ProjectTask projectTask;
	private String salaryState;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public int getWorkDate() {
		return workDate;
	}
	public void setWorkDate(int workDate) {
		this.workDate = workDate;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public ProjectTask getProjectTask() {
		return projectTask;
	}
	public void setProjectTask(ProjectTask projectTask) {
		this.projectTask = projectTask;
	}
	public String getSalaryState() {
		return salaryState;
	}
	public void setSalaryState(String salaryState) {
		this.salaryState = salaryState;
	}
	
	
	
}
