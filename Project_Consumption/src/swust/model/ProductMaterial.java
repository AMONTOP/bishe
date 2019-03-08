package swust.model;

public class ProductMaterial {
	
    private Integer productMaterialId;
    private Product product;
    private Material material;
    private Integer quantity;
    private String remark;
    
	public Integer getProductMaterialId() {
		return productMaterialId;
	}
	public void setProductMaterialId(Integer productMaterialId) {
		this.productMaterialId = productMaterialId;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
