<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main_select.css">
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="/include/main_top.jsp"></jsp:include>
	<c:set var="plist" value="${pList}" />

	<c:set var="clist_A001" value="${cList_A001}" />
	<c:set var="clist_A002" value="${cList_A002}" />
	<c:set var="clist_A003" value="${cList_A003}" />
	<c:set var="clist_A004" value="${cList_A004}" />

	<c:set var="clist_B001" value="${cList_B001}" />
	<c:set var="clist_B002" value="${cList_B002}" />
	<c:set var="clist_B003" value="${cList_B003}" />

	<c:set var="clist_C001" value="${cList_C001}" />
	<c:set var="clist_C002" value="${cList_C002}" />

	<c:set var="clist_D001" value="${cList_D001}" />
	<c:set var="clist_D002" value="${cList_D002}" />
	<c:set var="clist_D003" value="${cList_D003}" />
	
	<c:set var="clist_Z001" value="${cList_Z001}" />

	<div id="categoryList" align="left">
		<ul>
			<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do">전체</a>
			</li>
			<c:if test="${!empty clist_A001}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=A001">농산물</a>
					<ul>
						<c:forEach items="${clist_A001}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_A002}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=A002">수산물</a>
					<ul>
						<c:forEach items="${clist_A002}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_A003}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=A003">축산물</a>
					<ul>
						<c:forEach items="${clist_A003}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_A004}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=A004">간식</a>
					<ul>
						<c:forEach items="${clist_A004}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_B001}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=B001">생수·음료수</a>
					<ul>
						<c:forEach items="${clist_B001}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_B002}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=B002">커피·차</a>
					<ul>
						<c:forEach items="${clist_B002}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_B003}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=B003">주류</a>
					<ul>
						<c:forEach items="${clist_B003}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_C001}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=C001">화장품</a>
					<ul>
						<c:forEach items="${clist_C001}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_C002}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=C002">세면도구</a>
					<ul>
						<c:forEach items="${clist_C002}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_D001}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=D001">생활용품</a>
					<ul>
						<c:forEach items="${clist_D001}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_D002}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=D002">주방용품</a>
					<ul>
						<c:forEach items="${clist_D002}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_D003}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=D003">가전제품</a>
					<ul>
						<c:forEach items="${clist_D003}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>

			<c:if test="${!empty clist_Z001}">
				<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=Z001">기타 제품</a>
					<ul>
						<c:forEach items="${clist_Z001}" var="dto">
							<li><a href="<%=request.getContextPath()%>/main_product_exhibit.do?code=${dto.getCategory_code() }">${dto.getCategory_name() }</a></li>
						</c:forEach>
					</ul></li>
			</c:if>
	</div>


 	<div class="main_select">
		<!-- 검색된 제품이 존재하는 경우 -->
		<c:if test="${!empty plist}">
			<c:forEach items="${plist}" var="dto">
				<div class="card" style="width: 18rem;" id="card-main">
					<a href="<%=request.getContextPath()%>/user_product_view.do?pnum=${dto.getPnum()}"> 
						<img src="<%=request.getContextPath()%>/upload/${dto.getPimage()}"
						class="card-img-top" alt="..." id="card-img">
					</a>
					<div class="card-body">
						<p class="card-text">
							<span class="main_Pname">${dto.getPname()}</span><br>
							<br> <span class="main_Price"> <fmt:formatNumber
									value="${dto.getPrice()}" />원
							</span><br> <span class="main_Pdetails">${dto.getPdetails() }</span>
						</p>
					</div>
				</div>
			</c:forEach>
		</c:if>

		<!-- 검색된 제품이 없는경우 -->
		<c:if test="${empty plist}">
			<div class="not-Search">
				<h3>검색된 상품이 없습니다.</h3>
			</div>
		</c:if>

	</div>
	<jsp:include page="/include/main_bottom.jsp"></jsp:include>
</body>
</html>