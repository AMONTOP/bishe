package swust.service.impl;

import java.util.List;

import swust.dao.AccountRepayDao;
import swust.model.AccountRepay;
import swust.service.AccountRepayService;

public class AccountRepayServiceImpl implements AccountRepayService {
	private AccountRepayDao accountRepayDao;

	@Override
	public List<AccountRepay> getAllAccountRepays() {
		List<AccountRepay> accountRepays = accountRepayDao
				.getAllAccountRepays();
		return accountRepays;
	}

	@Override
	public void addAccountRepay(AccountRepay accountRepay) {
		accountRepayDao.addAccountRepay(accountRepay);
	}

	@Override
	public void delAccountRepay(Integer id) {
		accountRepayDao.delAccountRepay(id);
	}

	@Override
	public void updateAccountRepay(AccountRepay accountRepay) {
		accountRepayDao.updateAccountRepay(accountRepay);
	}

	@Override
	public AccountRepay getAccountRepay(Integer id) {
		return accountRepayDao.getAccountRepay(id);
	}

	public AccountRepayDao getAccountRepayDao() {
		return accountRepayDao;
	}

	public void setAccountRepayDao(AccountRepayDao accountRepayDao) {
		this.accountRepayDao = accountRepayDao;
	}

}
