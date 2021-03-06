<!DOCTYPE html>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<title>账户管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<%@include file="../../common/common.jsp"%>
<style type="text/css">
.layui-form-pane .layui-input-block{
    margin-left: 197px;
    left: -1px;
}
.layui-form-pane .layui-form-label{
	width: 192px;
    padding: 8px 15px;
    height: 38px;
    line-height: 20px;
    border-width: 1px;
    border-style: solid;
    border-radius: 2px 0 0 2px;
    text-align: center;
    background-color: #FBFBFB;
    overflow: hidden;
    box-sizing: border-box;
}
</style>
<body layadmin-themealias="default" style=" background-color: #ffffff00;" >
	<form class="layui-form layui-form-pane" action=""  style="padding: 15px;">
	<div class="layui-form-item">
	    <div class="layui-inline">
	      <label class="layui-form-label">账户编号</label>
	      <div class="layui-input-inline">
	        <input type="text" readonly = "unselectable='on'"  name="accountId"  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value = "${account.accountId}">
	      </div>
	    </div>
	    <div class="layui-inline">
	      <label class="layui-form-label">账户昵称</label>
	      <div class="layui-input-inline">
	        <input type="text" name="accountName" autocomplete="off" class="layui-input" value = "${account.accountName}">
	      </div>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-inline">
	      <label class="layui-form-label">交易额度范围</label>
	      <div class="layui-input-inline" style="width: 100px;">
	        <input type="text" name="dayDealAmountMin" placeholder="￥" autocomplete="off" class="layui-input" value = "${account.dayDealAmountMin }">
	      </div>
	      <div class="layui-form-mid">-</div>
	      <div class="layui-input-inline" style="width: 100px;">
	        <input type="text" name="dayDealAmountMax" placeholder="￥" autocomplete="off" class="layui-input" value = "${account.dayDealAmountMax }">
	      </div>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">商户类型</label>
	    <div class="layui-input-inline">
	      <select name="accountType" lay-verify="required" >
	        <option value="0" <c:if test="${account.accountType eq '0'}">selected = "selected"</c:if>>本渠道商户</option>
	        <option value="1"<c:if test="${account.accountType eq '1'}">selected = "selected"</c:if>>外渠道商户</option>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">日最大累计交易额</label>
	    <div class="layui-input-inline">
	   		<input type="text" name="maxDeal" autocomplete="off" class="layui-input" value = "${account.maxDeal}">
	    </div>
	  </div>
	  <div class="layui-form-item">
	  <div class="layui-inline">
	      <label class="layui-form-label">到账银行卡</label>
	      <div class="layui-input-inline">
	        <input type="text" name="bankCard" autocomplete="off" class="layui-input" value = "${account.bankCard}">
	      </div>
	    </div>
	   </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">用户是否开通交易</label>
	    <div class="layui-input-inline">
	      <select name="isDeal" lay-verify="required">
	        <option value="0" <c:if test="${account.isDeal eq '0'}"> selected = "selected"</c:if>>交易停用</option>
	        <option value="1"<c:if test="${account.isDeal eq '1'}"> selected = "selected"</c:if>>交易开启 </option>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">用户是否开通代付</label>
	    <div class="layui-input-inline">
	      <select name="isDpay" lay-verify="required">
	        <option value="0" <c:if test="${account.isDeal eq '0'}"> selected = "selected"</c:if>>代付停用</option>
	        <option value="1"<c:if test="${account.isDeal eq '1'}"> selected = "selected"</c:if>>代付开启  </option>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">代付IP绑定（请以“，”分隔）</label>
	    <div class="layui-input-block">
	      <textarea placeholder="请输入内容" class="layui-textarea" name = "havaInterface" >${bean.havaInterface}</textarea>
	    </div>
	  </div>
	  
	  <div class="layui-layer-btn layui-layer-btn-">
			<a class="layui-layer-btn0" url = "${ctx}/manage/account/accountEdit">确定</a>
		</div>
	</form>
</body>
</html>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
});
</script>
<script type="text/javascript" src="${ctx}/static/js/manage/account/accountlUpdata.js" >
</script>
<script type="text/javascript">
$(function(){
	AccountlEdit.init();
})
</script>
