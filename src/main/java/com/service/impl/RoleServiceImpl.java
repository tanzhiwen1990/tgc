package com.service.impl;


import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mapper.PermissionMapper;
import com.mapper.RoleMapper;
import com.mapper.RolePermissionMapper;
import com.model.Permission;
import com.model.Role;
import com.model.RolePermission;
import com.service.RoleService;
import com.util.AppConfig;
/**
 * 角色实现
 * @author Administrator
 *
 */
@Service
public class RoleServiceImpl implements RoleService{
    
	@Autowired
	private RoleMapper rm;
	
	@Autowired
	private PermissionMapper pm;
	
	@Autowired
	private RolePermissionMapper rpm;
	@Override
	public int delete(String ids) {
		return rm.delete(ids);
	}

	@Override
	public void update(Role entity,HttpServletRequest request) {
		Role bean=rm.getOneById(entity.getId());
		if (bean.getDescription()!=entity.getDescription()) {
			bean.setDescription(entity.getDescription());
		}else if(bean.getName()!=entity.getName()) {
			bean.setName(entity.getName());
		}else if(bean.getCreatorid()!=AppConfig.getLoginUser(request).getT_id()){
			bean.setCreatorid(AppConfig.getLoginUser(request).getT_id());
		}
		bean.setCreatetime(new Date());
		rm.update(bean);
		//删除角色的所有权限
		rpm.deletePermissionsByRoleId(entity.getId());
		//重新添加权限
		String[] permissions=entity.getPermission().split(",");
		for (String permission:permissions) {
			RolePermission rp=new RolePermission();
		    Permission old= pm.getOneByUrl(permission);
		if (null==old) {
			Permission p=new Permission();
			p.setUrl(permission);
			pm.save(p );
			entity.setPermission(bean.getId().toString());
			rp.setPermissionid(entity.getId());
		}else{
			rp.setPermissionid(old.getId());
		}
		rp.setRoleid(entity.getId());
		rpm.save(rp);
		
		}
	}

	@Override
	public Role getOneById(Integer id) {
		return rm.getOneById(id);
	}

	@Override
	public void save(Role entity) {
		rm.save(entity);
		String[] permissions=entity.getPermission().split(",");
		for (String permission:permissions) {
			RolePermission rp=new RolePermission();
		    Permission old= pm.getOneByUrl(permission);
		if (null==old) {
			Permission bean=new Permission();
			bean.setUrl(permission);
			pm.save(bean );
			entity.setPermission(bean.getId().toString());
			rp.setPermissionid(entity.getId());
		}else{
			rp.setPermissionid(old.getId());
		}
		rp.setRoleid(entity.getId());
		rpm.save(rp);
		}
		
		
	}

	@Override
	public List<Role> pageRole() {
		return rm.pageRole();
	}

}
