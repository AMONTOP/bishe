package swust.model;

public class WareHouse {
	private int wareId;
	private String wareNo;
	private String wareCapacity;
	private Product product;
	private Employee employee;
	private String address;

	public int getWareId() {
		return wareId;
	}

	public void setWareId(int wareId) {
		this.wareId = wareId;
	}

	public String getWareNo() {
		return wareNo;
	}

	public void setWareNo(String wareNo) {
		this.wareNo = wareNo;
	}

	public String getWareCapacity() {
		return wareCapacity;
	}

	public void setWareCapacity(String wareCapacity) {
		this.wareCapacity = wareCapacity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
