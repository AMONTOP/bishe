package swust.service.impl;

import java.util.List;

import swust.dao.AccountPayDao;
import swust.model.AccountPay;
import swust.service.AccountPayService;

public class AccountPayServiceImpl implements AccountPayService {
	private AccountPayDao accountPayDao;

	@Override
	public List<AccountPay> getAllAccountPays() {
		List<AccountPay> accountPays = accountPayDao.getAllAccountPays();
		return accountPays;
	}

	@Override
	public void addAccountPay(AccountPay accountPay) {
		accountPayDao.addAccountPay(accountPay);
	}

	@Override
	public void delAccountPay(Integer id) {
		accountPayDao.delAccountPay(id);
	}

	@Override
	public void updateAccountPay(AccountPay accountPay) {
		accountPayDao.updateAccountPay(accountPay);
	}

	@Override
	public AccountPay getAccountPay(Integer id) {
		return accountPayDao.getAccountPay(id);
	}

	public AccountPayDao getAccountPayDao() {
		return accountPayDao;
	}

	public void setAccountPayDao(AccountPayDao accountPayDao) {
		this.accountPayDao = accountPayDao;
	}

}
