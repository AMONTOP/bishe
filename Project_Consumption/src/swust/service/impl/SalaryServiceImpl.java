package swust.service.impl;

import java.util.List;

import swust.dao.SalaryDao;
import swust.model.Salary;
import swust.service.SalaryService;


public class SalaryServiceImpl implements SalaryService {
	private SalaryDao salaryDao;

	@Override
	public List<Salary> getAllSalarys() {
		List<Salary> salarys = salaryDao.getAllSalarys();
		return salarys;
	}
	
	public List<Salary> getSalaryByProId(Integer id){
		List<Salary> salaries = salaryDao.getSalaryByProId(id);
		return salaries;
	}

	@Override
	public void addSalary(Salary Salary) {
		salaryDao.addSalary(Salary);
	}

	@Override
	public void delSalary(Integer id) {
		salaryDao.delSalary(id);
	}

	@Override
	public void updateSalary(Salary Salary) {
		salaryDao.updateSalary(Salary);
	}

	@Override
	public Salary getSalary(Integer id) {
		return salaryDao.getSalary(id);
	}

	

	public SalaryDao getSalaryDao() {
		return salaryDao;
	}

	public void setSalaryDao(SalaryDao salaryDao) {
		this.salaryDao = salaryDao;
	}

	
	

}
