package swust.dao;

import java.util.List;

public interface Module {
	// 查询所有
	public List<Module> getAllModules();

	// 单个查询
	public Module getModule(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<Module> getModuleByName(String moduleName);
}
