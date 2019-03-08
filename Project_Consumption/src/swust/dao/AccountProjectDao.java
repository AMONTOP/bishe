package swust.dao;

import java.util.List;

import swust.model.AccountProject;

public interface AccountProjectDao {
	// 查询所有
	public List<AccountProject> getAllAccountProjects();

	// 添加用户
	public void addAccountProject(AccountProject accountProject);

	// 删除用户
	public void delAccountProject(Integer id);

	// 修改用户
	public void updateAccountProject(AccountProject accountProject);

	// 单个查询
	public AccountProject getAccountProject(Integer id);

}
