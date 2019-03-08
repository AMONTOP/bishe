package swust.model;

public class Profit {
	private int pid;
	private OrderBillProduct orderBillProduct;
	private ProjectTask projectTask;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public OrderBillProduct getOrderBillProduct() {
		return orderBillProduct;
	}
	public void setOrderBillProduct(OrderBillProduct orderBillProduct) {
		this.orderBillProduct = orderBillProduct;
	}
	public ProjectTask getProjectTask() {
		return projectTask;
	}
	public void setProjectTask(ProjectTask projectTask) {
		this.projectTask = projectTask;
	}
	
	
}
