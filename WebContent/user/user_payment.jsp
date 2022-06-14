<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="css/bottom.css">
<link rel="stylesheet" type="text/css" href="css/payment.css">
<script type="text/javascript">
	
	function check(pwd) {
		var test = prompt("비밀번호를 입력하세요.");
		
		if(test == pwd) {
			location.href="user_order.do";
		} else {
			alert("비밀번호가 틀렸습니다.");
		}
	}
</script>
</head>
<body>
	<jsp:include page="../include/main_top.jsp" />
	
	<div class="payment">
		<header>
			<h1>주문서</h1>
			
			<h4>주문상품</h4>
			<hr class="title-hr">
		</header>		
		<div class="order-list">
			<table class="order-table">
			<c:set var="list" value="${cartList }" />
			<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
				
				<tr>
					<td class="table-img"> <img class="img-size" src="<%=request.getContextPath() %>/upload/${dto.getCart_pimage() }"> </td>
					<td class="table-pname"> &nbsp;&nbsp;&nbsp; ${dto.getCart_pname() } </td>
					<td>
						<c:set var="amount" value="${dto.getCart_pqty() }" />
						${amount } 개
					</td>
					<td>
						<c:set var="price" value="${dto.getCart_price() }" />
						<fmt:formatNumber value="${amount * price }"/> 원
					</td>
				</tr>
			<c:set var="total" value="${total + (price * amount) }" />
			</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">
						<h4>주문상품이 없습니다.</h4>
					</td>
				</tr>
			</c:if>
			</table>
		</div>
		
		<div class="info">
			<h4>주문자 정보</h4>
			<hr>
			
			<table>
			<c:set var="dto" value="${userDTO }" />
				<tr>
					<th>보내는 분</th>
					<td> ${dto.getUser_name() } </td>
				</tr>
				
				<tr>
					<th>휴대폰</th>
					<td> ${dto.getUser_phone() } </td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>
						${dto.getUser_email() } <br>
						<span>
							이메일을 통해 주문처리과정을 보내드립니다.<br>
							정보 변경은 마이페이지 > 개인정보 수정 메뉴에서 가능합니다.
						</span>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="delivery">
			<h4>배송 정보</h4>
			<hr>
			
			<table>
				<tr>
					<th>배송지</th>
					<td>
						${dto.getUser_address() }<br>
						${dto.getUser_detailaddress() }
					</td>
				</tr>
				<tr>
					<th>상세 정보</th>
					<td> ${dto.getUser_name() }, ${dto.getUser_phone() } </td>
				</tr>
			</table>
		</div>
		
		<div class="bill">
			<h4>결제금액</h4>
			<hr>
			
			<table>
				<tr>
					<th>주문금액</th>
					<td>
						<fmt:formatNumber value="${total }" /> 원
					</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td> 
						<fmt:formatNumber value="3000" /> 원
					</td>
				</tr>
				<tr>
					<th>최종결제금액</th>
					<td> 
						<fmt:formatNumber value="${total + 3000}" /> 원
					</td>
				</tr>
			</table>
		</div>
		
		<div class="pay-button">
			<button onclick="check('${dto.getUser_pwd()}');"><fmt:formatNumber value="${total + 3000}" />원 결제하기</button>
		</div>
	</div>
	
	<jsp:include page="../include/main_bottom.jsp" />
</body>
</html>