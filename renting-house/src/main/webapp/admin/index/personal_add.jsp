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
		<title>添加租户</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/css/admin.css" />
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/jquery.min.js"></script>	
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/layui/layui.js"></script>
		
		
		<script type="text/javascript">
		
			function add() {
	    	 if(window.confirm('您确定要添加该租户信息吗？')) {
	                $("#editForm").submit();
	            } 
	            
			}
			
		</script>
	</head>
	
	<body>
		<div class="wrap-container">
			<form id="editForm" class="layui-form" action="${pageContext.request.contextPath }/personal_add.html" 
				method="post" style="width: 90%;padding-top: 20px;" >
					
					<div class="layui-form-item">
						<label class="layui-form-label">租户账号：</label>
						<div class="layui-input-block">
							<input type="text" id="phone" name="phone" required lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input" /> 
							<span style="color: red">${error }</span>
						</div>

					</div>
					
					<div class="layui-form-item">
						<label class="layui-form-label">租户姓名：</label>
						<div class="layui-input-block">
							<input type="text" name="pname" value="" onfocus="change()" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
						</div>

					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">租户年龄：</label>
						<div class="layui-input-block">
							<input type="text" name="age" value="" required lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
						</div>

					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">租户邮箱：</label>
						<div class="layui-input-block">
							<input type="text" name="email" value="" required lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">工作单位：</label>
						<div class="layui-input-block">
							<input type="text" name="work" value="" required lay-verify="required" placeholder="请输入单位" autocomplete="off" class="layui-input">
						</div>
					</div>
					
					

					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-normal" onclick="add()"  >立即提交</button>
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