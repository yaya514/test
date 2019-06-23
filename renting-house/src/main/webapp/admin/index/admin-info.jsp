<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="renderer" content="webkit">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>沛沛租房网</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/css/admin.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/css/login.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/jquery.min.js"></script>
		
		<script type="text/javascript">
			function checkPassword(){
				var password = $("#password").val();
				var repassword = $("#repassword").val();
				if(password != repassword){
					
					alert("两次密码不一致！！");
				}
			}
		</script>
	
	</head>
	<body>
		<div class="layui-tab page-content-wrap">
		  <ul class="layui-tab-title">
		    <li class="layui-this">修改资料</li>
		    <li>修改密码</li>
		  </ul>
		  <div class="layui-tab-content">
		    <div class="layui-tab-item layui-show">
		    	<form class="layui-form"  style="width: 90%;padding-top: 20px;" action="${pageContext.request.contextPath }/editPersonalInfo.html" method="post" target="_parent">
				  
				  <div class="layui-form-item">
				    <label class="layui-form-label">账号：</label>
				    <div class="layui-input-block">
				      <input type="text" name="phone" readonly="readonly" style="color: blue" autocomplete="off" class="layui-input" value="${personal.phone }">
				    </div>
				  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">姓名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="pname" required  lay-verify="required" placeholder="请输入您的姓名" autocomplete="off" class="layui-input" value="${personal.pname }">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">年龄：</label>
				    <div class="layui-input-block">
				      <input type="text" name="age" required  lay-verify="required" placeholder="请输入您的年龄" autocomplete="off" class="layui-input" value="${personal.age }">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">邮箱：</label>
				    <div class="layui-input-block">
				      <input type="text" name="email" required  lay-verify="required" placeholder="请输入您的邮箱" autocomplete="off" class="layui-input" value="${personal.email }">
				    </div>
				  </div>
				   <div class="layui-form-item">
				   	
				    <label class="layui-form-label">工作单位：</label>
				    <div class="layui-input-block">
				      <input type="text" name="work" required  lay-verify="required" placeholder="请输入您的工作单位" autocomplete="off" class="layui-input" value="${personal.work }">
				    </div>
				  </div>
				  
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn layui-btn-normal" lay-submit >立即提交</button>
				    </div>
				  </div>
				</form>
		    </div>
		    <div class="layui-tab-item">
		    
		    	<!-- 修改密码页面 -->
		    	<form class="layui-form" action="${pageContext.request.contextPath }/editPersonalPassword.html" style="width: 90%;padding-top: 20px;" target="_parent">
				  <div class="layui-form-item">
				    <label class="layui-form-label">账号：</label>
				    <div class="layui-input-block">
				      <input type="text" name="phone" style="color: blue;" readonly="readonly" autocomplete="off" class="layui-input" value="${personal.phone }">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">新密码：</label>
				    <div class="layui-input-block">
				      <input type="text" id="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">确认密码：</label>
				    <div class="layui-input-block">
				      <input type="text" id="repassword" name="repassword" required lay-verify="required" placeholder="请输入确认密码" autocomplete="off" class="layui-input" onblur="checkPassword()">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn layui-btn-normal" lay-submit >立即提交</button>
				    </div>
				  </div>
				</form>
		    </div>
		  </div>
		</div>
	<script src="${pageContext.request.contextPath }/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script>
		//Demo
		layui.use(['form','element'], function(){
		  var form = layui.form();
		  var element = layui.element();
		  form.render();
		  //监听信息提交
		  form.on('submit(adminInfo)', function(data){
		    layer.msg(JSON.stringify(data.field));
		    return false;
		  });
		  //监听密码提交
		   form.on('submit(adminPassword)', function(data){
		    layer.msg(JSON.stringify(data.field));
		    return false;
		  });
		});
	</script>
	</body>
</html>