package swust.dao;

import java.util.List;

import swust.model.WareHouse;

public interface WareHouseDao {
	// 查询所有
	public List<WareHouse> getAllWareHouses();

	// 添加用户
	public void addWareHouse(WareHouse wareHouse);

	// 删除用户
	public void delWareHouse(Integer id);

	// 修改用户
	public void updateWareHouse(WareHouse wareHouse);

	// 单个查询
	public WareHouse getWareHouse(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<WareHouse> getWareHouseByName(String wareNo);
}
