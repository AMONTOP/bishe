package swust.model;

public class ProductInstockBillProduct {

	private Integer billProductId;
	private ProductInstockBill productInstockBill;
	private Product product;
	private Integer quantity;
	private Integer principal;
	private String place;
	private String remark;

	public Integer getBillProductId() {
		return billProductId;
	}

	public void setBillProductId(Integer billProductId) {
		this.billProductId = billProductId;
	}

	public ProductInstockBill getProductInstockBill() {
		return productInstockBill;
	}

	public void setProductInstockBill(ProductInstockBill productInstockBill) {
		this.productInstockBill = productInstockBill;
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

	public Integer getPrincipal() {
		return principal;
	}

	public void setPrincipal(Integer principal) {
		this.principal = principal;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}