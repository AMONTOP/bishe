package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.Material;
import swust.model.MwareHouseMaterial;
import swust.model.Purchase;
import swust.service.MaterialService;
import swust.service.MwareHouseMaterialService;
import swust.service.PurchaseService;

public class PurchaseAction extends BaseAction {
	private PurchaseService purchaseService;
	private MaterialService materialService;
	private MwareHouseMaterialService mwareHouseMaterialService;
	private List<Purchase> list;
	private Purchase purchase;
	private Material material;
	private MwareHouseMaterial mwareHouseMaterial;
	private int id;

	public String show() {
		list = purchaseService.getAllPurchases();
		return "zhanshi";
	}

	public String addPre() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String materialId = reqeust.getParameter("materialId");// 字符串
		String wid = reqeust.getParameter("wid");// 字符串
		material = materialService.getMaterial(Integer.parseInt(materialId));
		mwareHouseMaterial = mwareHouseMaterialService.getById(Integer
				.parseInt(wid));
		System.out.println(material);
		System.out.println(wid);
		System.out.println(mwareHouseMaterial);
		return "addPre";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String purId = reqeust.getParameter("purId");// 字符串
		purchaseService.delPurchase(Integer.parseInt(purId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String purId = reqeust.getParameter("purId");// 字符串
		purchase = purchaseService.getPurchase(Integer.parseInt(purId));
		return "prepup";
	}

	// 增加
	public String save() {
		purchaseService.addPurchase(purchase);
		return "find";
	}

	// 修改
	public String update() {
		purchaseService.updatePurchase(purchase);
		return "find";
	}

	public PurchaseService getPurchaseService() {
		return purchaseService;
	}

	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}

	public List<Purchase> getList() {
		return list;
	}

	public void setList(List<Purchase> list) {
		this.list = list;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public MaterialService getMaterialService() {
		return materialService;
	}

	public void setMaterialService(MaterialService materialService) {
		this.materialService = materialService;
	}

	public MwareHouseMaterialService getMwareHouseMaterialService() {
		return mwareHouseMaterialService;
	}

	public void setMwareHouseMaterialService(
			MwareHouseMaterialService mwareHouseMaterialService) {
		this.mwareHouseMaterialService = mwareHouseMaterialService;
	}

	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}

	public MwareHouseMaterial getMwareHouseMaterial() {
		return mwareHouseMaterial;
	}

	public void setMwareHouseMaterial(MwareHouseMaterial mwareHouseMaterial) {
		this.mwareHouseMaterial = mwareHouseMaterial;
	}

}
