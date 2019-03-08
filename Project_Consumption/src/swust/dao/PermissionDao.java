package swust.dao;

import java.util.List;

import swust.model.Permission;

public interface PermissionDao {
	// 查询所有
	public List<Permission> getAllPermissions();

	// 单个查询
	public Permission getPermission(Integer id);

}
