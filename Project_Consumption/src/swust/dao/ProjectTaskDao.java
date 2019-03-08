package swust.dao;

import java.util.List;

import swust.model.ProjectTask;

public interface ProjectTaskDao {
	// 查询所有
	public List<ProjectTask> getAllProjectTasks();

	// 添加用户
	public void addProjectTask(ProjectTask projectTask);

	// 删除用户
	public void delProjectTask(Integer id);

	// 修改用户
	public void updateProjectTask(ProjectTask projectTask);

	public List<ProjectTask> getProjectTask(Integer id);
	
	public List<ProjectTask> getProjectTaskByEmp(Integer id);
	
}
