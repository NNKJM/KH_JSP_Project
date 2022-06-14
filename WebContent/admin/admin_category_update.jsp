<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Category Update</title>
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
</head>
<body>
	<jsp:include page="/include/admin_top.jsp"></jsp:include>

	<div class="admin_main_container">
	<jsp:include page="/include/admin_sidebar.jsp"></jsp:include>

	<div class="admin_right_container" style="padding:50px;">
		<form method="post" action="<%=request.getContextPath() %>/admin_category_update_ok.do">
			<c:set var="dto" value="${Cont }" />
			<input type="hidden" name="category_num" value="${dto.getCategory_num() }">
			<table border="1" cellspacing="0" width="350" bgcolor="white">
				<tr>
					<th>카테고리 코드</th>
					<td>
						<input value="${dto.getCategory_code() }" readonly>
					</td>
				</tr>
				<tr>
					<th>카테고리 이름</th>
					<td><input name="category_name" value="${dto.getCategory_name() }">
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="카테고리 수정">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="재입력">
				</tr>
			</table>
		</form>
	</div>
	<!-- admin_bottom.jsp include 할 것 -->
</body>
</html>