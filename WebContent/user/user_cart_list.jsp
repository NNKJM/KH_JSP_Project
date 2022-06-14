<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="css/bottom.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/cart_list.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>
<body>
	
	<jsp:include page="../include/main_top.jsp" />
	
	<div class="cart-list">
	
		<h1>장바구니</h1>
		
		<form method="post" action="<%=request.getContextPath() %>/user_order_maybe.do">
			<c:set var="list" value="${cartList }" />
			
			<div class="cart-form">
				<div class="cart-left">
					<div class="cart-delete">
						<c:if test="${!empty list }">
							<a href="<%=request.getContextPath() %>/user_cart_deleteAll.do"
								onclick ="return confirm('장바구니를 비우시겠습니까?')">전체삭제</a>
						</c:if>
						<c:if test="${empty list }">
							<a href="#" onclick ="return alert('장바구니가 비어있습니다!')">전체삭제</a>
						</c:if>
					</div>
					
					<hr class="title-hr">
					
					<div class="cart-table">
						<table>
						<c:if test="${!empty list }">
						<c:forEach items="${list }" var="dto">
						<c:set var="price" value="${dto.getCart_price() }" />
							
							<tr>
								<td class="table-img"> 
									<img class="img-size" src="<%=request.getContextPath() %>/upload/${dto.getCart_pimage() }"> 
								</td>
								<td class="table-pname"> &nbsp;&nbsp;&nbsp;${dto.getCart_pname() } </td>
								<td>
									<c:set var="amount" value="${dto.getCart_pqty() }" />
									${amount } 개
								</td>
								<td>
									<fmt:formatNumber value="${amount * price }"/> 원
								</td>
								<td> 
									<a class="table-delete" href="<%=request.getContextPath() %>
									/user_cart_delete.do?num=${dto.getCart_num() }">X</a>
								</td>
								
								<c:set var="total" value="${total + (price * amount) }" />
							</tr>
							
							<input type="hidden" name="pnum" value="${dto.getCart_pnum() }">
							<input type="hidden" name="pname" value="${dto.getCart_pname() }">
							<input type="hidden" name="pimage" value="${dto.getCart_pimage() }">
							<input type="hidden" name="pqty" value="${dto.getCart_pqty() }">
							<input type="hidden" name="price" value="${dto.getCart_price() }">
							<input type="hidden" name="total" value="${price * amount }">
							
						</c:forEach>
						</c:if>
						
						<c:if test="${empty list }">
							<tr class="empty-cart">
								<td colspan="5">
									<div>
										<h3>장바구니에 담긴 상품이 없습니다</h3>
									</div>
								</td>
							</tr>
						</c:if>
						</table>
					</div>
				</div>
				
				<hr>
				
				<div class="cart-result">
					<div class="cart_delivery">
					<c:set var="userAddr" value="${userAddr }" />
					<c:set var="userDAddr" value="${userDAddr }" />
						
						<h4><i class="fa-solid fa-map-pin"></i> 배송지</h4>
						<p> ${userAddr }<br>${userDAddr } </p>
						<hr>
					</div>
					
					<div class="cart_amount">
					<c:if test="${!empty list }">
						<dl class="bill">
							<dt>상품금액</dt>
							<dd>
								<span class="bill-price">
									<fmt:formatNumber value="${total }"/> 원
								</span>
							</dd>
						</dl>
						<dl class="bill">
							<dt>배송비</dt>
							<dd>
								<span class="bill-price">
									<fmt:formatNumber value="3000"/> 원
								</span>
							</dd>
						</dl>
						<dl class="bill">
							<dt>결제예정금액</dt>
							<dd>
								<span class="bill-price">
									<fmt:formatNumber value="${total + 3000}"/> 원
								</span>
							</dd>
						</dl>
						<div class="cart_submit">
							<input id="input" type="submit" value="주문하기">
						</div>
					</c:if>
					<c:if test="${empty list }">
						<dl class="bill">
							<dt>상품금액</dt>
							<dd>
								<span>
									0 원
								</span>
							</dd>
						</dl>
						<dl class="bill">
							<dt>배송비</dt>
							<dd>
								<span>
									0 원
								</span>
							</dd>
						</dl>
						<dl class="bill">
							<dt>결제예정금액</dt>
							<dd>
								<span>
									0 원
								</span>
							</dd>
						</dl>
						<div class="cart_submit">
							<input id="input-disabled" type="submit" value="상품을 담아주세요" disabled="disabled">
						</div>
					</c:if>
					</div>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../include/main_bottom.jsp" />
	
	<script src="https://kit.fontawesome.com/e19f7e9074.js" crossorigin="anonymous"></script>
</body>
</html>