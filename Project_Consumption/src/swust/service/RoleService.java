package swust.service;

import java.util.List;

import swust.model.Role;

public interface RoleService {
	// 查询所有
	public List<Role> getAllRoles();

	// 单个查询
	public Role getRole(Integer id);
}
