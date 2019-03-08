package swust.service.impl;

import java.util.List;

import swust.dao.AccountProjectDao;
import swust.model.AccountProject;
import swust.service.AccountProjectService;

public class AccountProjectServiceImpl implements AccountProjectService {
	private AccountProjectDao accountProjectDao;

	@Override
	public List<AccountProject> getAllAccountProjects() {
		List<AccountProject> accountProjects = accountProjectDao
				.getAllAccountProjects();
		return accountProjects;
	}

	@Override
	public void addAccountProject(AccountProject accountProject) {
		accountProjectDao.addAccountProject(accountProject);
	}

	@Override
	public void delAccountProject(Integer id) {
		accountProjectDao.delAccountProject(id);
	}

	@Override
	public void updateAccountProject(AccountProject accountProject) {
		accountProjectDao.updateAccountProject(accountProject);
	}

	@Override
	public AccountProject getAccountProject(Integer id) {
		return accountProjectDao.getAccountProject(id);
	}

	public AccountProjectDao getAccountProjectDao() {
		return accountProjectDao;
	}

	public void setAccountProjectDao(AccountProjectDao accountProjectDao) {
		this.accountProjectDao = accountProjectDao;
	}

}
