package swust.model;

public class MwareHouseMaterial {
	private int wid;
	private MwareHouse mwareHouse;
	private Material material;
	private Integer quantity;
	private String remark;
	private Boolean flag;

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public MwareHouse getMwareHouse() {
		return mwareHouse;
	}

	public void setMwareHouse(MwareHouse mwareHouse) {
		this.mwareHouse = mwareHouse;
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

	public Boolean getFlag() {
		return flag;
	}

	public void setFlag(Boolean flag) {
		this.flag = flag;
	}

}
