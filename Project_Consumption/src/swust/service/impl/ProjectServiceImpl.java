package swust.service.impl;

import java.util.List;

import swust.dao.ProjectDao;
import swust.model.Project;
import swust.service.ProjectService;

public class ProjectServiceImpl implements ProjectService {
	private ProjectDao projectDao;

	@Override
	public List<Project> getAllProjects() {
		List<Project> projects = projectDao.getAllProjects();
		return projects;
	}

	@Override
	public void addProject(Project project) {
		projectDao.addProject(project);
	}

	@Override
	public void delProject(Integer id) {
		projectDao.delProject(id);
	}

	@Override
	public void updateProject(Project project) {
		projectDao.updateProject(project);
	}

	public void updatePreProject(Project project) {
		projectDao.updatePreProject(project);
	}

	@Override
	public Project getProject(Integer id) {
		return projectDao.getProject(id);
	}

	@Override
	public List<Project> getProjectByName(String proName) {
		return projectDao.getProjectByName(proName);
	}

	@Override
	public List<Project> getProjectByRemark() {
		return projectDao.getProjectByRemark();
	}

	@Override
	public List<Project> getProjectByRemarkSJ() {
		return projectDao.getProjectByRemarkSJ();
	}

	public ProjectDao getProjectDao() {
		return projectDao;
	}

	public void setProjectDao(ProjectDao projectDao) {
		this.projectDao = projectDao;
	}

}
