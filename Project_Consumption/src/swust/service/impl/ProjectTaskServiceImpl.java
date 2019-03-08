package swust.service.impl;

import java.util.List;

import swust.dao.ProjectTaskDao;
import swust.model.ProjectTask;
import swust.service.ProjectTaskService;

public class ProjectTaskServiceImpl implements ProjectTaskService {
	private ProjectTaskDao projectTaskDao;

	@Override
	public List<ProjectTask> getAllProjectTasks() {
		List<ProjectTask> projectTasks = projectTaskDao.getAllProjectTasks();
		return projectTasks;
	}

	@Override
	public void addProjectTask(ProjectTask projectTask) {
		projectTaskDao.addProjectTask(projectTask);
	}

	@Override
	public void delProjectTask(Integer id) {
		projectTaskDao.delProjectTask(id);

	}

	@Override
	public void updateProjectTask(ProjectTask projectTask) {
		projectTaskDao.updateProjectTask(projectTask);

	}
	public List<ProjectTask> getProjectTaskByEmp(Integer id){
		return projectTaskDao.getProjectTaskByEmp(id);
	}

	@Override
	public List<ProjectTask> getProjectTask(Integer id) {
		return projectTaskDao.getProjectTask(id);
	}

	public ProjectTaskDao getProjectTaskDao() {
		return projectTaskDao;
	}

	public void setProjectTaskDao(ProjectTaskDao projectTaskDao) {
		this.projectTaskDao = projectTaskDao;
	}

}
