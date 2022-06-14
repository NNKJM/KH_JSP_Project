<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출현황</title>
<style type="text/css">
.admin_main_container{
	display: flex;
	flex-direction: row;
	width: 1150px;
	height: 100%;
	margin: 0 auto;
	margin-bottom: 50px;
	background-color: lightgray;
}
.admin_right_container{
	display: block;
}
</style>
<link rel="stylesheet" type="text/css" href="css/sales.css">
</head>
<body>
	<jsp:include page="/include/admin_top.jsp"></jsp:include>

	<div class="admin_main_container">
	<jsp:include page="/include/admin_sidebar.jsp"></jsp:include>

	<c:set var="todaySales" value="${todaySales }"/>
	<c:set var="today" value="${today }"/>
	<c:set var="MSales" value="${monthlyTotal }"/>
	<c:set var="MCount" value="${monthlyCount }"/>
	
		<div class="admin_right_container">
			
			<h2>매출현황 조회</h2>
			<br>
			<h4>
				${today.substring(0, 4) }년 ${today.substring(5, 7) }월 
				<span>
					&nbsp;&nbsp; 주문수 : ${MCount } &nbsp;
					매출 : <fmt:formatNumber value="${MSales }"/>
				</span>
			</h4>
			<br>
			
			<div class="form">
				<strong>
					${today.substring(0, 4) }년 ${today.substring(5, 7) }월 ${today.substring(8, 10) }일 매출현황
				</strong>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<form method="post" action="<%=request.getContextPath() %>/admin_sales_list.do">
					<input type="date" name="date">
						
					<input type="submit" value="조회">
				</form>
			</div>
				
			<table>
				<tr>
					<th>주문일</th> <th>주문수</th> <th>주문합계</th>
				</tr>
				
				<tr>
					<td> ${today }</td>
					<td> ${todaySales.getSales_count() }건</td>
					<td> 
						<fmt:formatNumber value="${todaySales.getSales_total() }"/>
					</td>
				</tr>
			</table>
			
		</div>

	</div>
</body>
</html>