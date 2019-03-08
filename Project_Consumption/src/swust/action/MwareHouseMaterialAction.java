package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import swust.model.MwareHouse;
import swust.model.MwareHouseMaterial;
import swust.service.MaterialService;
import swust.service.MwareHouseMaterialService;
import swust.service.MwareHouseService;

public class MwareHouseMaterialAction extends BaseAction {
	private MwareHouseService mwareHouseService;
	private MwareHouseMaterialService mwareHouseMaterialService;
	private MaterialService productService;
	private List<MwareHouse> list;
	private List<MwareHouseMaterial> list2;
	private MwareHouse mwareHouse;
	private MwareHouseMaterial mwareHouseMaterial;
	private int id;
	private String wareNo;
	private String result;
	private String result2;

	public String show() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String wareId = reqeust.getParameter("wareId");// 字符串
		list2 = mwareHouseMaterialService.getMwareHouseMaterialByWare(Integer
				.parseInt(wareId));
		return "zhanshi";
	}

	public String test() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String wareId = request.getParameter("wareId");
		// list2 = wareHouseMaterialService.getMwareHouseMaterialByWare(Integer
		// .parseInt(wareId));
		list2 = mwareHouseMaterialService.getOnlyMwareHouseMaterials(Integer
				.parseInt(wareId));
		JSONArray json = JSONArray.fromObject(list2);
		result = json.toString();
		System.out.println(result);
		return "test";
	}

	public String showChange() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String wareId = reqeust.getParameter("wareId");
		list2 = mwareHouseMaterialService
				.materialOnlyMwareHouseMaterial(Integer.parseInt(wareId));
		JSONArray json = JSONArray.fromObject(list2);
		result = json.toString();
		// 改变成json形式
		return "showChange";
	}

	public String showById() {
		list2 = mwareHouseMaterialService.getByMaterialId();
		JSONArray json = JSONArray.fromObject(list2);
		result = json.toString();
		System.out.println(result);
		return "showLack";
	}

	public String test2() {
		list2 = mwareHouseMaterialService
				.existMwareHouseMaterial(mwareHouseMaterial);
		JSONArray json = JSONArray.fromObject(list2);
		result2 = json.toString();
		return "test2";
	}

	public String out() {
		mwareHouseMaterialService.minusMwareHouseMaterial(mwareHouseMaterial);
		return "find";
	}

	public String update() {
		mwareHouseMaterialService.updateMwareHouseMaterial(mwareHouseMaterial);
		return "find";
	}

	public String addTo() {
		mwareHouseMaterialService.addMwareHouseMaterial(mwareHouseMaterial);
		return "show2";
	}

	public String addNew() {
		getRequest().put("listMaterial", productService.getAllMaterials());
		getRequest().put("listMwareHouse",
				mwareHouseService.getAllMwareHouses());
		/* wareHouseMaterialService.addToMwareHouseMaterial(wareHouseMaterial); */
		return "preAdd";
	}

	public String saveNew() {
		mwareHouseMaterialService.addToMwareHouseMaterial(mwareHouseMaterial);
		list2 = mwareHouseMaterialService.getAllMwareHouseMaterials();
		JSONArray json = JSONArray.fromObject(list2);
		result = json.toString();
		return "saveNewjson";
	}

	public String saveOther() {
		mwareHouseMaterialService.addTo2MwareHouseMaterial(mwareHouseMaterial);
		list2 = mwareHouseMaterialService.getAllMwareHouseMaterials();
		JSONArray json = JSONArray.fromObject(list2);
		result = json.toString();
		return "saveNewjson";
	}

	public String updateOnly() {
		mwareHouseMaterialService
				.updateOnlyMwareHouseMaterial(mwareHouseMaterial);
		return "find";
	}

	public String getQuantity() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String wareId = request.getParameter("wareId");
		String materialId = request.getParameter("materialId");
		list2 = mwareHouseMaterialService.quantityHouseMaterials(
				Integer.parseInt(wareId), Integer.parseInt(materialId));
		JSONArray json = JSONArray.fromObject(list2);
		result = json.toString();
		return "getQuantity";
	}

	public MwareHouseService getMwareHouseService() {
		return mwareHouseService;
	}

	public void setMwareHouseService(MwareHouseService mwareHouseService) {
		this.mwareHouseService = mwareHouseService;
	}

	public List<MwareHouse> getList() {
		return list;
	}

	public void setList(List<MwareHouse> list) {
		this.list = list;
	}

	public MwareHouseMaterialService getMwareHouseMaterialService() {
		return mwareHouseMaterialService;
	}

	public void setMwareHouseMaterialService(
			MwareHouseMaterialService mwareHouseMaterialService) {
		this.mwareHouseMaterialService = mwareHouseMaterialService;
	}

	public MwareHouse getMwareHouse() {
		return mwareHouse;
	}

	public void setMwareHouse(MwareHouse mwareHouse) {
		this.mwareHouse = mwareHouse;
	}

	public MwareHouseMaterial getMwareHouseMaterial() {
		return mwareHouseMaterial;
	}

	public void setMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		this.mwareHouseMaterial = mwareHouseMaterial;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMwareHouseName() {
		return wareNo;
	}

	public void setMwareHouseName(String wareNo) {
		this.wareNo = wareNo;
	}

	public MaterialService getMaterialService() {
		return productService;
	}

	public void setMaterialService(MaterialService productService) {
		this.productService = productService;
	}

	public String getWareNo() {
		return wareNo;
	}

	public void setWareNo(String wareNo) {
		this.wareNo = wareNo;
	}

	public List<MwareHouseMaterial> getList2() {
		return list2;
	}

	public void setList2(List<MwareHouseMaterial> list2) {
		this.list2 = list2;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getResult2() {
		return result2;
	}

	public void setResult2(String result2) {
		this.result2 = result2;
	}

	public MaterialService getProductService() {
		return productService;
	}

	public void setProductService(MaterialService productService) {
		this.productService = productService;
	}

}
