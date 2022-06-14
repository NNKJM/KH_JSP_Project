<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main_select.css">
</head>
<body>
	
	<jsp:include page="/include/main_top.jsp"></jsp:include>
	
	<c:set var="famouslist" value="${FamousList}"/>
	
	<div class="main_top">
		<h3>인기상품 모음</h3>
	</div>
	
	<div class="main_select">
		<!-- 검색된 제품이 존재하는 경우 -->
		<c:if test="${!empty famouslist}">
			<c:forEach items="${famouslist}" var="dto">
				<div class="card" style="width: 18rem;" id="card-main">
					  <a href="<%=request.getContextPath()%>/user_product_view.do?pnum=${dto.getPnum()}">
					  	<img src="<%=request.getContextPath()%>/upload/${dto.getPimage()}" class="card-img-top" alt="..." id="card-img">
					  </a>
					  
					  <div class="card-body">
					    <p class="card-text">
					    	<span class="main_Pname">${dto.getPname()}</span><br><br>
					    	
					    	<span class="main_Price">
					    		<fmt:formatNumber value="${dto.getPrice()}"/>원 
					    	</span><br>
					    	
					    	<span class="main_Pdetails">${dto.getPdetails() }</span>
					    </p>
					  </div>
				</div>
			</c:forEach>
		</c:if>
		
		
		<!-- 검색된 제품이 없는경우 -->
		<c:if test="${empty famouslist}">
			
			<div class="not-Search">
				<h3>검색된 제품이 없습니다.</h3>
			</div>
		
		</c:if>
		
	</div>
	
	<jsp:include page="/include/main_bottom.jsp"></jsp:include>
	
	
</body>
</html>