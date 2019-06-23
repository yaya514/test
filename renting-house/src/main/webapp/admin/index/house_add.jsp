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
		<title>房源信息添加</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/css/admin.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/layui/layui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/layer/layer.js"></script>
		
		
		<script type="text/javascript">
			function edit() {
	    	 if(window.confirm('您确定要添加该房源信息吗？')) {
	                $("#editForm").submit();
	            } 
	            
			}
		</script>
		
	</head>
	
	<body>
		<div class="wrap-container">
			<form id="editForm" class="layui-form" action="${pageContext.request.contextPath }/house_add.html" 
				method="post" target="_parent" enctype="multipart/form-data" style="width: 90%;padding-top: 20px;" >
					
					<div class="layui-form-item">
						<label class="layui-form-label">房源名称：</label>
						<div class="layui-input-block">
							<input type="text" name="name" required lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
						</div>

					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">房源地址：</label>
						<div class="layui-input-block">
							<input type="text" name="address"  required lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
						</div>

					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">房源价格：</label>
						<div class="layui-input-block">
							<input type="text" name="price"  required lay-verify="required" placeholder="请输入价格" autocomplete="off" class="layui-input">
						</div>
					</div>
					
					<input type="hidden" name="image" />
					<div class="layui-form-item">
						<label class="layui-form-label">房源图片：</label>
						<div class="layui-input-block">
							<input type="file" name="file" />
							<!-- <button class="layui-btn test" lay-data="{url: '/a/'}">上传图片</button> -->
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">房源面积 ：</label>
						<div class="layui-input-block">
							<input type="text" name="area"  required lay-verify="required" placeholder="请输入面积" autocomplete="off" class="layui-input">
						</div>

					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">房源户型：</label>
						<div class="layui-input-block">
							<input type="text" name="huxing" required lay-verify="required" placeholder="请输入户型" autocomplete="off" class="layui-input">
						</div>

					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">房源状态：</label>
						<div class="layui-input-block">
							<input type="radio" name="is_rent" value="1" title="已被租借">
							<input type="radio" name="is_rent" value="0" title="未被租借">
						</div>

					</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">房源描述</label>
						<div class="layui-input-block">
							<textarea name="house_desc" placeholder="请输入描述" class="layui-textarea"></textarea>
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn layui-btn-normal" onclick="edit()" >立即提交</button>
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