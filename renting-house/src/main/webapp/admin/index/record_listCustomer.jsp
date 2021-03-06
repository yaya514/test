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
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/layui/layui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/layer/layer.js"></script>
		
		<script type="text/javascript">
			
			function changePage(currentPage){
				var searchHandle = $("#searchHandle").val();
				location.href = "${pageContext.request.contextPath }/record_listCustomer.html?currentPage="
					+ currentPage + "";
			}
			
			
		</script>
		
	</head>

	<body>
		<div class="page-content-wrap">
			<form class="layui-form" action="">
				<div class="layui-form-item">
					<div class="layui-inline tool-btn">
						<div >
							<span style="color: blue;font-size: 20px">您近期的交易记录如下：</span>
						</div>
					</div>
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
							<th style="width: 7%"><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
							<th style="width: 10%">排序</th>
							<th style="width: 10%">用户姓名</th>
							<th style="width: 10%">用户账号</th>
							<th style="width: 15%">用户余额</th>
							<th style="width: 15%">余额变动</th>
							<th style="width: 15%">操作</th>
							<th style="width: 15% ">交易时间</th>
						</tr>
					</thead>
					<tbody>
					
					
						<c:forEach items="${page.list }" var="record" varStatus="var" >
							<tr>
								<td><input type="checkbox" name="rid" value="${record.rid }" lay-skin="primary" data-id="1"></td>
								<td >${var.count + page.index }</td>
								<td><a>${record.pname }</a></td>
								<td><a>${record.phone}</a></td>
								<td><a>${record.money}</a></td>
								<td><a>${record.changeMoney}</a></td>
								
								<td>
									<c:if test="${record.changeMoney > 0}">
										<a style="color: blue">充值</a>
									</c:if>
									<c:if test="${record.changeMoney < 0}">
										<a style="color: red">房租缴费</a>
									</c:if>
								</td>
								
								<td><a>${record.date}</a></td>
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