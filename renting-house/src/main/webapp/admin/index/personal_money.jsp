<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>租户信息修改</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/css/admin.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/layui/lay/modules/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/layui/layui.js"></script>
		<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
		
		<script type="text/javascript">
			function money() {
				
	    	 /*  if(window.confirm('您确定要充值吗？')) {
	                $("#editForm").submit();
	            } */ 
	            
	    	  var v = window.confirm("你是否确定要充值?");
				
				if(v){
					layer.msg(	
							'充值成功！',
							{icon: 1, title:'系统提示'},
							function(){
								$("#editForm").submit();
					}); 
				}
	            
	            
			}
		</script>
		
	</head>
	
	<body>
		<div class="wrap-container">
			<form id="editForm" class="layui-form" action="${pageContext.request.contextPath }/record_moneyAdd.html" 
				method="post" target="_parent" style="width: 90%;padding-top: 20px;" >
					
					<input type="hidden" name="id" value="${personal.id }" />
					
					<div class="layui-form-item">
						<label class="layui-form-label">账号：</label>
						<div class="layui-input-block">
							<input type="text"  name="phone" value="${personal.phone }" readonly="readonly" style="color: blue" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
						</div>

					</div>
					
					<div class="layui-form-item">
						<label class="layui-form-label">姓名：</label>
						<div class="layui-input-block">
							<input type="text" name="pname" readonly="readonly" value="${personal.pname }" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
						</div>

					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">余额：</label>
						<div class="layui-input-block">
							<input type="text" id="money" name="money" value="${personal.money }" readonly="readonly" style="color: blue"  required lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
						</div>

					</div>
					 
					 <div class="layui-form-item">
						<label class="layui-form-label">余额充值：</label>
						<div class="layui-input-block">
							<input type="text" id="inputMoney" name="inputMoney" value="" style="color: blue" required lay-verify="required" placeholder="请输入要充值的金额" autocomplete="off" class="layui-input">
						</div>

					</div>

					<div class="layui-form-item">
						<div class="layui-input-block">
							<a class="layui-btn layui-btn-normal" onclick="money()"  >立即提交</a>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
		</div>

		<script>
			//Demo
			layui.use(['form', 'element'], function() {
				var form = layui.form();
				var element = layui.element();
				form.render();
				//监听信息提交
				form.on('submit(siteInfo)', function(data) {
					layer.msg(JSON.stringify(data.field));
					return false;
				});
				//监听seo提交
				form.on('submit(seoInfo)', function(data) {
					layer.msg(JSON.stringify(data.field));
					return false;
				});
				//监听seo提交
				form.on('submit(emailInfo)', function(data) {
					layer.msg(JSON.stringify(data.field));
					return false;
				});
				//监听评论提交
				form.on('submit(commentInfo)', function(data) {
					layer.msg(JSON.stringify(data.field));
					return false;
				});
			});
		</script>
	</body>

</html>