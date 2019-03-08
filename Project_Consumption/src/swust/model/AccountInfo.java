package swust.model;

import java.util.Date;

public class AccountInfo {
	private int accountInfoId;
	private String infoName;
	private String infoNo;
	private String infoBank;
	private String infoAddress;
	private Date infoDate;
	private Employee employee;
	private String remark;
	private String accountStatus;

	public int getAccountInfoId() {
		return accountInfoId;
	}

	public void setAccountInfoId(int accountInfoId) {
		this.accountInfoId = accountInfoId;
	}

	public String getInfoName() {
		return infoName;
	}

	public void setInfoName(String infoName) {
		this.infoName = infoName;
	}

	public String getInfoNo() {
		return infoNo;
	}

	public void setInfoNo(String infoNo) {
		this.infoNo = infoNo;
	}

	public String getInfoBank() {
		return infoBank;
	}

	public void setInfoBank(String infoBank) {
		this.infoBank = infoBank;
	}

	public String getInfoAddress() {
		return infoAddress;
	}

	public void setInfoAddress(String infoAddress) {
		this.infoAddress = infoAddress;
	}

	public Date getInfoDate() {
		return infoDate;
	}

	public void setInfoDate(Date infoDate) {
		this.infoDate = infoDate;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

}
