package swust.dao;

import java.util.List;

import swust.model.UselessProduct;

public interface UselessProductDao {
	// 查询所有
	public List<UselessProduct> getAllUselessProducts();

	// 添加用户
	public void addUselessProduct(UselessProduct client);

	// 删除用户
	public void delUselessProduct(Integer id);

	// 修改用户
	public void updateUselessProduct(UselessProduct client);

	// 单个查询
	public UselessProduct getUselessProduct(Integer id);

}
