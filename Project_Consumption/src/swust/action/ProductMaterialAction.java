package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import swust.model.Material;
import swust.model.Product;
import swust.model.ProductMaterial;
import swust.service.MaterialService;
import swust.service.ProductMaterialService;
import swust.service.ProductService;

public class ProductMaterialAction extends BaseAction {
	private ProductMaterialService productMaterialService;
	private ProductService productService;
	private MaterialService materialService;
	private List<ProductMaterial> listProductMaterials;
	private List<Product> listProducts;
	private List<Material> listMaterials;
	private ProductMaterial productMaterial;
	private int id;
	private String result;

	public String show() {
		listProductMaterials = productMaterialService.getAllProductMaterials();
		// listCategory = productCategoryService.getAllProductCategorys();
		// getRequest().put("listCategory",productCategoryService.getAllProductCategorys());
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String productMaterialId = reqeust.getParameter("productMaterialId");// 字符串
		productMaterialService.delProductMaterial(Integer
				.parseInt(productMaterialId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String productMaterialId = reqeust.getParameter("productMaterialId");// 字符串
		productMaterial = productMaterialService.getProductMaterial(Integer
				.parseInt(productMaterialId));
		getRequest().put("listMaterials", materialService.getAllMaterials());
		getRequest().put("listProducts", productService.getAllProducts());
		return "prepup";
	}

	public String addPre() {
		getRequest().put("listProducts", productService.getAllProducts());
		getRequest().put("listMaterial", materialService.getAllMaterials());
		return "addPre";
	}

	// 增加
	public String save() {
		productMaterialService.addProductMaterial(productMaterial);
		return "find";
	}

	public String getMaterial() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String productId = reqeust.getParameter("productId");// 字符串
		listProductMaterials = productMaterialService.getPMByProductId(Integer
				.parseInt(productId));
		JSONArray json = JSONArray.fromObject(listProductMaterials);
		result = json.toString();
		return "datajson";
	}

	// 修改
	public String update() {
		System.out.println("update1");
		productMaterialService.updateProductMaterial(productMaterial);
		System.out.println("update");
		return "find";
	}

	public ProductMaterialService getProductMaterialService() {
		return productMaterialService;
	}

	public void setProductMaterialService(
			ProductMaterialService productMaterialService) {
		this.productMaterialService = productMaterialService;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public MaterialService getMaterialService() {
		return materialService;
	}

	public void setMaterialService(MaterialService materialService) {
		this.materialService = materialService;
	}

	public List<ProductMaterial> getListProductMaterials() {
		return listProductMaterials;
	}

	public void setListProductMaterials(
			List<ProductMaterial> listProductMaterials) {
		this.listProductMaterials = listProductMaterials;
	}

	public List<Product> getListProducts() {
		return listProducts;
	}

	public void setListProducts(List<Product> listProducts) {
		this.listProducts = listProducts;
	}

	public List<Material> getListMaterials() {
		return listMaterials;
	}

	public void setListMaterials(List<Material> listMaterials) {
		this.listMaterials = listMaterials;
	}

	public ProductMaterial getProductMaterial() {
		return productMaterial;
	}

	public void setProductMaterial(ProductMaterial productMaterial) {
		this.productMaterial = productMaterial;
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
