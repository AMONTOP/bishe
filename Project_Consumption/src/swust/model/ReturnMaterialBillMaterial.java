package swust.model;

public class ReturnMaterialBillMaterial {
    private Integer billMaterialId;
    private ReturnMaterialBill returnMaterialBill;
    private Material material;
    private Integer quantity;
    private String remark;
	public Integer getBillMaterialId() {
		return billMaterialId;
	}
	public void setBillMaterialId(Integer billMaterialId) {
		this.billMaterialId = billMaterialId;
	}
	
	public ReturnMaterialBill getReturnMaterialBill() {
		return returnMaterialBill;
	}
	public void setReturnMaterialBill(ReturnMaterialBill returnMaterialBill) {
		this.returnMaterialBill = returnMaterialBill;
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