package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.Supplier;
import swust.model.SupplierMaterial;
import swust.model.Material;
import swust.service.SupplierMaterialService;
import swust.service.SupplierService;
import swust.service.MaterialService;

public class SupplierMaterialAction extends BaseAction {
	private SupplierMaterialService supplierMaterialService;
	private SupplierService supplierService;
	private MaterialService materialService;
	private List<Supplier> listSuppliers;
	private List<Material> listMaterials;
	private List<SupplierMaterial> listSupplierMaterials;
	private SupplierMaterial supplierMaterial;
	private int id;
	public String show(){
		listSupplierMaterials=supplierMaterialService.getAllSupplierMaterials();
		return "zhanshi";
	}
	public String delete(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String supplierMaterialId=reqeust.getParameter("supplierMaterialId");//字符串		
		supplierMaterialService.delSupplierMaterial(Integer.parseInt(supplierMaterialId));
		return "find";
	}
	public String prepup(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String supplierMaterialId=reqeust.getParameter("supplierMaterialId");//字符串	
		supplierMaterial= supplierMaterialService.getSupplierMaterial(Integer.parseInt(supplierMaterialId));
		getRequest().put("listSuppliers",supplierService.getAllSuppliers());
		getRequest().put("listMaterials", materialService.getAllMaterials());
		return "prepup";
	}

	public String addPre(){
		getRequest().put("listSuppliers",supplierService.getAllSuppliers());
		getRequest().put("listMaterials", materialService.getAllMaterials());
		return "addPre";
	}
	//增加
	public String save(){
		supplierMaterialService.addSupplierMaterial(supplierMaterial);
		return "find";
	}
		 
	//修改
	public String update(){
		supplierMaterialService.updateSupplierMaterial(supplierMaterial);
		return "find";
	}
	
	//按照库存查找
	public String findbyRemark(){
		listSupplierMaterials=(List<SupplierMaterial>) supplierMaterialService.getSupplierMaterialByRemark();
		return "zhanshi";
	}
	//按照物料名称查找
	public String findbyMaterialName(){
		listSupplierMaterials=(List<SupplierMaterial>) supplierMaterialService.getSupplierMaterialByMaterials(supplierMaterial.getMaterial().getMaterialName());
		return "zhanshi";
	}
	
	public SupplierMaterialService getSupplierMaterialService() {
		return supplierMaterialService;
	}
	public void setSupplierMaterialService(
			SupplierMaterialService supplierMaterialService) {
		this.supplierMaterialService = supplierMaterialService;
	}
	public SupplierService getSupplierService() {
		return supplierService;
	}
	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}
	public MaterialService getMaterialService() {
		return materialService;
	}
	public void setMaterialService(MaterialService materialService) {
		this.materialService = materialService;
	}
	public List<Supplier> getListSuppliers() {
		return listSuppliers;
	}
	public void setListSuppliers(List<Supplier> listSuppliers) {
		this.listSuppliers = listSuppliers;
	}
	public List<Material> getListMaterials() {
		return listMaterials;
	}
	public void setListMaterials(List<Material> listMaterials) {
		this.listMaterials = listMaterials;
	}
	public List<SupplierMaterial> getListSupplierMaterials() {
		return listSupplierMaterials;
	}
	public void setListSupplierMaterials(
			List<SupplierMaterial> listSupplierMaterials) {
		this.listSupplierMaterials = listSupplierMaterials;
	}
	public SupplierMaterial getSupplierMaterial() {
		return supplierMaterial;
	}
	public void setSupplierMaterial(SupplierMaterial supplierMaterial) {
		this.supplierMaterial = supplierMaterial;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	
}
