<!DOCTYPE html>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<title>添加修改</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<%@include file="../../../common/common.jsp"%>
<body layadmin-themealias="default">
<form id="UserForm" class="form-signin" action="javascript:0" method="post" novalidate="novalidate">
	<div class="layui-form" lay-filter="layuiadmin-form-admin"
		id="layuiadmin-form-admin" style="padding: 20px 30px 0 0;">
		<input type="hidden" name="id" lay-verify="required"
					    autocomplete="off" class="layui-input" value="${user.id}">
		<div class="layui-form-item">
			<label class="layui-form-label">用户登录id</label>
			<div class="layui-input-inline">
				<input type="text" name="userId" lay-verify="required"
					    autocomplete="off" class="layui-input" value="${user.userId}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户名称</label>
			<div class="layui-input-inline">
				<input type="text" name="userName" lay-verify="required"
					placeholder="请输入用户名"    autocomplete="off" class="layui-input" value="${user.userName}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户电话</label>
			<div class="layui-input-inline">
				<input type="text" name="userPhone" lay-verify="required"
					placeholder="请输入用户电话"   autocomplete="off" class="layui-input" value="${user.userPhone}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户邮箱</label>
			<div class="layui-input-inline">
				<input type="text" name="userMail" lay-verify="required"
					placeholder="请输入用户邮箱"   autocomplete="off" class="layui-input"  value="${user.userMail}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户QQ</label>
			<div class="layui-input-inline">
				<input type="text" name="userQQ" lay-verify="required"
					placeholder="请输入用户QQ"   autocomplete="off" class="layui-input" value="${user.userQQ}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户微信</label>
			<div class="layui-input-inline">
				<input type="text" name="userWechar" lay-verify="required"
					placeholder="请输入用户微信"    autocomplete="off" class="layui-input" value = "${user.userWechar}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户地址</label>
			<div class="layui-input-inline">
				<input type="text" name="userAddress" lay-verify="required"
					placeholder="请输入用户地址"   autocomplete="off" class="layui-input" value = "${user.userAddress}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">所在城市</label>
			<div class="layui-input-inline">
				<input type="text" name="userCity" lay-verify="email"
					placeholder="请输入用户所在城市" autocomplete="off" class="layui-input" value = "${user.userCity}">
			</div>
		</div>
		<c:if test="${user.retain2 eq 1 or user.retain2 eq 6 }">
		<div class="layui-form-item">
			<label class="layui-form-label">利率</label>
			<div class="layui-input-inline">
				<input type="text" name="retain1" lay-verify="email"
					placeholder="请输入利率" autocomplete="off" class="layui-input" value = "${user.retain1}">
			</div>
		</div>
		</c:if>
		<c:if test="${user.retain2 eq 1 or user.retain2 eq 6 }">
		<div class="layui-form-item">
			<label class="layui-form-label">代付手续费</label>
			<div class="layui-input-inline">
				<input type="text" name="retain5" lay-verify="email"
					placeholder="请输入代付手续费" autocomplete="off" class="layui-input" value = "${user.retain5}">
			</div>
		</div>
		</c:if>
		<div class="layui-form-item">
			<label class="layui-form-label">账户类别</label>
			<div class="layui-input-inline">
				 <select name="retain2" lay-filter="aihao">
		        <option value="2"<c:if test="${user.retain2 eq '2'}">selected="selected"</c:if>>商户</option>
		        <option value="6"<c:if test="${user.retain2 eq '6'}">selected="selected"</c:if>>代理商</option>
		      </select>
			</div>
		</div>
 		<div class="layui-form-item">
		    <label class="layui-form-label">状态</label>
		    <div class="layui-input-inline">
		      <select name="status" lay-filter="aihao">
		        <option value="1" selected="selected">有效</option>
		        <option value="0">无效</option>
		      </select>
		    </div>
		</div>
		<div class="layui-layer-btn layui-layer-btn-">
			<a class="layui-layer-btn0" url = "${ctx}/manage/appAcount/appAccountEdit">确定</a><a class="layui-layer-btn1">取消</a>
		</div>
	</div>
</form>
</body>
</html>
<script>
layui.use('form', function(){
  var form = layui.form;
});
</script>
<script type="text/javascript" src="${ctx}/static/js/system/user/user.js" ></script>
<script>
$(function(){
	UserManageEditCls.init();
})
</script>