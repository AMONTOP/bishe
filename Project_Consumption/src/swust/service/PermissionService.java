package swust.service;

import java.util.List;

import swust.model.Permission;

public interface PermissionService {
	// 查询所有
	public List<Permission> getAllPermissions();

	// 单个查询
	public Permission getPermission(Integer id);
}
