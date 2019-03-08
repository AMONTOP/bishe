package swust.model;

public class DrawMaterialBillMaterial {
    private Integer billMaterialId;
    private DrawMaterialBill drawMaterialBill;
    private Material material;
    private Integer quantity;
    private String remark;
	public Integer getBillMaterialId() {
		return billMaterialId;
	}
	public void setBillMaterialId(Integer billMaterialId) {
		this.billMaterialId = billMaterialId;
	}
	public DrawMaterialBill getDrawMaterialBill() {
		return drawMaterialBill;
	}
	public void setDrawMaterialBill(DrawMaterialBill drawMaterialBill) {
		this.drawMaterialBill = drawMaterialBill;
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