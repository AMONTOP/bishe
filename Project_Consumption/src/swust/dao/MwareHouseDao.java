package swust.dao;

import java.util.List;

import swust.model.MwareHouse;

public interface MwareHouseDao {
	// 查询所有
	public List<MwareHouse> getAllMwareHouses();

	// 添加用户
	public void addMwareHouse(MwareHouse wareHouse);

	// 删除用户
	public void delMwareHouse(Integer id);

	// 修改用户
	public void updateMwareHouse(MwareHouse wareHouse);

	// 单个查询
	public MwareHouse getMwareHouse(Integer id);

	// 单个查询(根据客户姓名模糊)
	public List<MwareHouse> getMwareHouseByName(String wareNo);
}
