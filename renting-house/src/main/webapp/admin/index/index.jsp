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
		<title>沛沛租房网</title>
		<link rel="stylesheet" type="text/css" href="../../static/admin/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="../../static/admin/css/admin.css"/>
		
		<script type="text/javascript">
			function logout(){
				
				
				layer.confirm(	
						'你是否确定要退出登录?',
						{icon: 3, title:'提示'},
						function(){
						location.href="${pageContext.request.contextPath }/login_1.html";
				});
			}
		</script>
		
	</head>
	<body>
		<div class="main-layout" id='main-layout'>
			<!--侧边栏-->
			<div class="main-layout-side">
				<div class="m-logo">
				</div>
				<ul class="layui-nav layui-nav-tree" lay-filter="leftNav">
				  
				  
				  <c:if test="${sessionScope.personal.power == 0 }">
				  	 <li class="layui-nav-item">
				     	<a href="javascript:;" data-url="${pageContext.request.contextPath }/house_list.html" data-id='1' data-text="房源管理"><i class="iconfont">&#xe600;</i>房源管理</a>
				  	 </li>
				  </c:if>
				  <c:if test="${sessionScope.personal.power == 1 }">
				 	 <li class="layui-nav-item">
				     	<a href="javascript:;" data-url="${pageContext.request.contextPath }/house_listCustomer.html" data-id='1' data-text="房源查看"><i class="iconfont">&#xe600;</i>房源查看</a>
				  	 </li>
				  </c:if>
				  
				  <c:if test="${sessionScope.personal.power == 0 }">
					  <li class="layui-nav-item">
					    <a href="javascript:;" data-url="${pageContext.request.contextPath }/personal_list.html" data-id='2' data-text="租户管理"><i class="iconfont">&#xe607;</i>租户管理</a>
					  </li>
				  </c:if>
				  <c:if test="${sessionScope.personal.power == 1 }">
				  	  <li class="layui-nav-item">																														
				    	<a href="javascript:;" data-url="${pageContext.request.contextPath }/personalHouse_list.html" data-id='2' data-text="我的租房"><i class="iconfont">&#xe607;</i>我的租房</a>
				 	  </li>
				  </c:if>
				  
				  <c:if test="${sessionScope.personal.power == 0 }">
					  <li class="layui-nav-item">																														
				    	<a href="javascript:;" data-url="${pageContext.request.contextPath }/record_list.html" data-id='3' data-text="交易记录"><i class="iconfont">&#xe608;</i>交易记录</a>
			 	 	  </li>
				  </c:if>
				  
				  <c:if test="${sessionScope.personal.power == 1 }">
				  	  <li class="layui-nav-item">																														
			    	    <a href="javascript:;" data-url="${pageContext.request.contextPath }/record_listCustomer.html" data-id='3' data-text="我的交易"><i class="iconfont">&#xe608;</i>我的交易</a>
			 	 	  </li>
				  </c:if>
			  	  
			 	  
				  <c:if test="${sessionScope.personal.power == 0 }">
					  	<li class="layui-nav-item">
					    <a href="javascript:;" data-url="${pageContext.request.contextPath }/rentItem_list.html" data-id='4' data-text="租金管理"><i class="iconfont">&#xe604;</i>租金管理</a>
				  </li>
				  </c:if>
				  <c:if test="${sessionScope.personal.power == 1 }">
				  		<li class="layui-nav-item">
				    	<a href="javascript:;" data-url="${pageContext.request.contextPath }/personal_money.html" data-id='4' data-text="我的余额"><i class="iconfont">&#xe604;</i>我的余额</a>
				  </li>
				  </c:if>
				  
				  
				  <li class="layui-nav-item">
				    <a href="javascrpit:;" data-url="${pageContext.request.contextPath }/admin-info.html" data-id='5' data-text="个人信息"><i class="iconfont">&#xe606;</i>个人信息</a>
				  </li>
				  
				</ul>
			</div>
			<!--右侧内容-->
			<div class="main-layout-container">
				<!--头部-->
				<div class="main-layout-header">
					<div class="menu-btn" id="hideBtn">
						<a href="javascript:;">
							<span class="iconfont">&#xe60e;</span>
						</a>
					</div>
					<ul class="layui-nav" lay-filter="rightNav">
					  <li class="layui-nav-item">
					  <c:if test="${sessionScope.personal.power == 0 }">
					  	 <a href="javascript:;" style="color: blue" data-url="${pageContext.request.contextPath }/house_list.html" data-id='6' data-text="房源查看">
					  		<i class="iconfont">&#xe600;</i>
					  	 </a>
					   </c:if>
					   <c:if test="${sessionScope.personal.power == 1 }">
					  	 <a href="javascript:;" style="color: blue" data-url="${pageContext.request.contextPath }/house_listCustomer.html" data-id='6' data-text="房源查看">
					  		<i class="iconfont">&#xe600;</i>
					  	 </a>
					   </c:if>
					  </li>
					  
					  <li class="layui-nav-item">
					    <a href="javascript:;" style="color: blue;" data-url="admin-info.jsp" data-id='5' data-text="个人信息">${sessionScope.personal.pname }</a>
					  </li>
					  <li class="layui-nav-item"><a style="color: red" href="javascript:;" onclick="logout()">退出</a></li>
					</ul>
				</div>
				<!--主体内容-->
				<div class="main-layout-body">
					<!--tab 切换-->
					<div class="layui-tab layui-tab-brief main-layout-tab" lay-filter="tab" lay-allowClose="true">
					  <ul class="layui-tab-title">
					    <li class="layui-this welcome">后台主页</li>
					  </ul>
					  <div class="layui-tab-content">
					    <div class="layui-tab-item layui-show" style="background: #f5f5f5;">
					    	<!--1-->
					    	<iframe src="welcome.jsp" width="100%" height="100%" name="iframe" scrolling="auto" class="iframe" framborder="0"></iframe>
					    	<!--1end-->
					    </div>
					  </div>
					</div>
				</div>
			</div>
			<!--遮罩-->
			<div class="main-mask">
				
			</div>
		</div>
		<script type="text/javascript">
			var scope={
				link:'./welcome.jsp'
			}
		</script>
		<script src="../../static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../static/admin/js/main.js" type="text/javascript" charset="utf-8"></script>
		
	</body>
</html>
