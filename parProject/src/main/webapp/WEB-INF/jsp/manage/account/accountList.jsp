<!DOCTYPE html>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>商户管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<%@include file="../../common/common.jsp"%>
<body layadmin-themealias="default" style=" background-color: #c4c0c7;">
	<div class="layui-fluid" style="padding: 15px;">
		<div class="layui-card"  style="padding: 15px;">
			<div class="layui-form layui-card-header layuiadmin-card-header-auto">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">商户编号</label>
						<div class="layui-input-block">
							<input type="text" name="accountId" placeholder="渠道本地编号" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">商户名称</label>
						<div class="layui-input-block">
							<input type="text" name="accountName" placeholder="渠道名称" autocomplete="off" class="layui-input">
						</div>
					</div> 
					<div class="layui-inline">
						<button class="layui-btn != " lay-submit=""
							lay-filter="LAY-user-back-search">
							<i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="layui-card-body">
				<div style="padding-bottom: 10px;">
					<button class="layui-btn layuiadmin-btn-admin" data-type="add" addUrl = "${ctx}/manage/account/accountlAdd">一键生成商户</button>
				</div>
				<table id="LAY-user-back-manage" url = "${ctx}/manage/account/accountList" lay-filter="LAY-user-back-manage"></table>
			</div>
		</div>
	</div>
	<script type="text/html" id="operation">
 	 <a class="layui-btn layui-btn-xs" lay-event="addAmount" url = "${ctx}/manage/account/addAmount">加款</a>
 	 <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="amountDel" url = "${ctx}/manage/account/amountDel">减款</a>
 	 <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="amountFre" url = "${ctx}/manage/account/amountFre">冻结</a>
 	 <a class="layui-btn layui-btn-xs" lay-event="edit" url = "${ctx}/manage/account/accountEditShow">编辑</a>
 	 <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" url = "${ctx}/manage/account/accountDel">删除</a>
	</script>
</body>
</html>
<script type="text/javascript" src="${ctx}/static/js/manage/account/account.js" ></script>
<script>
$(function(){
	AccountClas.init();
})
</script>