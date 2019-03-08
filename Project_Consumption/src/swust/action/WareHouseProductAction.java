package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import swust.model.WareHouse;
import swust.model.WareHouseProduct;
import swust.service.ProductService;
import swust.service.WareHouseProductService;
import swust.service.WareHouseService;

public class WareHouseProductAction extends BaseAction {
	private WareHouseService wareHouseService;
	private WareHouseProductService wareHouseProductService;
	private ProductService productService;
	private List<WareHouse> list;
	private List<WareHouseProduct> list2;
	private WareHouse wareHouse;
	private WareHouseProduct wareHouseProduct;
	private int id;
	private String wareNo;
	private String result;
	private String result2;

	public String show() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String wareId = reqeust.getParameter("wareId");// 字符串
		list2 = wareHouseProductService.getWareHouseProductByWare(Integer
				.parseInt(wareId));
		return "zhanshi";
	}

	public String test() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String wareId = request.getParameter("wareId");
		// list2 = wareHouseProductService.getWareHouseProductByWare(Integer
		// .parseInt(wareId));
		list2 = wareHouseProductService.getOnlyWareHouseProducts(Integer
				.parseInt(wareId));
		JSONArray json = JSONArray.fromObject(list2);
		result = json.toString();
		System.out.println(result);
		return "test";
	}

	public String showChange() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String wareId = reqeust.getParameter("wareId");
		list2 = wareHouseProductService.productOnlyWareHouseProduct(Integer
				.parseInt(wareId));
		JSONArray json = JSONArray.fromObject(list2);
		result = json.toString();
		// 改变成json形式
		return "showChange";
	}

	public String test2() {
		list2 = wareHouseProductService.existWareHouseProduct(wareHouseProduct);
		JSONArray json = JSONArray.fromObject(list2);
		result2 = json.toString();
		return "test2";
	}

	public String out() {
		wareHouseProductService.minusWareHouseProduct(wareHouseProduct);
		list2 = wareHouseProductService.getAllWareHouseProducts();
		JSONArray json = JSONArray.fromObject(list2);
		result2 = json.toString();
		return "out";
	}

	public String update() {
		wareHouseProductService.updateWareHouseProduct(wareHouseProduct);
		return "find";
	}

	public String addTo() {
		wareHouseProductService.addWareHouseProduct(wareHouseProduct);
		return "show2";
	}

	public String addNew() {
		getRequest().put("listProduct", productService.getAllProducts());
		getRequest().put("listWareHouse", wareHouseService.getAllWareHouses());
		/* wareHouseProductService.addToWareHouseProduct(wareHouseProduct); */
		return "preAdd";
	}

	public String saveNew() {
		wareHouseProductService.addToWareHouseProduct(wareHouseProduct);
		return "find";
	}

	public String updateOnly() {
		wareHouseProductService.updateOnlyWareHouseProduct(wareHouseProduct);
		return "find";
	}

	public String getQuantity() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String wareId = request.getParameter("wareId");
		String productId = request.getParameter("productId");
		list2 = wareHouseProductService.quantityHouseProducts(
				Integer.parseInt(wareId), Integer.parseInt(productId));
		JSONArray json = JSONArray.fromObject(list2);
		result = json.toString();
		return "getQuantity";
	}

	public WareHouseService getWareHouseService() {
		return wareHouseService;
	}

	public void setWareHouseService(WareHouseService wareHouseService) {
		this.wareHouseService = wareHouseService;
	}

	public List<WareHouse> getList() {
		return list;
	}

	public void setList(List<WareHouse> list) {
		this.list = list;
	}

	public WareHouse getWareHouse() {
		return wareHouse;
	}

	public void setWareHouse(WareHouse wareHouse) {
		this.wareHouse = wareHouse;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWareHouseName() {
		return wareNo;
	}

	public void setWareHouseName(String wareNo) {
		this.wareNo = wareNo;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public String getWareNo() {
		return wareNo;
	}

	public void setWareNo(String wareNo) {
		this.wareNo = wareNo;
	}

	public WareHouseProductService getWareHouseProductService() {
		return wareHouseProductService;
	}

	public void setWareHouseProductService(
			WareHouseProductService wareHouseProductService) {
		this.wareHouseProductService = wareHouseProductService;
	}

	public List<WareHouseProduct> getList2() {
		return list2;
	}

	public void setList2(List<WareHouseProduct> list2) {
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

	public WareHouseProduct getWareHouseProduct() {
		return wareHouseProduct;
	}

	public void setWareHouseProduct(WareHouseProduct wareHouseProduct) {
		this.wareHouseProduct = wareHouseProduct;
	}

}
