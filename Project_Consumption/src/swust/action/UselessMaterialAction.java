package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.UselessMaterial;
import swust.service.UselessMaterialService;

public class UselessMaterialAction extends BaseAction {
	private UselessMaterialService uselessMaterialService;
	private List<UselessMaterial> list;
	private UselessMaterial uselessMaterial;
	private int id;

	public String test2() {
		uselessMaterialService.addUselessMaterial(uselessMaterial);
		list = uselessMaterialService.getAllUselessMaterials();
		return "zhanshi";
	}

	public String show() {
		list = uselessMaterialService.getAllUselessMaterials();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String useId = request.getParameter("useId");
		uselessMaterialService.delUselessMaterial(Integer.parseInt(useId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String useId = request.getParameter("useId");
		uselessMaterial = uselessMaterialService.getUselessMaterial(Integer
				.parseInt(useId));
		getRequest().put("listUseless",
				uselessMaterialService.getAllUselessMaterials());
		return "prepup";
	}

	public String save() {
		uselessMaterialService.addUselessMaterial(uselessMaterial);
		return "find";
	}

	public String update() {
		uselessMaterialService.updateUselessMaterial(uselessMaterial);
		return "find";
	}

	public UselessMaterialService getUselessMaterialService() {
		return uselessMaterialService;
	}

	public void setUselessMaterialService(
			UselessMaterialService uselessMaterialService) {
		this.uselessMaterialService = uselessMaterialService;
	}

	public List<UselessMaterial> getList() {
		return list;
	}

	public void setList(List<UselessMaterial> list) {
		this.list = list;
	}

	public UselessMaterial getUselessMaterial() {
		return uselessMaterial;
	}

	public void setUselessMaterial(UselessMaterial uselessMaterial) {
		this.uselessMaterial = uselessMaterial;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
