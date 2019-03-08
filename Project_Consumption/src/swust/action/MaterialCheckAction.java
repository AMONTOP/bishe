package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.Material;
import swust.model.MaterialCheck;
import swust.service.MaterialCheckService;
import swust.service.MaterialService;

public class MaterialCheckAction extends BaseAction {
	private MaterialCheckService materialCheckService;
	private MaterialService materialService;
	private List<MaterialCheck> list;
	private List<Material> listMaterials;
	private MaterialCheck materialCheck;
	private int id;
	private String materialName;

	public String show() {
		list = materialCheckService.getAllMaterialChecks();
		// listCategory = MaterialCategoryService.getAllMaterialCategorys();
		// getRequest().put("listCategory",MaterialCategoryService.getAllMaterialCategorys());
		return "zhanshi";
	}

	public String showList() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String mState = reqeust.getParameter("id");// 字符串
		list = materialCheckService.getMaterialCheckByState(Integer
				.parseInt(mState));
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String materialCheckId = reqeust.getParameter("materialCheckId");// 字符串
		materialCheckService
				.delMaterialCheck(Integer.parseInt(materialCheckId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String materialCheckId = reqeust.getParameter("materialCheckId");// 字符串
		materialCheck = materialCheckService.getMaterialCheck(Integer
				.parseInt(materialCheckId));
		getRequest().put("listMaterial", materialService.getAllMaterials());
		return "prepup";
	}

	public String findbyBillId() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String billId = reqeust.getParameter("billId");
		System.out.println(billId);
		list = materialCheckService.getMaterialCheckByBillId(Integer
				.parseInt(billId));
		return "insert";
	}

	public String addPre() {
		getRequest().put("listMaterial", materialService.getAllMaterials());
		return "addPre";
	}

	// 增加
	public String save() {
		materialCheckService.addMaterialCheck(materialCheck);
		return "find";
	}

	// 修改
	public String update() {
		materialCheckService.updateMaterialCheck(materialCheck);
		return "find";
	}

	public MaterialCheckService getMaterialCheckService() {
		return materialCheckService;
	}

	public void setMaterialCheckService(
			MaterialCheckService materialCheckService) {
		this.materialCheckService = materialCheckService;
	}

	public MaterialService getMaterialService() {
		return materialService;
	}

	public void setMaterialService(MaterialService materialService) {
		this.materialService = materialService;
	}

	public List<MaterialCheck> getList() {
		return list;
	}

	public void setList(List<MaterialCheck> list) {
		this.list = list;
	}

	public List<Material> getListMaterials() {
		return listMaterials;
	}

	public void setLisMaterials(List<Material> listMaterials) {
		this.listMaterials = listMaterials;
	}

	public MaterialCheck getMaterialCheck() {
		return materialCheck;
	}

	public void setMaterialCheck(MaterialCheck materialCheck) {
		this.materialCheck = materialCheck;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

}
