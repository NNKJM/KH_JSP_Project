<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.admin_main_container{
	display: flex;
	flex-direction: row;
	width: 1850px;
	height: 100%;
	margin: 0 auto;
	margin-bottom: 50px;
	background-color: lightgray;
}
.admin_right_container{
	display: block;
	padding: 100px 50px;
	width: 1200px;
}

.admin_right_container h1{
	width: 1500px;
	text-align:center;
}

.input_button{
	width: 1500px;
	text-align: center;
	margin-top: 50px;
}

.input_button input{
	width: 200px;
	height: 50px;
	border-radius: 10px;
	font-weight: bold;
	
	
}

</style>
</head>
<body>
	<jsp:include page="/include/admin_top.jsp"></jsp:include>
	<div class="admin_main_container">
	<jsp:include page="/include/admin_sidebar.jsp"></jsp:include>


	<div class="admin_right_container">
		
		<h1>Product 전체 페이지 리스트</h1>
		<br><br>
		
		<div class="admin_list_page">
			<table border="1" cellspacing="0" width="1500px"> 
				<tr>
					<th>제품번호</th><th>제품이름</th>
					<th>제품카테고리코드</th><th>제품스펙</th>
					<th>제품이미지</th><th>제품수량</th>
					<th>제품가격</th><th>제품제조사</th>
					<th>제품내용</th><th>제품등록일자</th>
				
				</tr>
				
				<c:set var="list" value="${productList}"/>
				
				<c:if test="${!empty list}">
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.getPnum() }</td>
							<td>${dto.getPname() }</td>
							<td>${dto.getPcategory_fk() }</td>
							<td>${dto.getPspec() }</td>
							
							<td>
								<img src="<%=request.getContextPath()%>/upload/${dto.getPimage()}" 
											width="60" height="50">
							</td>
							
							<td>${dto.getPqty() }</td>
							<td>${dto.getPrice() }</td>	
							<td>${dto.getPcompany() }</td>
							<td>${dto.getPdetails() }</td>
							<td>${dto.getPinputdate() }</td>
							
							<td>
								<a href="<%=request.getContextPath()%>/admin_product_update.do?pnum=${dto.getPnum()}">수정</a>
									&nbsp;&nbsp; | &nbsp;&nbsp;
								<a href="<%=request.getContextPath()%>/admin_product_delete.do?pnum=${dto.getPnum()}">삭제</a>
							</td>
						</tr>
					</c:forEach>	
				</c:if>
				
				<c:if test="${empty list }">
					<tr>
						<td colspan="10" align="center">				
							<h3>검색된 제품리스트가 없습니다.</h3>
						</td>
					</tr>
				</c:if>
			</table>
			
			<div class="input_button">
				<input type="button" value="제품등록"
					onclick="location.href='admin_product_input.do'">
			</div>
			
		</div>
	</div>

	</div>
</body>
</html>