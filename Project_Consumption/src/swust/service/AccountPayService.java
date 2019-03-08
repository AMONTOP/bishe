package swust.service;

import java.util.List;

import swust.model.AccountPay;

public interface AccountPayService {
	// 查询所有
	public List<AccountPay> getAllAccountPays();

	// 添加用户
	public void addAccountPay(AccountPay accountPay);

	// 删除用户
	public void delAccountPay(Integer id);

	// 修改用户
	public void updateAccountPay(AccountPay accountPay);

	// 单个查询
	public AccountPay getAccountPay(Integer id);

}
