package swust.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import swust.model.AccountInfo;
import swust.service.AccountInfoService;

public class AccountInfoAction {
	private AccountInfoService accountInfoService;
	private List<AccountInfo> list;
	private AccountInfo accountInfo;
	private int id;

	public String show() {
		list = accountInfoService.getAllAccountInfos();
		return "zhanshi";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String accountInfoId = reqeust.getParameter("accountInfoId");// 字符串
		accountInfoService.delAccountInfo(Integer.parseInt(accountInfoId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String accountInfoId = reqeust.getParameter("accountInfoId");// 字符串
		accountInfo = accountInfoService.getAccountInfo(Integer
				.parseInt(accountInfoId));
		return "prepup";
	}

	// 增加
	public String save() {
		accountInfoService.addAccountInfo(accountInfo);
		return "find";
	}

	// 修改
	public String update() {
		accountInfoService.updateAccountInfo(accountInfo);
		return "find";
	}

	public AccountInfoService getAccountInfoService() {
		return accountInfoService;
	}

	public void setAccountInfoService(AccountInfoService accountInfoService) {
		this.accountInfoService = accountInfoService;
	}

	public List<AccountInfo> getList() {
		return list;
	}

	public void setList(List<AccountInfo> list) {
		this.list = list;
	}

	public AccountInfo getAccountInfo() {
		return accountInfo;
	}

	public void setAccountInfo(AccountInfo accountInfo) {
		this.accountInfo = accountInfo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
