<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="css/bottom.css">
<link rel="stylesheet" type="text/css" href="css/order_list.css">
</head>
<body>

	<jsp:include page="../include/main_top.jsp" />
	
	<div class="order-list">
		<h1>주문내역</h1>
		
		<c:set var="list" value="${orderList }" />
		
		<div class="cartList">
			
			<c:if test="${!empty list }">
				<c:set var="date" value="${list.get(0).getOrder_date() }" />
				<h4>${date.substring(0, 10) } (${date.substring(11, 13) }시 ${date.substring(14, 16) }분)</h4>
				
				<hr class="title-hr">
				<table class="order-table">
				<c:forEach items="${list }" var="dto">
					
					<tr>
						<td class="table-img"> <img class="img-size" src="<%=request.getContextPath() %>/upload/${dto.getOrder_image() }"> </td>
						<td class="table-pname"> &nbsp;&nbsp;&nbsp; ${dto.getOrder_pname() } </td>
						<td>
							<c:set var="amount" value="${dto.getOrder_pqty() }" />
							${amount } 개
						</td>
						<td>
							<c:set var="price" value="${dto.getOrder_price() }" />
							<fmt:formatNumber value="${amount * price }"/> 원
						</td>
						
						<c:set var="total" value="${total + (price * amount) }" />
					</tr>
					
				</c:forEach>
				</table>
				
				<div class="cartResult">
					
					
					<div class="cart_amount">
						
						<h4>결제정보</h4>
						
						<hr>
						
						<dl class="bill">
							<dt>상품금액</dt>
							<dd>
								<span>
									<fmt:formatNumber value="${total }"/> 원
								</span>
							</dd>
						</dl>	
						<dl class="bill">
							<dt>배송비</dt>
							<dd>
								<span>
									<fmt:formatNumber value="3000"/> 원
								</span>
							</dd>
						</dl>
						<dl class="bill">
							<dt>결제금액</dt>
							<dd>
								<span>
									<fmt:formatNumber value="${total + 3000}"/> 원
								</span>
							</dd>
						</dl>
					
					</div>
					
					<div class="cart_delivery">
						<h4>배송정보</h4>
						
						<hr>
						
						<table >
						<c:set var="dto" value="${userDTO }" />
							<tr>
								<th>받는 분</th>
								<td> ${dto.getUser_name() } </td>
							</tr>
							
							<tr>
								<th>휴대폰</th>
								<td> ${dto.getUser_phone() } </td>
							</tr>
							
							<c:set var="userAddr" value="${list.get(0).getOrder_userAddr() }" />
							<c:set var="detailAddr" value="${list.get(0).getOrder_detailAddr() }" />
						
							<tr>
								<th>주소</th>
								<td>
									${userAddr } <br>
									<span> ${detailAddr } </span>
								</td>
							</tr>
						</table>
						
					</div>
				</div>
			</c:if>
			
			<c:if test="${empty list }">
				<h4>주문 내역이 없습니다.</h4>
			</c:if>
			
		</div>
	</div>
	<jsp:include page="../include/main_bottom.jsp" />
		
</body>
</html>