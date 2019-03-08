package swust.model;

import java.math.BigDecimal;
import java.util.Date;

public class AccountRepay {
	private int repayId;
	private Project project;
	private Supplier supplier;
	private AccountInfo accountInfo;
	private Employee employee;
	private String repayNo;
	private Date repayDate;
	private String repayDept;
	private BigDecimal repayMoney;
	private String repayItem;
	private String remark;
	private String repayStatus;

	public int getRepayId() {
		return repayId;
	}

	public void setRepayId(int repayId) {
		this.repayId = repayId;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public AccountInfo getAccountInfo() {
		return accountInfo;
	}

	public void setAccountInfo(AccountInfo accountInfo) {
		this.accountInfo = accountInfo;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getRepayNo() {
		return repayNo;
	}

	public void setRepayNo(String repayNo) {
		this.repayNo = repayNo;
	}

	public Date getRepayDate() {
		return repayDate;
	}

	public void setRepayDate(Date repayDate) {
		this.repayDate = repayDate;
	}

	public String getRepayDept() {
		return repayDept;
	}

	public void setRepayDept(String repayDept) {
		this.repayDept = repayDept;
	}

	public BigDecimal getRepayMoney() {
		return repayMoney;
	}

	public void setRepayMoney(BigDecimal repayMoney) {
		this.repayMoney = repayMoney;
	}

	public String getRepayItem() {
		return repayItem;
	}

	public void setRepayItem(String repayItem) {
		this.repayItem = repayItem;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRepayStatus() {
		return repayStatus;
	}

	public void setRepayStatus(String repayStatus) {
		this.repayStatus = repayStatus;
	}

}
