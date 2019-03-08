package swust.service.impl;

import java.util.List;

import swust.dao.PermissionDao;
import swust.model.Permission;
import swust.service.PermissionService;

public class PermissionServiceImpl implements PermissionService {
	private PermissionDao permissionDao;

	@Override
	public List<Permission> getAllPermissions() {
		List<Permission> permissions = permissionDao.getAllPermissions();
		return permissions;
	}

	@Override
	public Permission getPermission(Integer id) {
		return permissionDao.getPermission(id);
	}

	public PermissionDao getPermissionDao() {
		return permissionDao;
	}

	public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}

}
