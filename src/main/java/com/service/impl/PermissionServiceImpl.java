package com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.PermissionMapper;
import com.model.Permission;
import com.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService{
    @Autowired
    private PermissionMapper pm;

	@Override
	public List<Map<String, Object>> getPermissionByRoleId(String roleid) {
		
		return pm.getPermissionByRoleId(roleid);
	}

	@Override
	public String getRolePermissionByRoleId(Integer roleid) {
		List<Map<String , Object>> rMaps=pm.getRolePermissionByRoleId(roleid);
		StringBuilder sb=new StringBuilder();
		for(Map<String , Object> map :rMaps){
			sb.append(map.get("roleid"));
		}
		return sb.toString();
	}

	@Override
	public List<Permission> getChildMenuByParentId(Object id) {
		
		return pm.getChildMenuByParentId(id);
	}

	@Override
	public List<Map<String, Object>> getRoot() {
		return pm.getRoot();
	}

	@Override
	public List<Permission> getChildMenuByParentId(Object parentid, Integer id) {
		
		return pm.getChildMenuByParentIdAndRoleId(parentid,id);
	}
	

}
