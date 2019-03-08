package swust.service;

import java.util.List;

import swust.model.Profit;

public interface ProfitService {
	// 查询所有
	public List<Profit> getAllProfits();

	// 添加用户
	public void addProfit(Profit profit);

	// 删除用户
	public void delProfit(Integer id);

	// 修改用户
	public void updateProfit(Profit profit);

	// 单个查询
	public Profit getProfit(Integer id);

}
