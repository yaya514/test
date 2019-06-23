<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>用户注册</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/css/login.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/jquery.min.js"></script>
	</head>
	
	<script type="text/javascript">
		function checkPhone(){
			//ajax请求 
			$.post("checkPhone.action", //url 
					{"phone" : $("#phone").val()} , //data 
					  function(isExist) { //请求成功回调该函数
						   if(isExist){
							  $("#error").removeClass("hidden");
						  }else{
							  $("#error").addClass("hidden");
						  } 
				   });
			
		}
	
	</script>
	
	<style type="text/css">
	    	.hidden {
	    		display: none;
    	}
   	</style>

	<body>
		<div class="m-login-bg">
			<div class="m-login">
				<h3>用户注册</h3>
				<div class="m-login-warp">
					<form class="layui-form" action="${pageContext.request.contextPath }/register.html" method="post">
						<div class="layui-form-item">
							<input type="text" name="phone" id="phone" required lay-verify="required" placeholder="手机号" autocomplete="off" class="layui-input" onblur="checkPhone()">
							<a id="error" style="color: red" class="hidden">该手机号已被注册过！</a>
						</div>
						<div class="layui-form-item">
							<input type="text" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
						</div>
						
						<div class="layui-form-item m-login-btn">
							<div class="layui-inline">
								<button class="layui-btn layui-btn-normal" lay-submit lay-filter="login">注册</button>
							</div>
							<div class="layui-inline">
								<button type="reset" class="layui-btn layui-btn-primary">取消</button>
							</div>
						</div>
					</form>
				</div>
				<p class="copyright">Copyright 2018-2019 by XIAODU</p>
			</div>
		</div>
		<script src="${pageContext.request.contextPath }/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script>
			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form(),
					layer = layui.layer;


				//自定义验证规则
				form.verify({
					title: function(value) {
						if(value.length < 5) {
							return '标题至少得5个字符啊';
						}
					},
					password: [/(.+){6,12}$/, '密码必须6到12位'],
					verity: [/(.+){6}$/, '验证码必须是6位'],
					
				});

				
				//监听提交
				/* form.on('submit(login)', function(data) {
					layer.alert(JSON.stringify(data.field), {
						title: '最终的提交信息'
					})
					return false;
				}); */

			});
		</script>
		
		
	</body>

</html>