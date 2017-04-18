package com.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.model.Permission;

/**
 * 权限
 * @author Administrator
 *
 */
public interface PermissionMapper {

	Permission getOneByUrl(@Param(value="permission")String permission);
	void save(Permission old);
	List<Map<String, Object>> getPermissionByRoleId(@Param(value="roleid")String roleid);
	List<Map<String, Object>> getRolePermissionByRoleId(@Param(value="roleid")Integer roleid);
	List<Permission> getChildMenuByParentId(Object id);
	List<Map<String, Object>> getRoot();
	List<Permission> getChildMenuByParentIdAndRoleId(@Param(value="parentid")Object parentid,@Param(value="roleid") Integer id);

}
