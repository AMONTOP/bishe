package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.DrawMaterialBill;
import swust.model.DrawMaterialBillMaterial;
import swust.model.Material;
import swust.service.DrawMaterialBillMaterialService;
import swust.service.DrawMaterialBillService;
import swust.service.MaterialService;


public class DrawMaterialBillMaterialAction extends BaseAction {
	private DrawMaterialBillMaterialService drawMaterialBillMaterialService;
	private DrawMaterialBillService drawMaterialBillService;
	private MaterialService materialService;
	private List<DrawMaterialBillMaterial> listDrawMaterialBillMaterials;
	private List<DrawMaterialBill> listDrawMaterialBills;
	private List<Material> listMaterials;
	private DrawMaterialBillMaterial drawMaterialBillMaterial;
	private int id;
	
	
	public String show(){
		listDrawMaterialBillMaterials=drawMaterialBillMaterialService.getAllDrawMaterialBillMaterials();
		return "zhanshi";
	}
	public String delete(){
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String billMaterialId=reqeust.getParameter("billMaterialId");//字符串	
		drawMaterialBillMaterialService.delDrawMaterialBillMaterial(Integer.parseInt(billMaterialId));
		return "find";
	}
	public String prepup(){
		System.out.println("prepup");
		HttpServletRequest reqeust= ServletActionContext.getRequest();
		String billMaterialId=reqeust.getParameter("billMaterialId");//字符串
		drawMaterialBillMaterial= drawMaterialBillMaterialService.getDrawMaterialBillMaterial(Integer.parseInt(billMaterialId));
		getRequest().put("listDrawMaterial",drawMaterialBillService.getAllDrawMaterialBills());
		getRequest().put("listMaterial", materialService.getAllMaterials());
		return "prepup";
	}

	public String addPre(){
		getRequest().put("listDrawMaterial",drawMaterialBillService.getAllDrawMaterialBills());
		getRequest().put("listMaterial", materialService.getAllMaterials());
		return "addPre";
	}
	//增加
	public String save(){
		drawMaterialBillMaterialService.addDrawMaterialBillMaterial(drawMaterialBillMaterial);
		return "find";
	}
		 
	//修改
	public String update(){
		drawMaterialBillMaterialService.updateDrawMaterialBillMaterial(drawMaterialBillMaterial);
		return "find";
	}
	public DrawMaterialBillMaterialService getDrawMaterialBillMaterialService() {
		return drawMaterialBillMaterialService;
	}
	public void setDrawMaterialBillMaterialService(
			DrawMaterialBillMaterialService drawMaterialBillMaterialService) {
		this.drawMaterialBillMaterialService = drawMaterialBillMaterialService;
	}
	public DrawMaterialBillService getDrawMaterialBillService() {
		return drawMaterialBillService;
	}
	public void setDrawMaterialBillService(
			DrawMaterialBillService drawMaterialBillService) {
		this.drawMaterialBillService = drawMaterialBillService;
	}
	public MaterialService getMaterialService() {
		return materialService;
	}
	public void setMaterialService(MaterialService materialService) {
		this.materialService = materialService;
	}
	public List<DrawMaterialBillMaterial> getListDrawMaterialBillMaterials() {
		return listDrawMaterialBillMaterials;
	}
	public void setListDrawMaterialBillMaterials(
			List<DrawMaterialBillMaterial> listDrawMaterialBillMaterials) {
		this.listDrawMaterialBillMaterials = listDrawMaterialBillMaterials;
	}
	public List<DrawMaterialBill> getListDrawMaterialBills() {
		return listDrawMaterialBills;
	}
	public void setListDrawMaterialBills(
			List<DrawMaterialBill> listDrawMaterialBills) {
		this.listDrawMaterialBills = listDrawMaterialBills;
	}
	public List<Material> getListMaterials() {
		return listMaterials;
	}
	public void setListMaterials(List<Material> listMaterials) {
		this.listMaterials = listMaterials;
	}
	public DrawMaterialBillMaterial getDrawMaterialBillMaterial() {
		return drawMaterialBillMaterial;
	}
	public void setDrawMaterialBillMaterial(
			DrawMaterialBillMaterial drawMaterialBillMaterial) {
		this.drawMaterialBillMaterial = drawMaterialBillMaterial;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
