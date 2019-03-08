package swust.model;

public class MwareHouse {
	private int wareId;
	private String wareNo;
	private String wareCapacity;
	private Material material;
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

	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
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
