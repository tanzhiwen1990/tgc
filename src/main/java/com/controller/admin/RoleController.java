package com.controller.admin;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.controller.response.NormalResponse;
import com.controller.response.PageResponse;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.model.Role;
import com.service.PermissionService;
import com.service.RoleService;
import com.util.AppConfig;
import com.util.BasePathUtil;


/**
 * 角色相关操作
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController {
  @Autowired
  private RoleService rs;
  
  @Autowired
  private PermissionService ps;
  
  @GetMapping(value="/getRoleList")
  public String list(ModelMap model,HttpServletRequest request){
	  PageHelper.startPage(1, AppConfig.pageSize);
	  Page<Role> rList=(Page<Role>) rs.pageRole();
	  PageResponse page=new PageResponse(rList.getPageNum(), rList.getPageSize(), rList.getTotal(), 
			  rList.getPages(), rList, true);
	  model.addAttribute("page", page);
	  model.addAttribute("ctx",BasePathUtil.getBasePath(request));
	  return "admin/role_list";
  }
  
  @PostMapping("/ajaxPage")
  @ResponseBody
  public PageResponse ajaxPage(Integer pageNum,Integer pageSize){
	  PageHelper.startPage(pageNum, pageSize);
	  Page<Role> rList=(Page<Role>) rs.pageRole();
	  PageResponse page=new PageResponse(rList.getPageNum(), rList.getPageSize(), rList.getTotal(), 
			  rList.getPages(), rList, true);
	  return page;
  }
  
  @GetMapping(value="/addOrEditPage")
  public String addOrEdit(ModelMap model,HttpServletRequest request,Integer id){
	model.addAttribute("ctx",BasePathUtil.getBasePath(request));
	if (id==null) {
		   return "admin/role_add";
	}else{
		
	   List<Map<String , Object>> pMaps=ps.getRoot();
	   for(Map<String , Object> pMap:pMaps){
		   pMap.put("cMenu", ps.getChildMenuByParentId(pMap.get("id")));
	   }
	   model.addAttribute("permissions", pMaps);
	   
	   Role role=rs.getOneById(id);
	   Map<String , Object> obj=new HashMap<>();
	   obj.put("role", role);
	   List< Map<String , Object>>maps=ps.getPermissionByRoleId(id.toString());
	   for(Map<String , Object> map:maps){
		   map.put("menu", ps.getChildMenuByParentId(map.get("id"),id));
	   }
	    obj.put("menu", maps);
	    model.addAttribute("rps", maps);
		model.addAttribute("ob", obj);
		return "admin/role_edit";
	}
	 
  }
  
  @PostMapping(value="addOrEdit")
  public String addOrEdit(Role entity,Integer id,HttpServletRequest request,ModelMap model){
	if (id==null) {
		entity.setCreatetime(new Date());
		entity.setCreatorid(AppConfig.getLoginUser(request).getT_id());
		rs.save(entity);
	}else{
		
		rs.update(entity,request);
	}
	
	return list(model, request);
  }
  
  @RequestMapping(value="/delete",method=RequestMethod.POST)
  @ResponseBody
  public NormalResponse delete(String ids){
  	int i = 0;
		try {
			i = rs.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new NormalResponse(i);
  }
  
}
