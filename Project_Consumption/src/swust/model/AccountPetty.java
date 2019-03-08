package swust.model;

import java.math.BigDecimal;
import java.util.Date;

public class AccountPetty {
	private int accountPettyId;
	private Employee employee;
	private Project project;
	private String pettyNo;
	private String pettyDept;
	private BigDecimal pettyMoney;
	private Date useDate;
	private String remark;
	private String pettyStatus;

	public int getAccountPettyId() {
		return accountPettyId;
	}

	public void setAccountPettyId(int accountPettyId) {
		this.accountPettyId = accountPettyId;
	}

	public String getPettyNo() {
		return pettyNo;
	}

	public void setPettyNo(String pettyNo) {
		this.pettyNo = pettyNo;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getPettyDept() {
		return pettyDept;
	}

	public void setPettyDept(String pettyDept) {
		this.pettyDept = pettyDept;
	}

	public BigDecimal getPettyMoney() {
		return pettyMoney;
	}

	public void setPettyMoney(BigDecimal pettyMoney) {
		this.pettyMoney = pettyMoney;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Date getUseDate() {
		return useDate;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getPettyStatus() {
		return pettyStatus;
	}

	public void setPettyStatus(String pettyStatus) {
		this.pettyStatus = pettyStatus;
	}

}
