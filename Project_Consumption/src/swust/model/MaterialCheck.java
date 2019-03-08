package swust.model;

import java.util.Date;

public class MaterialCheck {
	private int materialCheckId;
	private String checkNo;
	private Material material;
	private String checkItem;
	private int checkNumber;
	private Date cdate;
	private Employee employee;
	private String result;
	private String note;
	private Double qualify;
	private MwareHouseMaterial mwareHouseMaterial;
	private MaterialInstockBill materialInstockBill;
	private Boolean state;
	private Boolean checkState;

	public int getMaterialCheckId() {
		return materialCheckId;
	}

	public void setMaterialCheckId(int materialCheckId) {
		this.materialCheckId = materialCheckId;
	}

	public String getCheckNo() {
		return checkNo;
	}

	public void setCheckNo(String checkNo) {
		this.checkNo = checkNo;
	}

	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}

	public String getCheckItem() {
		return checkItem;
	}

	public void setCheckItem(String checkItem) {
		this.checkItem = checkItem;
	}

	public int getCheckNumber() {
		return checkNumber;
	}

	public void setCheckNumber(int checkNumber) {
		this.checkNumber = checkNumber;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Double getQualify() {
		return qualify;
	}

	public void setQualify(Double qualify) {
		this.qualify = qualify;
	}

	public MwareHouseMaterial getMwareHouseMaterial() {
		return mwareHouseMaterial;
	}

	public void setMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		this.mwareHouseMaterial = mwareHouseMaterial;
	}

	public Boolean getState() {
		return state;
	}

	public void setState(Boolean state) {
		this.state = state;
	}

	public MaterialInstockBill getMaterialInstockBill() {
		return materialInstockBill;
	}

	public void setMaterialInstockBill(MaterialInstockBill materialInstockBill) {
		this.materialInstockBill = materialInstockBill;
	}

	public Boolean getCheckState() {
		return checkState;
	}

	public void setCheckState(Boolean checkState) {
		this.checkState = checkState;
	}

}
