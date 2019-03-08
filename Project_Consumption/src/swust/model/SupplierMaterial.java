package swust.model;

import java.math.BigDecimal;

public class SupplierMaterial {

	private Integer supplierMaterialId;
	private Supplier supplier;
	private Material material;
	private BigDecimal price;
	private String remark;
	private Integer quantity;
	private Boolean state;

	public Integer getSupplierMaterialId() {
		return supplierMaterialId;
	}

	public void setSupplierMaterialId(Integer supplierMaterialId) {
		this.supplierMaterialId = supplierMaterialId;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Boolean getState() {
		return state;
	}

	public void setState(Boolean state) {
		this.state = state;
	}

}