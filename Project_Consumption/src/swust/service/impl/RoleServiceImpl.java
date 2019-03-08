package swust.service.impl;

import java.util.List;

import swust.dao.RoleDao;
import swust.model.Role;
import swust.service.RoleService;

public class RoleServiceImpl implements RoleService {
	private RoleDao roleDao;

	@Override
	public List<Role> getAllRoles() {
		List<Role> roles = roleDao.getAllRoles();
		return roles;
	}

	@Override
	public Role getRole(Integer id) {
		return roleDao.getRole(id);
	}

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

}
