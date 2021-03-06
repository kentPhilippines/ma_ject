<!DOCTYPE html>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>代付订单管理</title>
<meta name="renderer" content="webkit">
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<%@include file="../../common/common.jsp"%>
<body layadmin-themealias="default" style=" background-color: #c4c0c7;">
	<div class="layui-fluid" style="padding: 15px;">
		<div class="layui-card"  style="padding: 15px;">
			<div class="layui-form layui-card-header layuiadmin-card-header-auto" style="height:120px">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">订单单号</label>
						<div class="layui-input-block">
							<input type="text" name="orderId" placeholder="请输入" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">关联订单</label>
						<div class="layui-input-block">
							<input type="text" name="associatedId" placeholder="请输入" autocomplete="off" class="layui-input">
						</div>
					</div> 
					<div class="layui-inline">
						<label class="layui-form-label">代付卡号</label>
						<div class="layui-input-block">
							<input type="text" name="bankCard" placeholder="请输入" autocomplete="off" class="layui-input">
						</div>
					</div> 
				</div>
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">代付商户号</label>
						<div class="layui-input-block">
							<input type="text" name="orderAccount" placeholder="请输入" autocomplete="off" class="layui-input">
						</div>
					</div> 
					<div class="layui-inline">
					    <label class="layui-form-label">订单状态</label>
					    <div class="layui-input-block">
					      <select name="orderStatus" lay-filter="aihao"><!-- 不能这么写,后期 优化  -->
					        <option value="" >全部</option>
					        <option value="1" >处理中</option>
					        <option value="2" >成功</option> 
					        <option value="3" >失败</option> 
					      </select>
					      </div>
					</div>
					<div class="layui-inline">
				      <label class="layui-form-label">日期范围</label>
				      <div class="layui-input-inline">
				        <input type="text" class="layui-input" id="createTime"  name = "createTime"  placeholder=" - ">
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
				<table id="LAY-user-back-manage" url = "${ctx}/manage/order/merchantsList" lay-filter="LAY-user-back-manage"></table>
			</div>  
		</div>
	</div>
	<script type="text/html" id="operation">
	{{#  if(d.orderStatus == '1'){ }}
 	 <a class="layui-btn layui-btn-xs" lay-event="isCheck" url = "${ctx}/manage/merchants/isCheck">代付审核</a>
 	 <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="isDie" url = "${ctx}/manage/merchants/isDie">置为代付失败</a>
	{{# } }}
	</script>
</body>
</html> 
<script type="text/javascript" src="${ctx}/static/js/manage/merchants/merchants.js" ></script>
<script type="text/html" id="orderStatus"> 
			{{#  if(d.orderStatus == '1'){ }}
				<span class="label radius"style="background-color:red;" >处理中</span>
			{{# }else if(d.orderStatus == '2'){ }}
				<span class="label label-success radius" style="background-color:#009688;">成功</span>
			{{# }else if(d.orderStatus == '3'){ }}
				<span class="label label-success radius" style="background-color:#009688;">失败</span>
			{{# } }}
</script>
<script type="text/html" id="orderType"> 
			{{#  if(d.orderType == '1'){ }}
				<span class="label radius" >下游代付</span>
			{{# }else{  }}
				<span class="label label-danger radius" style="background-color: red">补充代付</span>
			{{# } }}
</script>
<script>
layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  laydate.render({
		    elem: '#createTime'
		    ,range: true
		  });
})
$(function(){
	MerchantsClas.init();
})
</script>