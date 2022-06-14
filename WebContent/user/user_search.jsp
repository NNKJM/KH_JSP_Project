<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드톡</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/search.css">
</head>
<body>
	
	<jsp:include page="/include/main_top.jsp"></jsp:include>
	
	<c:set var="find" value="${Find}"/>
	
	<div class="search-top">
		<h1>상품검색</h1>
	</div>
	
	
	<hr width="50%" class="line-hr">
		<div class="search-middle">
			<h3>검색조건</h3>
			<form class="d-flex" method="post" action="<%=request.getContextPath()%>/user_search.do">
			        <input id="search-input" class="form-control me-2" type="search" aria-label="Search" name="search_product">
			        <button id="search-button" class="btn btn-outline-success" type="submit">검색하기</button>
			</form> 
		</div>
	<hr width="50%" class="line-hr">

	
	
	<div class="search_main">
		<!-- 검색된 제품이 존재하는 경우 -->
		<c:if test="${!empty find}">
			<c:forEach items="${find}" var="dto">
				<div class="card" style="width: 18rem;" id="card-main">
					  <a href="<%=request.getContextPath()%>/user_product_view.do?pnum=${dto.getPnum()}">
					  	<img src="<%=request.getContextPath()%>/upload/${dto.getPimage()}" class="card-img-top" alt="..." id="card-img">
					  </a>
					  <div class="card-body">
					    <p class="card-text">
					    	<span class="search_Pname">${dto.getPname()}</span><br><br>
					    	
					    	<span class="search_Price">
					    		<fmt:formatNumber value="${dto.getPrice()}"/>원 
					    	</span><br>
					    	
					    	<span class="search_Pdetails">${dto.getPdetails() }</span>
					    </p>
					  </div>
				</div>
			</c:forEach>
		</c:if>
		
		
		<!-- 검색된 제품이 없는경우 -->
		<c:if test="${empty find}">
			
			<div class="not-Search">
				<h3>검색된 제품이 없습니다.</h3>
			</div>
		
		</c:if>
		
	</div>
	
	
	<jsp:include page="/include/main_bottom.jsp"></jsp:include>
	
</body>
</html>