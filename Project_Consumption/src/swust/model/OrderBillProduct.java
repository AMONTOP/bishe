package swust.model;

public class OrderBillProduct {
	private Integer billProductId;
	private OrderBill orderBill;
	private Product product;
	private Integer quantity;
	private String remark;

	public Integer getBillProductId() {
		return billProductId;
	}

	public void setBillProductId(Integer billProductId) {
		this.billProductId = billProductId;
	}

	public OrderBill getOrderBill() {
		return orderBill;
	}

	public void setOrderBill(OrderBill orderBill) {
		this.orderBill = orderBill;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
