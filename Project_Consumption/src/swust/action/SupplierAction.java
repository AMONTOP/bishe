package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.Supplier;
import swust.service.SupplierService;

public class SupplierAction {
	private SupplierService supplierService;
	private List<Supplier> list;
	private Supplier supplier;
	private int id;
	private String supplierName;
	public String show(){
		list=supplierService.getAllSuppliers();
		return "zhanshi";
	}
	public String delete(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String supplierId=reqeust.getParameter("supplierId");//字符串	
		supplierService.delSupplier(Integer.parseInt(supplierId));
		return "find";
	}
	public String prepup(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String supplierId=reqeust.getParameter("supplierId");//字符串	
		supplier=supplierService.getSupplier(Integer.parseInt(supplierId));
		return "prepup";
	}
	public String findbyName(){
		list=supplierService.getSupplierByName(supplier.getSupplierName());
		return "zhanshi";
	}
	//增加
	public String save(){
		System.out.println(supplier);
		supplierService.addSupplier(supplier);
		return "find";
	}
		 
	//修改
	public String update(){
		supplierService.updateSupplier(supplier);
		return "find";
	}
	public SupplierService getSupplierService() {
		return supplierService;
	}
	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}
	public List<Supplier> getList() {
		return list;
	}
	public void setList(List<Supplier> list) {
		this.list = list;
	}
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	
	
}
