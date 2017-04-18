package com.service;

import java.util.List;
import java.util.Map;

import com.model.Permission;

public interface PermissionService {

	List<Map<String, Object>> getPermissionByRoleId(String roleid);

	String getRolePermissionByRoleId(Integer roleid);

	List<Permission> getChildMenuByParentId(Object id);

	List<Map<String, Object>> getRoot();

	List<Permission> getChildMenuByParentId(Object parentid, Integer id);

}
