package swust.model;

import java.math.BigDecimal;
import java.util.Date;

public class OrderBill {
	private Integer billId;
	private String billNo;
	// 销售人员（制单人员ID）
	private Employee employee;
	private Client client;
	private Date billTime;
	private BigDecimal billAmount;
	// 订单状态（1待审核，2已审核，3生产中，4已发货，5已取消）
	private Integer billState;
	private String remark;
	/* 审核时间 */
	private Date auditAt;
	/* 审核者 */
	private Integer auditBy;
	/* 发货时间 */
	private Date deliveryAt;

	/* 发货者 */
	// private Integer deliveryBy;

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

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Date getBillTime() {
		return billTime;
	}

	public void setBillTime(Date billTime) {
		this.billTime = billTime;
	}

	public BigDecimal getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(BigDecimal billAmount) {
		this.billAmount = billAmount;
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

	public Date getDeliveryAt() {
		return deliveryAt;
	}

	public void setDeliveryAt(Date deliveryAt) {
		this.deliveryAt = deliveryAt;
	}

	/*
	 * public Integer getDeliveryBy() { return deliveryBy; }
	 * 
	 * public void setDeliveryBy(Integer deliveryBy) { this.deliveryBy =
	 * deliveryBy; }
	 */

}