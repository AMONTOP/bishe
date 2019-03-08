package swust.service.impl;

import java.util.List;

import swust.dao.AccountInfoDao;
import swust.model.AccountInfo;
import swust.service.AccountInfoService;

public class AccountInfoServiceImpl implements AccountInfoService {
	private AccountInfoDao accountInfoDao;

	@Override
	public List<AccountInfo> getAllAccountInfos() {
		List<AccountInfo> accountInfos = accountInfoDao.getAllAccountInfos();
		return accountInfos;
	}

	@Override
	public void addAccountInfo(AccountInfo accountInfo) {
		accountInfoDao.addAccountInfo(accountInfo);
	}

	@Override
	public void delAccountInfo(Integer id) {
		accountInfoDao.delAccountInfo(id);
	}

	@Override
	public void updateAccountInfo(AccountInfo accountInfo) {
		accountInfoDao.updateAccountInfo(accountInfo);
	}

	@Override
	public AccountInfo getAccountInfo(Integer id) {
		return accountInfoDao.getAccountInfo(id);
	}

	@Override
	public List<AccountInfo> getAccountInfoByInfoName(String infoName) {
		return accountInfoDao.getAccountInfoByInfoName(infoName);
	}

	public AccountInfoDao getAccountInfoDao() {
		return accountInfoDao;
	}

	public void setAccountInfoDao(AccountInfoDao accountInfoDao) {
		this.accountInfoDao = accountInfoDao;
	}

}
