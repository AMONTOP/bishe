package swust.dao;

import java.util.List;

import swust.model.AccountPetty;

public interface AccountPettyDao {
	// 查询所有
	public List<AccountPetty> getAllAccountPettys();

	// 添加用户
	public void addAccountPetty(AccountPetty accountPetty);

	// 删除用户
	public void delAccountPetty(Integer id);

	// 修改用户
	public void updateAccountPetty(AccountPetty accountPetty);

	// 单个查询
	public AccountPetty getAccountPetty(Integer id);

}
