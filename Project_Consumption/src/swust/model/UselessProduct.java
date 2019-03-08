package swust.model;

public class UselessProduct {
	private int useId;
	private String useNo;
	private ProductInstockBill productInstockBill;
	private ProductCheck productCheck;
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

	public ProductInstockBill getProductInstockBill() {
		return productInstockBill;
	}

	public void setProductInstockBill(ProductInstockBill productInstockBill) {
		this.productInstockBill = productInstockBill;
	}

	public ProductCheck getProductCheck() {
		return productCheck;
	}

	public void setProductCheck(ProductCheck productCheck) {
		this.productCheck = productCheck;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
