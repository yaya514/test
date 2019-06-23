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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/admin/css/admin.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/layui/lay/modules/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/layui/layui.js"></script>
		<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
		
		
		<script type="text/javascript">
			function showName(id){
				
				var name = $("#"+id).val();
				
				 layer.open({
					  title: '房源名称'
					  ,content: name
					});
			}
			function showDesc(count){
				
				var rentItem_desc = $("#rentItem_desc"+count).val();
				
				 layer.open({
					  title: '房源描述'
					  ,content: rentItem_desc
					});
			}
			
			function showImage(count){
				var image = $("#image"+count).val();
				
				 layer.open({
					  
					  type:1,
			          shift: 2,
			          shade:0,
			          title:'房源图片',
			          shadeClose:true,
			          content: "<image src="+image+"/>",
			          area: ['600px', '500px']

					});
			}
			
			function deleteRentItem(id){
				layer.confirm(	
								'你是否确定要删除该租借订单?',
								{icon: 3, title:'提示'},
								function(){
								location.href="${pageContext.request.contextPath }/deleteRentItem.html?hid="+id+"";
					});

			}
			
			function showTip(){
				
				layer.open({
					  title: '系统消息'
					  ,content: "欠费信息已发送给该用户！"
					});
				
			}
			
			function changePage(currentPage){
				var searchName = $("#searchName").val();
				location.href = "${pageContext.request.contextPath }/rentItem_list.html?currentPage="
					+ currentPage + "&searchName="+searchName;
			}
			
			function search(){
				var searchName = $("#searchName").val();
				location.href = "${pageContext.request.contextPath }/rentItem_list.html?searchName="+searchName;
			}
			
			function collectMoney(phone,money,price){
				
				//ajax请求 
				$.post("collectMoney.action", //url 
						{"phone" : phone,
						 "money" : money,
						 "price" : price
						} , //data 
						  function(data) { //请求成功回调该函数
							var v = window.confirm("你是否确定收取该用户租金吗?");
							if(v){
								layer.msg(	
										'收取成功！',
										{icon: 1, title:'系统提示'},
										function(){
											
										top.location.href="${pageContext.request.contextPath }/admin/index/index.jsp";
								}); 
							}
					   });
				
				
			}
		</script>
		
	</head>

	<body>
		<div class="page-content-wrap">
			<form class="layui-form" action="" >
				<div class="layui-form-item">
					<div class="layui-inline tool-btn">
						<!-- 添加按钮 -->
						<%-- <a href="${pageContext.request.contextPath }/admin/index/rentItem_add.jsp" class="layui-btn layui-btn-mini layui-btn-normal  go-btn" data-id="1"><i class="layui-icon">&#xe654;</i>添加</a> --%>
					</div>
					<div class="layui-inline">
						<input type="text" id="searchName" name="searchName" value="${page.params.searchName }" placeholder="请输入名字" autocomplete="off" class="layui-input">
					</div>
					<button class="layui-btn layui-btn-normal" lay-submit="search">搜索</button>
				</div>
			</form>
			<div class="layui-form" id="table-list">
				<table class="layui-table" lay-even lay-skin="nob">
					<colgroup>
						<col width="50">
						<col class="hidden-xs" width="50">
						<col class="hidden-xs" width="100">
						<col >
						<col class="hidden-xs" width="200">
						<col width="80">
						<col width="150">
					</colgroup>
					<thead>
						<tr>
							<th style="width: 5%"><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
							<th style="width: 5%">排序</th>
							<th style="width: 10%">租户姓名</th>
							<th style="width: 10%">租户电话</th>
							<th style="width: 10%">租户余额</th>
							<th style="width: 17%">房源名称</th>
							<th style="width: 10%">房源图片</th>
							<th style="width: 10%">房源价格</th>
							<th style="width: 10%">房源状态</th>
							<th style="width: 13%">操作</th>
						</tr>
					</thead>
					<tbody>
					
					
						<c:forEach items="${page.list }" var="rentItem" varStatus="var" >
							<tr>
								<td><input type="checkbox" name="hid" value="${rentItem.hid }" lay-skin="primary" data-id="1"></td>
								<td >${var.count + page.index }</td>
								<td><a>${rentItem.pname }</a></td>
								<td><a>${rentItem.phone }</a></td>
								
								<c:if test="${rentItem.money > 0}">
									<td><a style="color: blue;">${rentItem.money }</a></td>
								</c:if>
								<c:if test="${rentItem.money <= 0}">
									<td><a style="color: red;">${rentItem.money }</a></td>
								</c:if>
								
								<%-- <td>
									<input type="hidden" id="${rentItem.id }" name="name" value="${rentItem.name }" />
									<button onclick="showName(${rentItem.id })" class="layui-btn layui-btn-mini layui-btn-normal table-list-status" data-status='1'>显示</button>
								</td>  --%>
								
								<td><a>${rentItem.name }</a></td>
								
								<td>
									<input type="hidden" id="image${var.count }" name="image" value="${rentItem.image }" />
									<button onclick="showImage(${var.count })" class="layui-btn layui-btn-mini layui-btn-normal table-list-status" data-status='1'>显示</button>
								</td>
								<td><a>${rentItem.price }元/每月</a></td>
								
								<td>
									<c:if test="${rentItem.is_rent ==0}">
										<a style="color: blue">未被租借</a>
									</c:if>
									<c:if test="${rentItem.is_rent ==1}">
										<a style="color: red">已被租借</a>
									</c:if>
								</td>
								<td>
									<div class="layui-inline">
										<c:if test="${rentItem.money > 0}">
											<a href="javascript:void(0)" onclick="collectMoney(${rentItem.phone},${rentItem.money},${rentItem.price})" class="layui-btn layui-btn-mini layui-btn-normal  go-btn" data-id="1"><i class="layui-icon">&#xe642;</i>收取房租</a>
										</c:if>
										<c:if test="${rentItem.money <= 0}">
											<a href="javascript:void(0)" onclick="showTip()" class="layui-btn layui-btn-mini layui-btn-danger  go-btn" data-id="1"><i class="layui-icon">&#xe642;</i>提醒缴费</a>
										</c:if>
										<button onclick="deleteRentItem(${rentItem.hid})" class="layui-btn layui-btn-mini layui-btn-danger del-btn" data-id="1" data-url="del.html"><i class="layui-icon">&#xe640;</i></button>
									</div>
								</td>
							</tr>
						</c:forEach>
					
						
					</tbody>
				</table>
				<!-- 分页 -->
				  <div class="gridItem" style="padding: 5px; width: 400px; float: left; text-align: left; height: 20px; font-size: 15px;" > 
			                    共<span id="spanTotalInfor" style="color: blue">{  ${page.totalCount}  }</span>条记录  &nbsp;&nbsp;    
			                    当前第<span id="spanPageNum" style="color: blue">{  ${page.currentPage}  }</span>页   &nbsp;&nbsp;
			                    共<span id="spanTotalPage" style="color: blue">{  ${page.totalPage}  }</span>页
			            </div>
			        <div class="gridItem" style="margin-left:50px;  padding: 5px; width: 400px; float: right; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">   
			            <a style="color:blue" href="javascript:void(0)" onclick="changePage(1)" >
			            	<span id="spanFirst">首页</span> &nbsp;
			            </a>
			            
			            <c:if test="${page.currentPage ==1}">
			            	<span id="spanPre">上一页</span>&nbsp; 
			            </c:if>
			            <c:if test="${page.currentPage !=1}">
				            <a style="color:blue" href="javascript:void(0)" onclick="changePage(${page.currentPage-1})" >
				            	<span id="spanPre">上一页</span>&nbsp; 
				            </a> 
			            </c:if>
			            
			            <c:if test="${page.currentPage ==page.totalPage}">
			            	<span id="spanPre">下一页</span>&nbsp; 
			            </c:if>
			             <c:if test="${page.currentPage !=page.totalPage}">
			            	<a style="color:blue" href="javascript:void(0)" onclick="changePage(${page.currentPage+1})">
			            		<span id="spanNext">下一页</span> &nbsp;  
			           		</a>
			            </c:if>
			            
			            <a style="color:blue" href="javascript:void(0)" onclick="changePage(${page.totalPage})">
			            	<span  id="spanLast">尾页</span> 
			            </a>
				 	 </div> 
			</div>
		</div>
		<script src="${pageContext.request.contextPath }/static/admin/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/static/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<script>
			layui.use(['form', 'jquery', 'layer', 'dialog'], function() {
				var $ = layui.jquery;

				//修改状态
				$('#table-list').on('click', '.table-list-status', function() {
					var That = $(this);
					var status = That.attr('data-status');
					var id = That.parent().attr('data-id');
					if(status == 1) {
						That.removeClass('layui-btn-normal').addClass('layui-btn-warm').html('隐藏').attr('data-status', 2);
					} else if(status == 2) {
						That.removeClass('layui-btn-warm').addClass('layui-btn-normal').html('显示').attr('data-status', 1);

					}
				})

			});
		</script>
	</body>

</html>