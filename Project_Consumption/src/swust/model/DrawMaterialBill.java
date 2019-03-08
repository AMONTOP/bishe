package swust.model;

import java.util.Date;

public class DrawMaterialBill {

	private Integer drawbillId;
	private String billNo;
	/* 领料人 */
	private Employee employee;
	/* 仓库负责人 */
	private MwareHouse mwareHouse;
	private Date billTime;
	/* 领料原因（1生产领料，2研发领料） */
	private Integer drawReason;

	/* 领料单状态（1待审核，2已审核，3已完成） */
	private Integer billState;
	/* 备注 */
	private String remark;
	/* 审核时间 */
	private Date auditAt;
	/* 审核者 */
	private Integer auditBy;

	private OrderBill orderBill;

	public Integer getDrawbillId() {
		return drawbillId;
	}

	public void setDrawbillId(Integer drawbillId) {
		this.drawbillId = drawbillId;
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

	public Integer getDrawReason() {
		return drawReason;
	}

	public void setDrawReason(Integer drawReason) {
		this.drawReason = drawReason;
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

	public OrderBill getOrderBill() {
		return orderBill;
	}

	public void setOrderBill(OrderBill orderBill) {
		this.orderBill = orderBill;
	}

}