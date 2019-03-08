package swust.model;

import java.util.Date;

public class ProductCheck {
	private int productCheckId;
	private String checkNo;
	private Product product;
	private String checkItem;
	private int checkNumber;
	private Date cdate;
	private Employee employee;
	private String result;
	private String note;
	private Double qualify;
	private WareHouseProduct wareHouseProduct;
	private ProductInstockBill productInstockBill;
	private Boolean state;
	private Boolean checkState;

	public int getProductCheckId() {
		return productCheckId;
	}

	public void setProductCheckId(int productCheckId) {
		this.productCheckId = productCheckId;
	}

	public String getCheckNo() {
		return checkNo;
	}

	public void setCheckNo(String checkNo) {
		this.checkNo = checkNo;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getCheckItem() {
		return checkItem;
	}

	public void setCheckItem(String checkItem) {
		this.checkItem = checkItem;
	}

	public int getCheckNumber() {
		return checkNumber;
	}

	public void setCheckNumber(int checkNumber) {
		this.checkNumber = checkNumber;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Double getQualify() {
		return qualify;
	}

	public void setQualify(Double qualify) {
		this.qualify = qualify;
	}

	public WareHouseProduct getWareHouseProduct() {
		return wareHouseProduct;
	}

	public void setWareHouseProduct(WareHouseProduct wareHouseProduct) {
		this.wareHouseProduct = wareHouseProduct;
	}

	public Boolean getState() {
		return state;
	}

	public void setState(Boolean state) {
		this.state = state;
	}

	public Boolean getCheckState() {
		return checkState;
	}

	public void setCheckState(Boolean checkState) {
		this.checkState = checkState;
	}

	public ProductInstockBill getProductInstockBill() {
		return productInstockBill;
	}

	public void setProductInstockBill(ProductInstockBill productInstockBill) {
		this.productInstockBill = productInstockBill;
	}

}
