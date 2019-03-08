package swust.dao;

import java.util.List;

import swust.model.Role;

public interface RoleDao {
	// 查询所有
	public List<Role> getAllRoles();

	// 单个查询
	public Role getRole(Integer id);
}
