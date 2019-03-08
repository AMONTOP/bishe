package swust.dao;

import java.util.List;

import swust.model.AccountRepay;

public interface AccountRepayDao {
	// 查询所有
	public List<AccountRepay> getAllAccountRepays();

	// 添加用户
	public void addAccountRepay(AccountRepay accountRepay);

	// 删除用户
	public void delAccountRepay(Integer id);

	// 修改用户
	public void updateAccountRepay(AccountRepay accountRepay);

	// 单个查询
	public AccountRepay getAccountRepay(Integer id);
}
