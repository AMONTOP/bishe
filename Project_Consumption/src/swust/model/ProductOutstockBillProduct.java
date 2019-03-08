package swust.model;

public class ProductOutstockBillProduct {
    private Integer billProductId;
    private ProductOutstockBill productOutstockBill;
    private Product product;
    private Integer quantity;
    private Integer principal;
    private Integer warehouse;
    private String place;
    private String remark;
	public Integer getBillProductId() {
		return billProductId;
	}
	public void setBillProductId(Integer billProductId) {
		this.billProductId = billProductId;
	}
	public ProductOutstockBill getProductOutstockBill() {
		return productOutstockBill;
	}
	public void setProductOutstockBill(ProductOutstockBill productOutstockBill) {
		this.productOutstockBill = productOutstockBill;
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
	public Integer getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(Integer warehouse) {
		this.warehouse = warehouse;
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