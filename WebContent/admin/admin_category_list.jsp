<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Category List Page</title><style type="text/css">
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
</head>
<body>
	<jsp:include page="/include/admin_top.jsp"></jsp:include>

	<div class="admin_main_container">
	<jsp:include page="/include/admin_sidebar.jsp"></jsp:include>

	<div class="admin_right_container" style="padding:50px;">
		<table border="3" cellspacing="0" width="600" bgcolor="white">
			<tr bgcolor="lightpink">
				<th>카테고리 번호     </th>
				<th>카테고리 코드     </th>
				<th>카테고리 이름     </th>
				<th></th>
				<th></th>
			</tr>
			<c:set var="list" value="${categoryList }" />
			<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.getCategory_num() }</td>
							<td>${dto.getCategory_code() }</td>
							<td>${dto.getCategory_name() }</td>
							<td><input type="button" value="수정" onclick="location.href='<%=request.getContextPath() %>/admin_category_update.do?num=${dto.getCategory_num() }'"></td>
							<td><input type="button" value="삭제" onclick="deleteCategory(${dto.getCategory_num() })"></td>
						</tr>
					</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5" align="center"> 아직 입력된 카테고리 리스트가 없습니다 </td>
				</tr>
			</c:if>
			<tr></tr>
			<td colspan="5" align="center" bgcolor=#EEEEEE>
			<input type="button" value="카테고리 추가" onclick="location.href='admin_category_input.do'"></td>
		</table>
	</div>
	<!-- admin_bottom.jsp include 할 것 -->
<script src="<%=request.getContextPath()%>/js/category_manage.js?ver=1"></script>
</body>
</html>