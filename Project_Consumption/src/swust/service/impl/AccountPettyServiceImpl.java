package swust.service.impl;

import java.util.List;

import swust.dao.AccountPettyDao;
import swust.model.AccountPetty;
import swust.service.AccountPettyService;

public class AccountPettyServiceImpl implements AccountPettyService {
	private AccountPettyDao accountPettyDao;

	@Override
	public List<AccountPetty> getAllAccountPettys() {
		List<AccountPetty> accountPettys = accountPettyDao
				.getAllAccountPettys();
		return accountPettys;
	}

	@Override
	public void addAccountPetty(AccountPetty accountPetty) {
		accountPettyDao.addAccountPetty(accountPetty);
	}

	@Override
	public void delAccountPetty(Integer id) {
		accountPettyDao.delAccountPetty(id);
	}

	@Override
	public void updateAccountPetty(AccountPetty accountPetty) {
		accountPettyDao.updateAccountPetty(accountPetty);
	}

	@Override
	public AccountPetty getAccountPetty(Integer id) {
		return accountPettyDao.getAccountPetty(id);
	}

	public AccountPettyDao getAccountPettyDao() {
		return accountPettyDao;
	}

	public void setAccountPettyDao(AccountPettyDao accountPettyDao) {
		this.accountPettyDao = accountPettyDao;
	}

}
