package swust.model;

public class UselessMaterial {
	private int useId;
	private String useNo;
	private MaterialInstockBill materialInstockBill;
	private MaterialCheck materialCheck;
	private String remark;

	public int getUseId() {
		return useId;
	}

	public void setUseId(int useId) {
		this.useId = useId;
	}

	public String getUseNo() {
		return useNo;
	}

	public void setUseNo(String useNo) {
		this.useNo = useNo;
	}

	public MaterialInstockBill getMaterialInstockBill() {
		return materialInstockBill;
	}

	public void setMaterialInstockBill(MaterialInstockBill materialInstockBill) {
		this.materialInstockBill = materialInstockBill;
	}

	public MaterialCheck getMaterialCheck() {
		return materialCheck;
	}

	public void setMaterialCheck(MaterialCheck materialCheck) {
		this.materialCheck = materialCheck;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
