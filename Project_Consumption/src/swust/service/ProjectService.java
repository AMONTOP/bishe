package swust.service;

import java.util.List;

import swust.model.Project;

public interface ProjectService {
	// 查询所有
	public List<Project> getAllProjects();

	// 添加用户
	public void addProject(Project project);

	// 删除用户
	public void delProject(Integer id);

	// 修改用户
	public void updateProject(Project project);

	// 单个查询
	public Project getProject(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<Project> getProjectByName(String proName);

	// 单个查询(根据客户姓名模糊)
	public List<Project> getProjectByRemark();

	// 单个查询(根据客户姓名模糊)
	public List<Project> getProjectByRemarkSJ();

	public void updatePreProject(Project project);
}
