package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import swust.model.Material;
import swust.model.ReturnMaterialBill;
import swust.model.ReturnMaterialBillMaterial;
import swust.service.MaterialService;
import swust.service.ReturnMaterialBillMaterialService;
import swust.service.ReturnMaterialBillService;

public class ReturnMaterialBillMaterialAction extends BaseAction {
	private ReturnMaterialBillMaterialService returnMaterialBillMaterialService;
	private ReturnMaterialBillService returnMaterialBillService;
	private MaterialService materialService;
	private List<ReturnMaterialBillMaterial> listReturnMaterialBillMaterials;
	private List<ReturnMaterialBill> listReturnMaterialBills;
	private List<Material> listMaterials;
	private ReturnMaterialBillMaterial returnMaterialBillMaterial;
	private int id;
	private String result;

	public String show() {
		listReturnMaterialBillMaterials = returnMaterialBillMaterialService
				.getAllReturnMaterialBillMaterials();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billMaterialId = reqeust.getParameter("billMaterialId");// 字符串
		returnMaterialBillMaterialService.delReturnMaterialBillMaterial(Integer
				.parseInt(billMaterialId));
		return "find";
	}

	public String prepup() {
		System.out.println("prepup");
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billMaterialId = reqeust.getParameter("billMaterialId");// 字符串
		returnMaterialBillMaterial = returnMaterialBillMaterialService
				.getReturnMaterialBillMaterial(Integer.parseInt(billMaterialId));
		getRequest().put("listReturnMaterial",
				returnMaterialBillService.getAllReturnMaterialBills());
		getRequest().put("listMaterial", materialService.getAllMaterials());
		return "prepup";
	}

	public String addPre() {
		getRequest().put("listReturnMaterial",
				returnMaterialBillService.getAllReturnMaterialBills());
		getRequest().put("listMaterial", materialService.getAllMaterials());
		return "addPre";
	}

	// 增加
	public String save() {
		returnMaterialBillMaterialService
				.addReturnMaterialBillMaterial(returnMaterialBillMaterial);
		listReturnMaterialBillMaterials = returnMaterialBillMaterialService
				.getAllReturnMaterialBillMaterials();
		JSONArray json = JSONArray.fromObject(listReturnMaterialBillMaterials);
		result = json.toString();
		return "mysave";
	}

	// 修改
	public String update() {
		returnMaterialBillMaterialService
				.updateReturnMaterialBillMaterial(returnMaterialBillMaterial);
		return "find";
	}

	public ReturnMaterialBillMaterialService getReturnMaterialBillMaterialService() {
		return returnMaterialBillMaterialService;
	}

	public void setReturnMaterialBillMaterialService(
			ReturnMaterialBillMaterialService returnMaterialBillMaterialService) {
		this.returnMaterialBillMaterialService = returnMaterialBillMaterialService;
	}

	public ReturnMaterialBillService getReturnMaterialBillService() {
		return returnMaterialBillService;
	}

	public void setReturnMaterialBillService(
			ReturnMaterialBillService returnMaterialBillService) {
		this.returnMaterialBillService = returnMaterialBillService;
	}

	public MaterialService getMaterialService() {
		return materialService;
	}

	public void setMaterialService(MaterialService materialService) {
		this.materialService = materialService;
	}

	public List<ReturnMaterialBillMaterial> getListReturnMaterialBillMaterials() {
		return listReturnMaterialBillMaterials;
	}

	public void setListReturnMaterialBillMaterials(
			List<ReturnMaterialBillMaterial> listReturnMaterialBillMaterials) {
		this.listReturnMaterialBillMaterials = listReturnMaterialBillMaterials;
	}

	public List<ReturnMaterialBill> getListReturnMaterialBills() {
		return listReturnMaterialBills;
	}

	public void setListReturnMaterialBills(
			List<ReturnMaterialBill> listReturnMaterialBills) {
		this.listReturnMaterialBills = listReturnMaterialBills;
	}

	public List<Material> getListMaterials() {
		return listMaterials;
	}

	public void setListMaterials(List<Material> listMaterials) {
		this.listMaterials = listMaterials;
	}

	public ReturnMaterialBillMaterial getReturnMaterialBillMaterial() {
		return returnMaterialBillMaterial;
	}

	public void setReturnMaterialBillMaterial(
			ReturnMaterialBillMaterial returnMaterialBillMaterial) {
		this.returnMaterialBillMaterial = returnMaterialBillMaterial;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
