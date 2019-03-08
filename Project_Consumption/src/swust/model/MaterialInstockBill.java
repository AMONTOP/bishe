package swust.model;

import java.util.Date;

public class MaterialInstockBill {

	private Integer billId;
	private String billNo;
	private Employee employee;
	/* 仓库负责人 */
	private MwareHouse mwareHouse;
	private Date billTime;
	private Integer materialSource;
	private Integer billState;
	private String remark;
	private Date auditAt;
	private Integer auditBy;
	private Material material;
	private Integer quantity;
	private Boolean flag;
	private Purchase purchase;

	public Integer getBillId() {
		return billId;
	}

	public void setBillId(Integer billId) {
		this.billId = billId;
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public MwareHouse getMwareHouse() {
		return mwareHouse;
	}

	public void setMwareHouse(MwareHouse mwareHouse) {
		this.mwareHouse = mwareHouse;
	}

	public Date getBillTime() {
		return billTime;
	}

	public void setBillTime(Date billTime) {
		this.billTime = billTime;
	}

	public Integer getMaterialSource() {
		return materialSource;
	}

	public void setMaterialSource(Integer materialSource) {
		this.materialSource = materialSource;
	}

	public Integer getBillState() {
		return billState;
	}

	public void setBillState(Integer billState) {
		this.billState = billState;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getAuditAt() {
		return auditAt;
	}

	public void setAuditAt(Date auditAt) {
		this.auditAt = auditAt;
	}

	public Integer getAuditBy() {
		return auditBy;
	}

	public void setAuditBy(Integer auditBy) {
		this.auditBy = auditBy;
	}

	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Boolean getFlag() {
		return flag;
	}

	public void setFlag(Boolean flag) {
		this.flag = flag;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

}