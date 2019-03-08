package swust.service;

import java.util.List;

import swust.model.Salary;

public interface SalaryService {
	// 查询所有
	public List<Salary> getAllSalarys();

	// 添加用户
	public void addSalary(Salary Salary);

	// 删除用户
	public void delSalary(Integer id);

	// 修改用户
	public void updateSalary(Salary Salary);

	// 单个查询
	public Salary getSalary(Integer id);
	
	public List<Salary> getSalaryByProId(Integer id);

}
