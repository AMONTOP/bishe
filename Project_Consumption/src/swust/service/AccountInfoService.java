package swust.service;

import java.util.List;

import swust.model.AccountInfo;

public interface AccountInfoService {
	// 查询所有
	public List<AccountInfo> getAllAccountInfos();

	// 添加用户
	public void addAccountInfo(AccountInfo accountInfo);

	// 删除用户
	public void delAccountInfo(Integer id);

	// 修改用户
	public void updateAccountInfo(AccountInfo accountInfo);

	// 单个查询
	public AccountInfo getAccountInfo(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<AccountInfo> getAccountInfoByInfoName(String infoName);

}
