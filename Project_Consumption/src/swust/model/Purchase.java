package swust.model;

public class Purchase {
	private int purId;
	private String purNo;
	private String purState;
	private MwareHouseMaterial mwareHouseMaterial;
	private Employee employee;
	private int quantity;
	private String remark;

	public int getPurId() {
		return purId;
	}

	public void setPurId(int purId) {
		this.purId = purId;
	}

	public String getPurNo() {
		return purNo;
	}

	public void setPurNo(String purNo) {
		this.purNo = purNo;
	}

	public String getPurState() {
		return purState;
	}

	public void setPurState(String purState) {
		this.purState = purState;
	}

	public MwareHouseMaterial getMwareHouseMaterial() {
		return mwareHouseMaterial;
	}

	public void setMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		this.mwareHouseMaterial = mwareHouseMaterial;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
