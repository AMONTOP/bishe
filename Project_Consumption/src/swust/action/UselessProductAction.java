package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.UselessProduct;
import swust.service.UselessProductService;

public class UselessProductAction extends BaseAction {
	private UselessProductService uselessProductService;
	private List<UselessProduct> list;
	private UselessProduct uselessProduct;
	private int id;

	public String test2() {
		uselessProductService.addUselessProduct(uselessProduct);
		list = uselessProductService.getAllUselessProducts();
		return "zhanshi";
	}

	public String show() {
		list = uselessProductService.getAllUselessProducts();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String useId = request.getParameter("useId");
		uselessProductService.delUselessProduct(Integer.parseInt(useId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String useId = request.getParameter("useId");
		uselessProduct = uselessProductService.getUselessProduct(Integer
				.parseInt(useId));
		getRequest().put("listUseless",
				uselessProductService.getAllUselessProducts());
		return "prepup";
	}

	public String save() {
		uselessProductService.addUselessProduct(uselessProduct);
		return "find";
	}

	public String update() {
		uselessProductService.updateUselessProduct(uselessProduct);
		return "find";
	}

	public UselessProductService getUselessProductService() {
		return uselessProductService;
	}

	public void setUselessProductService(
			UselessProductService uselessProductService) {
		this.uselessProductService = uselessProductService;
	}

	public List<UselessProduct> getList() {
		return list;
	}

	public void setList(List<UselessProduct> list) {
		this.list = list;
	}

	public UselessProduct getUselessProduct() {
		return uselessProduct;
	}

	public void setUselessProduct(UselessProduct uselessProduct) {
		this.uselessProduct = uselessProduct;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
