package com.payProject.system.contorller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.payProject.config.common.JsonResult;
import com.payProject.config.common.PageResult;
import com.payProject.config.exception.ParamException;
import com.payProject.system.entity.Role;
import com.payProject.system.entity.User;
import com.payProject.system.service.RoleService;
import com.payProject.system.service.UserService;
import com.payProject.system.util.EncryptUtil;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;

public class RoleContorller {
	@Autowired
	RoleService roleService;
	/**
	 * 根据传入的信息给  user 表  和role表增加信息
	 * @param 	user	用户信息
	 * @param 	userRoleList	角色状态数组
	 * @return 	boolean数据    true为成功    false为失败
	 * 
	 */
	@ResponseBody
	@PostMapping("/role/addRole")
	public JsonResult addUser(Role role){
		if( StrUtil.isBlank(role.getRoleName())) 
			throw new ParamException("请求参数无效");
		Boolean flag = roleService.addRole(role);
		if(flag)
			return JsonResult.buildSuccessMessage("增加成功");
		return JsonResult.buildFailResult("增加失败");	
	}

	
	@RequestMapping("/role/roleShow")
	public String roleShow( ){
		return "/system/role/roleShow";
	}
	
	/**
	 * <p>用户展示</p>
	 * @return 2019-07-31
	 */
	@ResponseBody
	@RequestMapping("/role/userList")
	public PageResult<Role> userList(Role role,String page,String limit){
		 PageHelper.startPage(Integer.valueOf(page), Integer.valueOf(limit));
		 List<Role> list = roleService.findPageRoleByRser(role);
		 PageInfo<Role> pageInfo = new PageInfo<Role>(list);
		 PageResult<Role> pageR = new PageResult<Role>();
			pageR.setData(pageInfo.getList());
			pageR.setCode("0");
			pageR.setCount(String.valueOf(pageInfo.getTotal()));
		return pageR;
	}
	@RequestMapping("/Role/roleAdd")
	public String roleAdd( ){
		return "/system/role/roleAdd";
	}
	
	@ResponseBody
	@RequestMapping("/role/roleDel")
	public JsonResult roleDel(Role role ){
		boolean flag  = roleService.deleteRoleByRole(role);
		if(flag) {
			return JsonResult.buildSuccessMessage("删除成功");
		}
		return JsonResult.buildFailResult();
	}
	
	@RequestMapping("/role/roleEditShow")
	public String userEditShow(Role role ,Model m){
	if(null != role.getRoleId()) 
		throw new ParamException("请求参数无效");
	Role roleBean = roleService.findRoleByRoleId(role.getRoleId());
	m.addAttribute("user", roleBean);
		return "/system/role/roleEdit";
	}
	@ResponseBody
	@RequestMapping("/role/roleEdit")
	public JsonResult userEdit(Role role ){
		if(null != role.getRoleId()) 
			throw new ParamException("请求参数无效");
		role.setCreateTime(null);
		boolean flag  = roleService.UpdateRoleByRole(role);
		if(flag) {
			return JsonResult.buildSuccessMessage("修改成功");
		}
		return JsonResult.buildFailResult();
	}
}
