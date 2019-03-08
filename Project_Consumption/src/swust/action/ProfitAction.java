package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.OrderBillProduct;
import swust.model.Profit;
import swust.model.Salary;
import swust.service.OrderBillProductService;
import swust.service.ProfitService;
import swust.service.ProjectTaskService;
import swust.service.SalaryService;

public class ProfitAction extends BaseAction{
	private ProfitService profitService;
	private SalaryService salaryService;
	private OrderBillProductService orderBillProductService;
	private ProjectTaskService projectTaskService;
	private List<Profit> list;
	private List<Salary> list2;
	private List<OrderBillProduct> list3;
	
	private Profit profit;
	private int id;

	public String myselect(){
		return "myselect";
	}
	public String show() {
		list3 = orderBillProductService.getByBillId(36);
		//bug:更改id为动态 httpservlet
		list2 = salaryService.getSalaryByProId(22);
		/*list = profitService.getAllProfits();*/
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String pid = reqeust.getParameter("pid");// 字符串
		profitService.delProfit(Integer.parseInt(pid));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String pid = reqeust.getParameter("pid");// 字符串
		profit = profitService.getProfit(Integer.parseInt(pid));
		return "prepup";
	}


	// 增加
	public String save() {
		profitService.addProfit(profit);
		return "find";
	}

	// 修改
	public String update() {
		profitService.updateProfit(profit);
		return "find";
	}

	public ProfitService getProfitService() {
		return profitService;
	}

	public void setProfitService(ProfitService profitService) {
		this.profitService = profitService;
	}

	public List<Profit> getList() {
		return list;
	}

	public void setList(List<Profit> list) {
		this.list = list;
	}

	public Profit getProfit() {
		return profit;
	}

	public void setProfit(Profit profit) {
		this.profit = profit;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SalaryService getSalaryService() {
		return salaryService;
	}

	public void setSalaryService(SalaryService salaryService) {
		this.salaryService = salaryService;
	}

	public List<Salary> getList2() {
		return list2;
	}

	public void setList2(List<Salary> list2) {
		this.list2 = list2;
	}

	public OrderBillProductService getOrderBillProductService() {
		return orderBillProductService;
	}

	public void setOrderBillProductService(
			OrderBillProductService orderBillProductService) {
		this.orderBillProductService = orderBillProductService;
	}

	public List<OrderBillProduct> getList3() {
		return list3;
	}

	public void setList3(List<OrderBillProduct> list3) {
		this.list3 = list3;
	}

}
